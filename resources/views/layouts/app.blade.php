<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">

<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <title>{{ $title ?? 'Dashboard' }} - SIKEMAH</title>

    <link href="{{ asset('assets/img/Logo UKRI.png') }}" rel="icon">
    <link href="{{ asset('assets/img/Logo UKRI.png') }}" rel="apple-touch-icon">

    <link rel="preconnect" href="https://fonts.googleapis.com">

    <link href="{{ asset('assets/vendor/bootstrap/css/bootstrap.min.css') }}" rel="stylesheet">
    <link href="{{ asset('assets/vendor/bootstrap-icons/bootstrap-icons.css') }}" rel="stylesheet">
    <link href="{{ asset('assets/vendor/boxicons/css/boxicons.min.css') }}" rel="stylesheet">
    <link href="{{ asset('assets/vendor/remixicon/remixicon.css') }}" rel="stylesheet">
    <link href="{{ asset('assets/vendor/simple-datatables/style.css') }}" rel="stylesheet">

    <link href="{{ asset('assets/css/style.css') }}" rel="stylesheet">
    <link href="{{ asset('assets/css/sikemah-custom.css') }}" rel="stylesheet">
    <link href="{{ asset('assets/css/dark-mode.css') }}" rel="stylesheet">

    <script>
        // Terapkan preferensi dark mode sebelum halaman digambar, supaya tidak
        // ada "kedipan" putih sekejap saat halaman dimuat.
        if (localStorage.getItem('sikemah-dark-mode') === 'aktif') {
            document.documentElement.classList.add('dark-mode');
        }
    </script>

    @stack('styles')
</head>

<body>

<header id="header" class="header fixed-top d-flex align-items-center">

    <div class="d-flex align-items-center justify-content-between">

        <a href="{{ auth()->user()->isAdmin() ? route('admin.dashboard') : route('user.dashboard') }}"
           class="logo d-flex align-items-center">

            <img src="{{ asset('assets/img/Logo UKRI.png') }}" alt="Logo UKRI">

            <span class="d-none d-lg-block">SIKEMAH</span>

        </a>

        <i class="bi bi-list toggle-sidebar-btn"></i>

    </div>

    <nav class="header-nav ms-auto">

        <ul class="d-flex align-items-center">

            <li class="nav-item pe-3">
                <a class="nav-link nav-icon" href="#" id="tombol-dark-mode" title="Ganti tema terang/gelap">
                    <i class="bi bi-moon-stars" id="ikon-dark-mode"></i>
                </a>
            </li>

            <li class="nav-item dropdown pe-3">
                <a class="nav-link nav-icon" href="#" data-bs-toggle="dropdown">
                    <i class="bi bi-bell"></i>
                    @if (($jumlahNotifikasiBelumDibaca ?? 0) > 0)
                        <span class="badge bg-danger badge-number">{{ $jumlahNotifikasiBelumDibaca }}</span>
                    @endif
                </a>

                <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow notifications" style="min-width: 320px;">
                    <li class="dropdown-header">
                        Notifikasi
                        @if (($jumlahNotifikasiBelumDibaca ?? 0) > 0)
                            <span class="badge rounded-pill bg-primary p-1 ms-2">{{ $jumlahNotifikasiBelumDibaca }} baru</span>
                        @endif
                    </li>
                    <li><hr class="dropdown-divider"></li>

                    @forelse (($daftarNotifikasiTerbaru ?? []) as $notifikasi)
                        <li class="notification-item d-flex" style="{{ $notifikasi->sudah_dibaca ? 'opacity:.6;' : '' }}">
                            <i class="bi bi-info-circle text-primary"></i>
                            <div>
                                <h4>{{ $notifikasi->judul }}</h4>
                                <p>{{ \Illuminate\Support\Str::limit($notifikasi->isi, 80) }}</p>
                                <p>{{ $notifikasi->created_at->diffForHumans() }}</p>
                            </div>
                        </li>
                        <li><hr class="dropdown-divider"></li>
                    @empty
                        <li class="text-center text-muted small py-2">Belum ada notifikasi</li>
                    @endforelse

                    <li class="dropdown-footer">
                        <a href="{{ route('notifikasi.index') }}">Lihat semua notifikasi</a>
                    </li>
                </ul>
            </li>

            <li class="nav-item dropdown pe-3">

                <a class="nav-link nav-profile d-flex align-items-center pe-0"
                   href="#"
                   data-bs-toggle="dropdown">

                    <img src="{{ asset('assets/img/Logo UKRI.png') }}"
                         class="rounded-circle"
                         alt="Profile">

                    <span class="d-none d-md-block dropdown-toggle ps-2">
                        {{ auth()->user()->nama }}
                    </span>

                </a>

                <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow profile">

                    <li class="dropdown-header">
                        <h6>{{ auth()->user()->nama }}</h6>
                        <span>{{ auth()->user()->peran->label() }}</span>
                    </li>

                    <li><hr class="dropdown-divider"></li>

                    <li>
                        <form action="{{ route('logout') }}" method="POST">
                            @csrf
                            <button type="submit" class="dropdown-item d-flex align-items-center">
                                <i class="bi bi-box-arrow-right"></i>
                                <span>Logout</span>
                            </button>
                        </form>
                    </li>

                </ul>

            </li>

        </ul>

    </nav>

</header>

@include('layouts.navigation')

