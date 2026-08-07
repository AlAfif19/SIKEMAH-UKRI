<x-guest-layout>

<style>
    /* Sembunyikan ikon mata bawaan browser (Edge/Chromium) agar tidak dobel dengan ikon mata custom */
    input[type="password"]::-ms-reveal,
    input[type="password"]::-ms-clear {
        display: none !important;
    }
    input[type="password"]::-webkit-credentials-auto-fill-button,
    input[type="password"]::-webkit-textfield-decoration-container {
        visibility: hidden;
        display: none !important;
    }
</style>

<div class="card mb-3 border-0 shadow-sm">

    <div class="card-body p-4">

        <div class="pt-2 pb-3">

            <div class="text-center mb-3">
                <img src="{{ asset('assets/img/Logo UKRI.png') }}" style="height:80px" alt="Logo UKRI">
            </div>

            <h5 class="card-title text-center pb-0 fs-4 fw-bold">SIKEMAH</h5>

            <p class="text-center small text-muted">
                Sistem Informasi Kegiatan Mahasiswa
            </p>

        </div>

        @if (session('error'))
            <div class="alert alert-danger py-2 small">{{ session('error') }}</div>
        @endif

        <form class="row g-3" action="{{ route('login') }}" method="POST">
            @csrf

            <div class="col-12">
                <label class="form-label fw-semibold">Email / NIM</label>
                <input type="text"
                       name="email"
                       class="form-control @error('email') is-invalid @enderror"
                       value="{{ old('email') }}"
                       autocomplete="username"
                       required
                       autofocus>
                @error('email')
                    <div class="invalid-feedback">{{ $message }}</div>
                @enderror
            </div>

            <div class="col-12">
                <label class="form-label fw-semibold">Password</label>
                <div class="input-group">
                    <input type="password"
                           name="password"
                           id="password"
                           class="form-control @error('password') is-invalid @enderror"
                           style="background-image:none;"
                           required>
                    <span class="input-group-text bg-white" id="togglePassword" style="cursor:pointer;">
                        <i class="bi bi-eye" id="eyeIcon"></i>
                    </span>
                </div>
                @error('password')
                    <div class="invalid-feedback d-block">{{ $message }}</div>
                @enderror
            </div>

            <div class="col-12">
                <div class="form-check">
                    <input type="checkbox" name="remember" class="form-check-input" id="remember">
                    <label class="form-check-label" for="remember">Remember Me</label>
                </div>
            </div>

            <div class="col-12">
                <button class="btn btn-primary w-100 fw-bold" type="submit">Login</button>
            </div>

        </form>

        {{-- Tombol ini otomatis muncul begitu SSO_ENABLED=true & kredensial
             SSO diisi lengkap di .env — tidak perlu ubah kode lagi saat
             aktivasi. Lihat PANDUAN_SSO.md. --}}
        @if (config('services.sso.enabled'))
            <div class="d-flex align-items-center my-3">
                <hr class="flex-grow-1">
                <span class="px-2 small text-muted">atau</span>
                <hr class="flex-grow-1">
            </div>

            <a href="{{ route('sso.redirect') }}" class="btn btn-outline-primary w-100 fw-bold">
                Login dengan SSO UKRI
            </a>
        @endif

    </div>

</div>

<script>
document.addEventListener("DOMContentLoaded", function () {
    const togglePassword = document.getElementById('togglePassword');
    const passwordInput = document.getElementById('password');
    const eyeIcon = document.getElementById('eyeIcon');

    togglePassword.addEventListener('click', function () {
        const type = passwordInput.getAttribute('type') === 'password' ? 'text' : 'password';
        passwordInput.setAttribute('type', type);
        eyeIcon.classList.toggle('bi-eye');
        eyeIcon.classList.toggle('bi-eye-slash');
    });
});
</script>

</x-guest-layout>
