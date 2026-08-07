<?php

namespace App\Http\Controllers\Auth\Concerns;

use App\Models\User;
use Illuminate\Http\RedirectResponse;

trait RedirectsSetelahLogin
{
    /**
     * Redirect setelah login sesuai peran pengguna.
     *
     * CATATAN PENTING: sengaja TIDAK langsung pakai redirect()->intended()
     * apa adanya. URL yang tersimpan di session (`url.intended`) bisa saja
     * URL milik peran lain — misalnya mahasiswa sempat membuka link
     * /admin/portofolio-mahasiswa/5 sebelum login, lalu login dengan akun
     * mahasiswa. Kalau redirect()->intended() dipakai polos, mahasiswa akan
     * diarahkan ke URL admin tadi dan langsung kena 403 dari AdminMiddleware
     * (persis bug "portofolio sendiri malah 403, seperti ikut ke admin").
     *
     * Jadi intended URL hanya dipakai kalau prefix-nya (/admin atau /user)
     * cocok dengan peran user yang baru saja login. Kalau tidak cocok,
     * intended URL dibuang dan diarahkan ke dashboard sesuai perannya.
     */
    private function redirectSetelahLogin(User $pengguna): RedirectResponse
    {
        $dashboard = $pengguna->isAdmin() ? route('admin.dashboard') : route('user.dashboard');
        $prefix = $pengguna->isAdmin() ? '/admin' : '/user';

        $intended = session('url.intended');

        if ($intended) {
            $path = parse_url($intended, PHP_URL_PATH) ?? '';

            if (! str_starts_with($path, $prefix)) {
                session()->forget('url.intended');

                return redirect()->to($dashboard);
            }
        }

        return redirect()->intended($dashboard);
    }
}
