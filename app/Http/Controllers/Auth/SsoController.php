<?php

namespace App\Http\Controllers\Auth;

use App\Enums\PeranPengguna;
use App\Http\Controllers\Auth\Concerns\RedirectsSetelahLogin;
use App\Http\Controllers\Controller;
use App\Models\Mahasiswa;
use App\Models\User;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Str;

/**
 * Login via SSO UKRI (OAuth2 Authorization Code Grant).
 *
 * Alurnya: redirect() -> user login di halaman SSO -> SSO redirect balik ke
 * callback() dengan `code` -> code ditukar ke access_token (/oauth/token)
 * -> access_token dipakai ambil profil (/api/user) -> user lokal SIKEMAH
 * dicari/dibuat -> login -> lempar ke dashboard sesuai peran.
 *
 * STATUS: siap dipakai. Nyalakan dengan mengisi SSO_ENABLED=true + kredensial
 * di .env (lihat PANDUAN_SSO.md). Selama SSO_ENABLED=false (atau kredensial
 * belum lengkap), kedua route di sini mengembalikan 404 dan login manual
 * (AuthenticatedSessionController) tetap berjalan seperti biasa.
 *
 * CATATAN maintainability: semua percabangan spesifik-SSO (mapping peran,
 * pencocokan akun, pembuatan data mahasiswa) sengaja dipecah jadi method
 * privat kecil di bawah supaya kalau format response SSO berubah, cukup satu
 * method yang disentuh tanpa mengubah alur utama di callback().
 */
class SsoController extends Controller
{
    use RedirectsSetelahLogin;

    /**
     * Redirect ke halaman login SSO UKRI.
     */
    public function redirect(): RedirectResponse
    {
        if (! $this->ssoAktif()) {
            abort(404);
        }

        // State dipakai sebagai proteksi CSRF antara redirect() <-> callback().
        // Kalau server SSO ternyata tidak mengembalikan parameter ini apa
        // adanya, callback() tidak akan hard-fail karenanya (lihat di bawah).
        $state = Str::random(40);
        session(['sso_state' => $state]);

        $query = http_build_query([
            'client_id' => config('services.sso.client_id'),
            'redirect_uri' => config('services.sso.redirect'),
            'response_type' => 'code',
            'scope' => '',
            'state' => $state,
        ]);

        return redirect($this->url('/oauth/authorize').'?'.$query);
    }

    /**
     * Callback dari SSO UKRI setelah user login di sana.
     */
    public function callback(Request $request): RedirectResponse
    {
        if (! $this->ssoAktif()) {
            abort(404);
        }

        if ($request->has('error')) {
            return redirect()->route('login')
                ->with('error', 'Login SSO dibatalkan.');
        }

        $stateTersimpan = session()->pull('sso_state');

        if (
            $request->filled('state')
            && $stateTersimpan
            && ! hash_equals($stateTersimpan, (string) $request->string('state'))
        ) {
            return redirect()->route('login')
                ->with('error', 'Sesi SSO tidak valid, silakan coba login ulang.');
        }

        if (! $request->filled('code')) {
            return redirect()->route('login')
                ->with('error', 'Kode otorisasi SSO tidak ditemukan.');
        }

        $token = $this->tukarKodeDenganToken((string) $request->string('code'));

        if (! $token) {
            return redirect()->route('login')
                ->with('error', 'Login SSO gagal, silakan coba lagi.');
        }

        $ssoUser = $this->ambilProfilSso($token['access_token'] ?? '');

        if (! $ssoUser) {
            return redirect()->route('login')
                ->with('error', 'Gagal mengambil data akun dari SSO.');
        }

        $peran = $this->petakanPeran($ssoUser['roles'] ?? []);

        if (! $peran) {
            // Termasuk kasus role "dosen" — SIKEMAH belum punya dashboard-nya.
            return redirect()->route('login')
                ->with('error', 'Role SSO Anda belum didukung di SIKEMAH.');
        }

        $user = $this->carikanAtauBuatPengguna($ssoUser, $peran);

        if ($peran === PeranPengguna::Mahasiswa) {
            $this->pastikanDataMahasiswa($user, (string) ($ssoUser['username'] ?? ''));
        }

        session(['sso_token' => $token]);

        Auth::guard('web')->login($user);
        $request->session()->regenerate();

        return $this->redirectSetelahLogin($user);
    }

    /**
     * Tukar authorization code -> access token lewat /oauth/token.
     * Return null kalau gagal (sudah di-log, pemanggil tinggal redirect balik).
     */
    private function tukarKodeDenganToken(string $code): ?array
    {
        try {
            $response = Http::timeout($this->timeout())->asForm()->post(
                $this->url('/oauth/token'),
                [
                    'grant_type' => 'authorization_code',
                    'client_id' => config('services.sso.client_id'),
                    'client_secret' => config('services.sso.client_secret'),
                    'redirect_uri' => config('services.sso.redirect'),
                    'code' => $code,
                ]
            );

            if ($response->failed()) {
                Log::warning('SSO: gagal menukar authorization code menjadi token', [
                    'status' => $response->status(),
                ]);

                return null;
            }

            return $response->json();
        } catch (\Throwable $e) {
            report($e);

            return null;
        }
    }

