<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ProductionLog extends Model
{
    use HasFactory;

    protected $fillable = [
        'production_order_id',
        'user_id',
        'status_change',
        'notes',
    ];

    // Relasi
    public function productionOrder()
    {
        return $this->belongsTo(ProductionOrder::class);
    }

    public function user()
    {
        return $this->belongsTo(User::class);
    }
}
