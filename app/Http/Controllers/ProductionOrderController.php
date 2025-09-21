<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Models\ProductionOrder;
use App\Models\ProductionLog;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Log;

class ProductionOrderController extends Controller
{
    /**
     * Menampilkan daftar semua order produksi.
     */
    public function index()
    {
        // Mendapatkan order produksi dengan relasi ke rencana dan produk
        $orders = ProductionOrder::with(['productionPlan.product', 'productionLogs'])->get();

        return response()->json([
            'status' => 'success',
            'orders' => $orders,
        ]);
    }

    /**
     * Mengubah status order menjadi 'sedang dikerjakan'.
     * Hanya bisa diakses oleh Staff Produksi.
     */
    public function start($id)
    {
        $order = ProductionOrder::find($id);

        if (!$order || $order->status !== 'menunggu') {
            return response()->json([
                'status' => 'error',
                'message' => 'Order tidak valid untuk dimulai.'
            ], 400);
        }

        $order->status = 'sedang dikerjakan';
        $order->save();

        // --- Tambahkan kode debugging ini ---
    $logData = [
        'production_order_id' => $order->id,
        'user_id' => Auth::id(), // Periksa apakah ini null
        'status_change' => 'sedang dikerjakan',
        'notes' => 'Pengerjaan order dimulai.'
    ];

    Log::info('Data log untuk start order:', $logData);
    // --- Hapus baris di atas setelah debugging selesai ---

    ProductionLog::create($logData);

        return response()->json([
            'status' => 'success',
            'message' => 'Order produksi berhasil dimulai.'
        ]);
    }



public function finish(Request $request, $id)
{
    $order = ProductionOrder::find($id);

    if (!$order || $order->status !== 'sedang dikerjakan') {
        return response()->json([
            'status' => 'error',
            'message' => 'Order tidak valid untuk diselesaikan.'
        ], 400);
    }

    $request->validate([
        'actual_quantity' => 'required|integer|min:0',
        'reject_quantity' => 'required|integer|min:0',
    ]);

    $order->status = 'selesai';
    $order->actual_quantity = $request->actual_quantity;
    $order->reject_quantity = $request->reject_quantity;
    $order->save();

    // --- LOGIKA BARU UNTUK MEMPERBARUI STOK GUDANG ---
    $product = $order->productionPlan->product;
    $product->stock += $order->actual_quantity;
    $product->save();
    // ---

    // Mencatat log perubahan status
    try {
        ProductionLog::create([
            'production_order_id' => $order->id,
            'user_id' => Auth::id(),
            'status_change' => 'selesai',
            'notes' => 'Pengerjaan order selesai. Jumlah aktual: ' . $order->actual_quantity . ', Reject: ' . $order->reject_quantity
        ]);
    } catch (\Exception $e) {
        Log::error('Gagal mencatat log produksi: ' . $e->getMessage());
    }

    $order->productionPlan->status = 'diproses';
    $order->productionPlan->save();

    return response()->json([
        'status' => 'success',
        'message' => 'Order produksi berhasil diselesaikan dan stok gudang diperbarui.'
    ]);
}
    public function report(Request $request)
    {
        // Hanya ambil order dengan status 'selesai'
        $orders = ProductionOrder::with(['productionPlan.product', 'productionLogs'])
                                 ->where('status', 'selesai')
                                 ->get();

        return response()->json([
            'status' => 'success',
            'orders' => $orders,
        ]);
    }

    public function logs()
    {
        // Mengambil semua log dan relasi dengan order produksi serta user
        $logs = ProductionLog::with(['productionOrder.productionPlan.product', 'user'])->latest()->get();

        return response()->json([
            'status' => 'success',
            'logs' => $logs,
        ]);
    }
}
