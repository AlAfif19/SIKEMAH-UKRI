<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Http;
use Illuminate\View\View;

/**
 * Login SIKEMAH sekarang HANYA lewat SSO UKRI — tidak ada lagi form login
 * mandiri (email/password) per sistem. Halaman /login praktis hanya jadi
 * "pintu masuk" yang langsung meneruskan ke SsoController::redirect().
 *
 * Halaman auth.login tetap dirender (bukan langsung redirect dari sini)
 * kalau: (a) ada pesan error yang perlu ditampilkan ke user (mis. login
 * SSO gagal/dibatalkan) — supaya pesannya sempat terlihat sebelum user
 * klik ulang "Login dengan SSO UKRI"; atau (b) SSO belum aktif — supaya
 * tombol guest login (lihat GuestLoginController, SEMENTARA sebelum SSO
 * jalan) sempat terlihat, bukan langsung mental ke SSO yang belum siap.
 */
class AuthenticatedSessionController extends Controller
{
    public function create(): View|RedirectResponse
    {
        if (session()->has('error') || ! config('services.sso.enabled')) {
            return view('auth.login');
        }

        return redirect()->route('sso.redirect');
    }

    public function destroy(Request $request): RedirectResponse
    {
        $this->revokeSsoTokenJikaAda();

        Auth::guard('web')->logout();

        $request->session()->invalidate();
        $request->session()->regenerateToken();

        return redirect()->route('login');
    }

    /**
     * Kalau user login lewat SSO (session punya sso_token dari SsoController),
     * coba cabut token itu di server SSO juga. Best-effort saja — gagal atau
     * timeout di sini TIDAK boleh menggagalkan logout lokal, jadi dibungkus
     * try/catch dan hasilnya diabaikan.
     */
    private function revokeSsoTokenJikaAda(): void
    {
        $accessToken = session('sso_token.access_token');

        if (blank($accessToken) || ! config('services.sso.enabled')) {
            return;
        }

        try {
            Http::timeout((int) config('services.sso.timeout', 10))
                ->withToken($accessToken)
                ->post(rtrim((string) config('services.sso.base_url'), '/').'/api/logout');
        } catch (\Throwable $e) {
            report($e);
        }
    }
}