    /**
     * Ambil profil user SSO lewat /api/user pakai access token.
     * Return null kalau gagal (sudah di-log, pemanggil tinggal redirect balik).
     */
    private function ambilProfilSso(string $accessToken): ?array
    {
        if (blank($accessToken)) {
            return null;
        }

        try {
            $response = Http::timeout($this->timeout())
                ->withToken($accessToken)
                ->get($this->url('/api/user'));

            if ($response->failed()) {
                Log::warning('SSO: gagal mengambil profil user', [
                    'status' => $response->status(),
                ]);

                return null;
            }

            return $response->json();
        } catch (\Throwable $e) {
            report($e);

            return null;
        }
    }

    /**
     * Petakan role dari SSO ke peran SIKEMAH. Null berarti role tidak
     * didukung (mis. "dosen" — SIKEMAH baru punya dashboard Admin & Mahasiswa).
     */
    private function petakanPeran(array $roles): ?PeranPengguna
    {
        if (in_array('admin', $roles, true)) {
            return PeranPengguna::Admin;
        }

        if (in_array('mahasiswa', $roles, true)) {
            return PeranPengguna::Mahasiswa;
        }

        return null;
    }

    /**
     * Cocokkan ke akun lokal yang sudah ada, atau buat akun baru.
     *
     * Urutan pencocokan: sso_username dulu (akun yang sebelumnya sudah pernah
     * login via SSO), baru email (akun lama yang dibuat sebelum SSO aktif,
     * mis. akun demo — asal emailnya sama dengan email di SSO, akan otomatis
     * tertaut & tidak dibuatkan akun duplikat).
     *
     * Peran akun yang SUDAH ADA sengaja TIDAK ditimpa dari role SSO di sini —
     * perubahan peran tetap lewat admin SIKEMAH, supaya SSO tidak bisa diam-
     * diam menaikkan hak akses akun yang sudah ada.
     */
    private function carikanAtauBuatPengguna(array $ssoUser, PeranPengguna $peran): User
    {
        $ssoUsername = (string) ($ssoUser['username'] ?? '');
        $email = (string) ($ssoUser['email'] ?? '');

        $user = User::where('sso_username', $ssoUsername)->first()
            ?? User::where('email', $email)->first();

        if ($user) {
            if (blank($user->sso_username)) {
                $user->forceFill(['sso_username' => $ssoUsername])->save();
            }

            return $user;
        }

        // Endpoint /api/user SSO tidak mengirim nama lengkap (hanya username,
        // email, roles) — nama sementara diisi username, admin perlu
        // memperbarui manual nanti kecuali endpoint SSO diperluas.
        return User::create([
            'nama' => $ssoUsername,
            'email' => $email,
            'sso_username' => $ssoUsername,
            'password' => bcrypt(Str::random(40)), // Tidak pernah dipakai untuk login manual
            'peran' => $peran,
        ]);
    }

    /**
     * Pastikan mahasiswa baru dari SSO punya baris data di tabel `mahasiswa`.
     * `prodi`/`fakultas`/`angkatan` diisi "-" karena SSO tidak mengirim data
     * itu — perlu dilengkapi manual atau lewat sinkronisasi Data Master
     * (lihat App\Services\DataMasterClient) setelah akun jadi.
     */
    private function pastikanDataMahasiswa(User $user, string $nim): void
    {
        if (blank($nim) || $user->mahasiswa()->exists()) {
            return;
        }

        if (Mahasiswa::where('nim', $nim)->exists()) {
            // NIM sudah dipakai baris mahasiswa lain — kemungkinan konflik
            // data, jangan buat baris kedua yang akan gagal karena unique().
            Log::warning('SSO: NIM dari SSO sudah dipakai akun mahasiswa lain', [
                'pengguna_id' => $user->id,
                'nim' => $nim,
            ]);

            return;
        }

        Mahasiswa::create([
            'pengguna_id' => $user->id,
            'nim' => $nim,
            'prodi' => '-',
            'fakultas' => '-',
            'angkatan' => '-',
        ]);
    }

    /**
     * SSO dianggap aktif hanya kalau saklarnya true DAN semua kredensial terisi
     * — sama seperti pola App\Services\DataMasterClient::aktif().
     */
    private function ssoAktif(): bool
    {
        return (bool) config('services.sso.enabled')
            && filled(config('services.sso.base_url'))
            && filled(config('services.sso.client_id'))
            && filled(config('services.sso.client_secret'))
            && filled(config('services.sso.redirect'));
    }

    private function url(string $path): string
    {
        return rtrim((string) config('services.sso.base_url'), '/').$path;
    }

    private function timeout(): int
    {
        return (int) config('services.sso.timeout', 10);
    }
}
