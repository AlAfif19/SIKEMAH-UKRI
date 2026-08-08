<x-guest-layout>

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

        {{-- Satu-satunya cara login: SSO UKRI. Tidak ada lagi form
             email/password mandiri per sistem — semua akun (admin maupun
             mahasiswa) diautentikasi lewat sso.ukri.web.id. --}}
        @if (config('services.sso.enabled'))
            <a href="{{ route('sso.redirect') }}" class="btn btn-primary w-100 fw-bold">
                Login dengan SSO UKRI
            </a>
        @else
            <div class="alert alert-warning py-2 small mb-0">
                Login SSO belum dikonfigurasi. Hubungi administrator sistem.
            </div>
        @endif

    </div>

</div>

</x-guest-layout>