<main id="main" class="main">

    @if (session('success'))
        <div class="alert alert-success alert-dismissible fade show" role="alert">
            {{ session('success') }}
            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
        </div>
    @endif

    @if (session('error'))
        <div class="alert alert-danger alert-dismissible fade show" role="alert">
            {{ session('error') }}
            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
        </div>
    @endif

    @yield('content')

</main>

<footer id="footer" class="footer">

    <div class="copyright">
        &copy; <strong>SIKEMAH</strong>
    </div>

    <div class="credits">
        Universitas Kebangsaan Republik Indonesia
    </div>

</footer>

{{-- ================= Modal Konfirmasi (pengganti confirm() bawaan browser) =================
     Dipakai lewat atribut data- di elemen <form>, bukan lagi window.confirm()/alert() yang
     terlihat "bukan bagian aplikasi". Contoh pemakaian pada form yang perlu konfirmasi
     sebelum submit (hapus, tolak, batalkan, dsb.):

         <form method="POST" action="..."
               data-confirm="Hapus kategori ini?"
               data-confirm-title="Hapus Kategori"
               data-confirm-tombol="Ya, Hapus"
               data-confirm-tipe="danger">

     data-confirm-tipe menentukan warna tombol konfirmasi: danger (aksi merusak/menghapus),
     success (menyetujui), primary (default). JS di bawah otomatis mencegat submit form apa
     pun yang punya atribut data-confirm, menampilkan modal ini, dan baru submit form asli
     kalau pengguna menekan tombol konfirmasi — bukan lagi popup bawaan browser. Dipasang
     sekali di sini (bukan per halaman) supaya berlaku juga untuk tabel yang dimuat ulang
     lewat AJAX (mis. Validasi Sertifikat, Kategori, Jenis Kegiatan) karena event listener-nya
     didaftarkan lewat delegasi ke document, bukan ke elemen form itu sendiri. --}}
<div class="modal fade" id="modal-konfirmasi" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="modal-konfirmasi-judul">Konfirmasi</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Tutup"></button>
            </div>
            <div class="modal-body" id="modal-konfirmasi-pesan"></div>
            <div class="modal-footer">
                <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">Batal</button>
                <button type="button" class="btn btn-primary" id="modal-konfirmasi-tombol">Ya, Lanjutkan</button>
            </div>
        </div>
    </div>
</div>

<script src="{{ asset('assets/vendor/bootstrap/js/bootstrap.bundle.min.js') }}"></script>
<script src="{{ asset('assets/vendor/apexcharts/apexcharts.min.js') }}"></script>
<script src="{{ asset('assets/vendor/echarts/echarts.min.js') }}"></script>
<script src="{{ asset('assets/vendor/simple-datatables/simple-datatables.js') }}"></script>

<script src="{{ asset('assets/js/main.js') }}"></script>

<script>
    (function () {
        const html = document.documentElement;
        const ikon = document.getElementById('ikon-dark-mode');

        function perbaruiIkon() {
            const aktif = html.classList.contains('dark-mode');
            ikon.classList.toggle('bi-moon-stars', ! aktif);
            ikon.classList.toggle('bi-sun', aktif);
        }

        perbaruiIkon();

        document.getElementById('tombol-dark-mode').addEventListener('click', function (e) {
            e.preventDefault();
            html.classList.toggle('dark-mode');
            localStorage.setItem('sikemah-dark-mode', html.classList.contains('dark-mode') ? 'aktif' : 'nonaktif');
            perbaruiIkon();
        });
    })();

    // Cegat submit SEMUA form yang punya atribut data-confirm, di seluruh halaman
    // (termasuk yang dimuat belakangan lewat AJAX) — ganti confirm() bawaan browser
    // dengan modal Bootstrap yang konsisten dengan tampilan aplikasi.
    (function () {
        const modalEl = document.getElementById('modal-konfirmasi');
        const elJudul = document.getElementById('modal-konfirmasi-judul');
        const elPesan = document.getElementById('modal-konfirmasi-pesan');
        let tombolAksi = document.getElementById('modal-konfirmasi-tombol');

        document.addEventListener('submit', function (e) {
            const form = e.target;

            if (! (form instanceof HTMLFormElement) || ! form.dataset.confirm) {
                return;
            }

            // Form ini sudah dikonfirmasi (submit terprogram setelah klik "Ya") — biarkan lolos.
            if (form.dataset.confirmed === '1') {
                return;
            }

            e.preventDefault();

            elJudul.textContent = form.dataset.confirmTitle || 'Konfirmasi';
            elPesan.textContent = form.dataset.confirm;

            tombolAksi.textContent = form.dataset.confirmTombol || 'Ya, Lanjutkan';
            tombolAksi.className = 'btn btn-' + (form.dataset.confirmTipe || 'primary');

            // Ganti elemen tombol tiap kali tampil supaya listener klik sebelumnya
            // (untuk form lain) tidak ikut menumpuk dan salah memicu form yang salah.
            const tombolBaru = tombolAksi.cloneNode(true);
            tombolAksi.parentNode.replaceChild(tombolBaru, tombolAksi);
            tombolAksi = tombolBaru;

            tombolAksi.addEventListener('click', function () {
                bootstrap.Modal.getOrCreateInstance(modalEl).hide();
                form.dataset.confirmed = '1';
                form.requestSubmit ? form.requestSubmit() : form.submit();
            });

            bootstrap.Modal.getOrCreateInstance(modalEl).show();
        });
    })();
</script>

@stack('scripts')

</body>

</html>
