<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Models\ProductionPlan;
use App\Models\ProductionOrder;
use Illuminate\Http\Request;

class ReportController extends Controller
{
    /**
     * Laporan untuk Staff PPIC: Menampilkan semua rencana produksi.
     */
    public function ppicReport(Request $request)
    {
        $query = ProductionPlan::with(['product', 'user']);

        // Filter berdasarkan tanggal jika ada
        if ($request->has('start_date')) {
            $query->whereDate('due_date', '>=', $request->start_date);
        }
        if ($request->has('end_date')) {
            $query->whereDate('due_date', '<=', $request->end_date);
        }

        $plans = $query->get();

        return response()->json([
            'status' => 'success',
            'reports' => $plans,
        ]);
    }

    /**
     * Laporan untuk Manajer & Staff Produksi: Menampilkan order produksi yang selesai.
     */
    public function productionReport(Request $request)
    {
        $query = ProductionOrder::with(['productionPlan.product']);

        // Filter status selesai
        $query->where('status', 'selesai');

        // Filter berdasarkan tanggal jika ada
        if ($request->has('start_date')) {
            $query->whereDate('updated_at', '>=', $request->start_date);
        }
        if ($request->has('end_date')) {
            $query->whereDate('updated_at', '<=', $request->end_date);
        }

        $orders = $query->get();

        return response()->json([
            'status' => 'success',
            'reports' => $orders,
        ]);
    }
}
