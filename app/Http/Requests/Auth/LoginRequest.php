<?php

namespace App\Http\Requests\Auth;

use App\Models\Mahasiswa;
use Illuminate\Auth\Events\Lockout;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\RateLimiter;
use Illuminate\Support\Str;
use Illuminate\Validation\ValidationException;

class LoginRequest extends FormRequest
{
    public function authorize(): bool
    {
        return true;
    }

    public function rules(): array
    {
        return [
            // Sengaja bukan rule 'email': field ini boleh diisi email ASLI
            // ataupun NIM mahasiswa (lihat authenticate()).
            'email' => ['required', 'string'],
            'password' => ['required', 'string'],
        ];
    }

    public function authenticate(): void
    {
        $this->ensureIsNotRateLimited();

        $emailUntukLogin = $this->resolveEmailLogin();

        if (! $emailUntukLogin || ! Auth::attempt(
            ['email' => $emailUntukLogin, 'password' => $this->string('password')],
            $this->boolean('remember')
        )) {
            RateLimiter::hit($this->throttleKey());

            throw ValidationException::withMessages([
                'email' => trans('auth.failed'),
            ]);
        }

        RateLimiter::clear($this->throttleKey());
    }

    /**
     * Terima input email ASLI apa adanya. Kalau yang diketik bukan format
     * email (mis. NIM "20221310002"), cari akun pengguna lewat NIM di tabel
     * `mahasiswa` dan pakai email akun itu untuk proses Auth::attempt().
     * Kalau NIM tidak ketemu, kembalikan null (biar authenticate() gagal
     * dengan pesan generik yang sama seperti email salah — tidak membocorkan
     * NIM terdaftar atau tidak).
     */
    private function resolveEmailLogin(): ?string
    {
        $input = trim((string) $this->string('email'));

        if (str_contains($input, '@')) {
            return $input;
        }

        return Mahasiswa::where('nim', $input)->first()?->pengguna?->email;
    }

    public function ensureIsNotRateLimited(): void
    {
        if (! RateLimiter::tooManyAttempts($this->throttleKey(), 5)) {
            return;
        }

        event(new Lockout($this));

        $seconds = RateLimiter::availableIn($this->throttleKey());

        throw ValidationException::withMessages([
            'email' => trans('auth.throttle', [
                'seconds' => $seconds,
                'minutes' => ceil($seconds / 60),
            ]),
        ]);
    }

    public function throttleKey(): string
    {
        return Str::transliterate(Str::lower($this->string('email')).'|'.$this->ip());
    }
}
