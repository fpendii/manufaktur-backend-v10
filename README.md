# Manufaktur-Backend-v10

Proyek ini adalah bagian backend (API) dari sistem manufaktur yang dibangun dengan framework **Laravel**. Sistem ini mengelola proses produksi, mulai dari perencanaan hingga laporan, dengan dua modul utama: PPIC dan Produksi.

## Fitur Utama

* **Autentikasi & Otorisasi**: Sistem login dengan hak akses berbeda (Manajer, Staff PPIC, Staff Produksi) menggunakan Laravel Sanctum.
* **Modul PPIC**: Mengelola rencana produksi yang dibuat oleh Staff PPIC.
* **Modul Manajer**: Menyetujui atau menolak rencana produksi.
* **Modul Produksi**: Mengelola order produksi dan mencatat hasil akhir (kuantitas aktual dan produk reject).
* **Inventaris**: Memperbarui stok barang jadi di gudang secara otomatis setelah order produksi selesai.
* **Laporan**: Menyediakan API untuk laporan produksi yang bisa diakses oleh Manajer dan Staff PPIC.
* **Log**: Mencatat riwayat perubahan status pada setiap order produksi.

## Struktur Database (ERD)

Berikut adalah diagram hubungan entitas (ERD) yang menggambarkan tabel-tabel utama dalam database proyek ini.



## Persyaratan Sistem

* PHP >= 8.1
* Composer
* MySQL/MariaDB

## Cara Menjalankan Proyek

1.  **Kloning Repositori**:
    ```bash
    git clone https://github.com/fpendii/manufaktur-backend-v10.git
    cd manufaktur-backend-v10
    ```

2.  **Konfigurasi Database**:
    * Buat file `.env` dengan menyalin `.env.example`.
    * Edit file `.env` dan sesuaikan pengaturan database Anda.
    ```env
    DB_DATABASE=manufaktur_db
    DB_USERNAME=root
    DB_PASSWORD=
    ```

3.  **Instalasi Dependensi & Migrasi**:
    ```bash
    composer install
    php artisan key:generate
    php artisan migrate
    php artisan db:seed
    ```
    (Note: Jika Anda sudah memiliki SQL dump, lewati `migrate` dan `seed`. Langsung impor file SQL dump ke database Anda.)

4.  **Jalankan Server**:
    ```bash
    php artisan serve
    ```
    API akan berjalan di `http://127.0.0.1:8000`.

## Dokumentasi API

Gunakan **Postman** atau sejenisnya untuk menguji endpoint API.

* `POST /api/login` - Login pengguna.
* `GET /api/production-plans` - Mengambil daftar rencana produksi.
* `GET /api/production-orders` - Mengambil daftar order produksi.
* `PUT /api/production-orders/{id}/start` - Memulai order produksi.
* `PUT /api/production-orders/{id}/finish` - Menyelesaikan order produksi.
* `GET /api/production-orders/report` - Mengambil laporan produksi.
* `GET /api/production-logs` - Mengambil log produksi.

---
