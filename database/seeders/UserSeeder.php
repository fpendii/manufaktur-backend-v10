<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;
use App\Models\User;

class UserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        // Buat pengguna Manajer
        User::create([
            'name' => 'Manager',
            'email' => 'manager@gmail.com',
            'password' => Hash::make('password'),
            'role' => 'Manager',
        ]);

        // Buat pengguna Staff PPIC
        User::create([
            'name' => 'Staff PPIC',
            'email' => 'ppic@gmail.com',
            'password' => Hash::make('password'),
            'role' => 'Staff_PPIC',
        ]);

        // Buat pengguna Staff Produksi
        User::create([
            'name' => 'Staff Produksi',
            'email' => 'produksi@gmail.com',
            'password' => Hash::make('password'),
            'role' => 'Staff_Produksi',
        ]);
    }
}
