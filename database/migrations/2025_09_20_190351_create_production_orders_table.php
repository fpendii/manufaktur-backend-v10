<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('production_orders', function (Blueprint $table) {
            $table->id();
            $table->foreignId('production_plan_id')->unique()->constrained('production_plans');
            $table->date('target_completion_date');
            $table->unsignedInteger('actual_quantity')->nullable();
            $table->unsignedInteger('reject_quantity')->nullable();
            $table->enum('status', ['menunggu', 'sedang dikerjakan', 'selesai'])->default('menunggu');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('production_orders');
    }
};
