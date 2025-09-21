<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Models\ProductionPlan;
use App\Models\ProductionOrder;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;

class ProductionPlanController extends Controller
{
    /**
     * Menampilkan daftar semua rencana produksi.
     */
    public function index()
    {
        // Mendapatkan rencana produksi dengan relasi produk dan pengguna (pembuatnya)
        $plans = ProductionPlan::with(['product', 'user'])->get();

        return response()->json([
            'status' => 'success',
            'plans' => $plans,
        ]);
    }

    /**
     * Membuat rencana produksi baru.
     * Hanya bisa diakses oleh Staff PPIC.
     */
    public function store(Request $request)
    {
        $request->validate([
            'product_id' => 'required|exists:products,id',
            'quantity' => 'required|integer|min:1',
            'due_date' => 'required|date|after_or_equal:today',
            'notes' => 'nullable|string',
        ]);

        $plan = ProductionPlan::create([
            'user_id' => Auth::id(), // ID pengguna yang sedang login
            'product_id' => $request->product_id,
            'quantity' => $request->quantity,
            'due_date' => $request->due_date,
            'status' => 'menunggu persetujuan',
            'notes' => $request->notes,
        ]);

        return response()->json([
            'status' => 'success',
            'message' => 'Rencana produksi berhasil dibuat. Menunggu persetujuan manajer.',
            'plan' => $plan,
        ], 201);
    }

    /**
     * Menyetujui rencana produksi.
     * Hanya bisa diakses oleh Manajer.
     */
    public function approve($id)
    {
        // Cari rencana produksi berdasarkan ID
        $plan = ProductionPlan::find($id);

        // Jika rencana tidak ditemukan atau sudah diproses, berikan pesan error
        if (!$plan || in_array($plan->status, ['disetujui', 'ditolak', 'diproses'])) {
            return response()->json([
                'status' => 'error',
                'message' => 'Rencana tidak valid untuk disetujui.'
            ], 400);
        }

        DB::transaction(function () use ($plan) {
            // Ubah status rencana menjadi 'disetujui'
            $plan->status = 'disetujui';
            $plan->save();

            // Buat order produksi baru
            $order = ProductionOrder::create([
                'production_plan_id' => $plan->id,
                'target_completion_date' => $plan->due_date,
                'status' => 'menunggu'
            ]);
        });

        return response()->json([
            'status' => 'success',
            'message' => 'Rencana produksi berhasil disetujui dan order produksi telah dibuat.'
        ]);
    }

    /**
     * Menolak rencana produksi.
     * Hanya bisa diakses oleh Manajer.
     */
    public function reject($id)
    {
        $plan = ProductionPlan::find($id);

        // Jika rencana tidak ditemukan atau sudah diproses, berikan pesan error
        if (!$plan || in_array($plan->status, ['disetujui', 'ditolak', 'diproses'])) {
            return response()->json([
                'status' => 'error',
                'message' => 'Rencana tidak valid untuk ditolak.'
            ], 400);
        }

        // Ubah status rencana menjadi 'ditolak'
        $plan->status = 'ditolak';
        $plan->save();

        return response()->json([
            'status' => 'success',
            'message' => 'Rencana produksi berhasil ditolak.'
        ]);
    }
}
