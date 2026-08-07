<?php

namespace App\Providers;

use App\Models\Notifikasi;
use Illuminate\Pagination\Paginator;
use Illuminate\Support\Facades\URL;
use Illuminate\Support\Facades\View;
use Illuminate\Support\ServiceProvider;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     */
    public function register(): void
    {
        //
    }

    /**
     * Bootstrap any application services.
     */
    public function boot(): void
    {
        Paginator::useBootstrapFive();

        // Kalau SIKEMAH suatu saat ditest lewat tunnel https (ngrok dkk.), request
        // yang benar-benar sampai ke Laravel itu http (tunnel yang menangani
        // TLS-nya di luar), jadi asset()/url() bisa menghasilkan link http://
        // walau halaman dibuka lewat https://... — browser blokir link http://
        // itu sebagai "mixed content", CSS/JS tidak termuat.
        //
        // Solusinya: ikuti skema APP_URL, BUKAN hardcode ke APP_ENV=local.
        // Untuk dev lokal biasa (php artisan serve di http://localhost:8000),
        // APP_URL berskema http -> tidak dipaksa, link tetap http:// seperti
        // seharusnya. Kalau nanti dites lagi lewat tunnel https, cukup set
        // APP_URL=https://... di .env dan baris ini otomatis memaksa https lagi
        // tanpa perlu ubah kode.
        if (str_starts_with((string) config('app.url'), 'https://')) {
            URL::forceScheme('https');
        }

        View::composer('layouts.app', function ($view) {
            if (! auth()->check()) {
                return;
            }

            $query = Notifikasi::where('pengguna_id', auth()->id());

            $view->with([
                'jumlahNotifikasiBelumDibaca' => (clone $query)->where('sudah_dibaca', false)->count(),
                'daftarNotifikasiTerbaru' => (clone $query)->latest()->limit(5)->get(),
            ]);
        });
    }
}
