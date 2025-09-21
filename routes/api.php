<?php

use App\Http\Controllers\AuthController;
use App\Http\Controllers\ProductController;
use App\Http\Controllers\ProductionPlanController;
use App\Http\Controllers\ProductionOrderController;
use App\Http\Controllers\ReportController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

// Rute Publik (tidak memerlukan autentikasi)
Route::post('/login', [AuthController::class, 'login']);

// Rute Terproteksi (memerlukan token Sanctum)
Route::middleware('auth:sanctum')->group(function () {
    Route::post('/logout', [AuthController::class, 'logout']);

    // Rute Umum untuk semua pengguna yang sudah login
    Route::get('/products', [ProductController::class, 'index']);

    // Rute Khusus untuk Modul PPIC
    // Hanya Staff PPIC yang bisa membuat dan melihat rencana produksi
    Route::middleware('role:Staff_PPIC')->group(function () {
        Route::apiResource('production-plans', ProductionPlanController::class)->only(['index', 'store']);
    });

    // Rute Khusus untuk Manajer
    // Hanya Manajer yang bisa menyetujui atau menolak rencana
    Route::middleware('role:Manager')->group(function () {
        Route::get('/production-plans', [ProductionPlanController::class, 'index']);
        Route::put('/production-plans/{id}/approve', [ProductionPlanController::class, 'approve']);
        Route::put('/production-plans/{id}/reject', [ProductionPlanController::class, 'reject']);
    });

    // Rute Khusus untuk Modul Produksi
    // Hanya Staff Produksi yang bisa mengelola order
    Route::middleware('role:Staff_Produksi')->group(function () {
        Route::apiResource('production-orders', ProductionOrderController::class)->only(['index']);
        Route::put('/production-orders/{id}/start', [ProductionOrderController::class, 'start']);
        Route::put('/production-orders/{id}/finish', [ProductionOrderController::class, 'finish']);
    });

    // Rute untuk Laporan
    // --- Rute Laporan yang telah disesuaikan ---
    // Manajer dan Staff_PPIC bisa melihat laporan

    Route::get('/production-orders/report', [ProductionOrderController::class, 'report']);
     Route::get('/production-logs', [ProductionOrderController::class, 'logs']);

     Route::get('/inventory', [ProductController::class, 'inventory']);



});
