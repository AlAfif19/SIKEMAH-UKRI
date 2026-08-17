<?php

namespace App\Http\Controllers\Auth;

use App\Enums\PeranPengguna;
use App\Http\Controllers\Auth\Concerns\RedirectsSetelahLogin;
use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Http\RedirectResponse;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Request;

/**
 * Login tanpa SSO — SEMENTARA, selama integrasi SSO UKRI belum aktif.
 *
 * Tombol "Masuk sebagai Admin" / "Masuk sebagai Mahasiswa" langsung login
 * ke akun demo yang sudah diseed (lihat DatabaseSeeder), tanpa password dan
 * tanpa lewat SsoController. Tujuannya supaya UI/alur SIKEMAH tetap bisa
 * dites sebelum SSO_ENABLED=true.
 *
 * PENTING: hanya aktif kalau SSO belum dikonfigurasi (lihat guestLoginAktif())
 * — begitu SSO_ENABLED=true, dua route ini otomatis 404 supaya tidak ada
 * pintu belakang di production. Method-nya sengaja dipisah dari SsoController
 * supaya kalau nanti fase ini dihapus, tinggal hapus file ini + rute-nya
 * tanpa menyentuh alur SSO asli.
 */
class GuestLoginController extends Controller
{
    use RedirectsSetelahLogin;

    public function admin(): RedirectResponse
    {
        return $this->loginSebagai(PeranPengguna::Admin);
    }

    public function mahasiswa(): RedirectResponse
    {
        return $this->loginSebagai(PeranPengguna::Mahasiswa);
    }

    private function loginSebagai(PeranPengguna $peran): RedirectResponse
    {
        if (! $this->guestLoginAktif()) {
            abort(404);
        }

        $user = User::where('peran', $peran)->first();

        if (! $user) {
            return redirect()->route('login')
                ->with('error', 'Akun demo '.$peran->label().' belum tersedia. Jalankan db:seed.');
        }

        Auth::guard('web')->login($user);
        Request::instance()->session()->regenerate();

        return $this->redirectSetelahLogin($user);
    }

    /**
     * Guest login hanya jalan kalau SSO belum diaktifkan — begitu
     * SSO_ENABLED=true, jalur ini ditutup otomatis.
     */
    private function guestLoginAktif(): bool
    {
        return ! (bool) config('services.sso.enabled');
    }
}
