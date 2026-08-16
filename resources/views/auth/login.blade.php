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

        {{-- Cara login utama: SSO UKRI. Tidak ada lagi form email/password
             mandiri per sistem — semua akun (admin maupun mahasiswa)
             diautentikasi lewat sso.ukri.web.id begitu SSO_ENABLED=true. --}}
        @if (config('services.sso.enabled'))
            <a href="{{ route('sso.redirect') }}" class="btn btn-primary w-100 fw-bold">
                Login dengan SSO UKRI
            </a>
        @else
            {{-- SEMENTARA: SSO belum aktif, jadi dipasang guest login supaya
                 alur SIKEMAH tetap bisa dites. Hapus blok ini begitu SSO
                 sudah SSO_ENABLED=true di production (lihat PANDUAN_SSO.md). --}}
            <div class="alert alert-warning py-2 small">
                Login SSO belum dikonfigurasi. Gunakan login demo di bawah.
            </div>

            <a href="{{ route('guest-login.admin') }}" class="btn btn-primary w-100 fw-bold mb-2">
                Masuk sebagai Admin (Demo)
            </a>
            <a href="{{ route('guest-login.mahasiswa') }}" class="btn btn-outline-primary w-100 fw-bold mb-0">
                Masuk sebagai Mahasiswa (Demo)
            </a>
        @endif

    </div>

</div>

</x-guest-layout>
