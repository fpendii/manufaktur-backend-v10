<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\Product;

class ProductSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        Product::create([
            'product_name' => 'Widget Aluminium',
            'sku' => 'AL-WGT-001',
            'unit' => 'Pcs',
        ]);

        Product::create([
            'product_name' => 'Gasket Karet 10mm',
            'sku' => 'KR-GSK-001',
            'unit' => 'Pcs',
        ]);

        Product::create([
            'product_name' => 'Bolt Stainless Steel M8',
            'sku' => 'ST-BLT-001',
            'unit' => 'Kg',
        ]);
    }
}
