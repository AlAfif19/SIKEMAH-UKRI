<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Auth\Concerns\RedirectsSetelahLogin;
use App\Http\Controllers\Controller;
use App\Http\Requests\Auth\LoginRequest;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Http;
use Illuminate\View\View;

class AuthenticatedSessionController extends Controller
{
    use RedirectsSetelahLogin;

    public function create(): View
    {
        return view('auth.login');
    }

    public function store(LoginRequest $request): RedirectResponse
    {
        $request->authenticate();
        $request->session()->regenerate();

        return $this->redirectSetelahLogin(auth()->user());
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
