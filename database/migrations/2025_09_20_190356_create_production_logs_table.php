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
        Schema::create('production_logs', function (Blueprint $table) {
            $table->id();
            $table->foreignId('production_order_id')->constrained('production_orders');
            $table->foreignId('user_id')->constrained('users');
            $table->enum('status_change', ['menunggu', 'sedang dikerjakan', 'selesai']);
            $table->timestamp('timestamp')->useCurrent();
            $table->text('notes')->nullable();
            // No timestamps, since we use 'timestamp' column with a default value.
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('production_logs');
    }
};
