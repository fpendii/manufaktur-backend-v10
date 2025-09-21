<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ProductionOrder extends Model
{
    use HasFactory;

    protected $fillable = [
        'production_plan_id',
        'target_completion_date',
        'status',
        'actual_quantity',
        'reject_quantity',
    ];

    // Relasi
    public function productionPlan()
    {
        return $this->belongsTo(ProductionPlan::class);
    }

    public function productionLogs()
    {
        return $this->hasMany(ProductionLog::class);
    }
}
