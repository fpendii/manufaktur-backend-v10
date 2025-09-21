<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Product;

class ProductController extends Controller
{
    /**
     * Menampilkan daftar semua produk.
     */
    public function index()
    {
        $products = Product::all();

        return response()->json([
            'status' => 'success',
            'products' => $products,
        ]);
    }

    /**
     * Membuat produk baru.
     */
    public function store(Request $request)
    {
        $request->validate([
            'product_name' => 'required|string|max:255',
            'sku' => 'required|string|unique:products,sku',
            'unit' => 'required|string|max:50',
        ]);

        $product = Product::create($request->all());

        return response()->json([
            'status' => 'success',
            'message' => 'Produk berhasil ditambahkan.',
            'product' => $product,
        ], 201);
    }

    public function inventory()
    {
        $products = Product::all();
        return response()->json([
            'status' => 'success',
            'products' => $products,
        ]);
    }
}
