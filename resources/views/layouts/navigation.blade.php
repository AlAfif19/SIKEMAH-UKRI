<aside id="sidebar" class="sidebar">

    <ul class="sidebar-nav" id="sidebar-nav">

        @if (auth()->user()->isAdmin())

            <li class="nav-heading">Admin</li>

            <li class="nav-item">
                <a class="nav-link {{ request()->routeIs('admin.dashboard') ? '' : 'collapsed' }}"
                   href="{{ route('admin.dashboard') }}">
                    <i class="bi bi-grid"></i>
                    <span>Dashboard</span>
                </a>
            </li>

            <li class="nav-item">
                <a class="nav-link collapsed" data-bs-target="#kegiatan-nav" data-bs-toggle="collapse" href="javascript:void(0);">
                    <i class="bi bi-calendar-event"></i>
                    <span>Manajemen Kegiatan</span>
                    <i class="bi bi-chevron-down ms-auto"></i>
                </a>
                <ul id="kegiatan-nav" class="nav-content collapse {{ request()->routeIs('admin.kategori.*', 'admin.jenis-kegiatan.*') ? 'show' : '' }}" data-bs-parent="#sidebar-nav">
                    <li>
                        <a class="{{ request()->routeIs('admin.kategori.*') ? 'active' : '' }}" href="{{ route('admin.kategori.index') }}">
                            <i class="bi bi-circle"></i><span>Kategori</span>
                        </a>
                    </li>
                    <li>
                        <a class="{{ request()->routeIs('admin.jenis-kegiatan.*') ? 'active' : '' }}" href="{{ route('admin.jenis-kegiatan.index') }}">
                            <i class="bi bi-circle"></i><span>Kegiatan, Jenis &amp; Skema Poin</span>
                        </a>
                    </li>
                </ul>
            </li>

            <li class="nav-item">
                <a class="nav-link {{ request()->routeIs('admin.validasi-sertifikat.*') && request('status', 'menunggu') === 'menunggu' ? '' : 'collapsed' }}"
                   href="{{ route('admin.validasi-sertifikat.index', ['status' => 'menunggu']) }}">
                    <i class="bi bi-patch-check"></i>
                    <span>Validasi Sertifikat</span>
                </a>
            </li>

            <li class="nav-item">
                <a class="nav-link {{ request()->routeIs('admin.validasi-sertifikat.*') && request('status') === 'semua' ? '' : 'collapsed' }}"
                   href="{{ route('admin.validasi-sertifikat.index', ['status' => 'semua']) }}">
                    <i class="bi bi-clock-history"></i>
                    <span>Riwayat Validasi</span>
                </a>
            </li>

            <li class="nav-item">
                <a class="nav-link {{ request()->routeIs('admin.portofolio-mahasiswa.*') ? '' : 'collapsed' }}"
                   href="{{ route('admin.portofolio-mahasiswa.index') }}">
                    <i class="bi bi-folder"></i>
                    <span>Portofolio Mahasiswa</span>
                </a>
            </li>

            <li class="nav-item">
                <a class="nav-link {{ request()->routeIs('admin.laporan.*') ? '' : 'collapsed' }}"
                   href="{{ route('admin.laporan.index') }}">
                    <i class="bi bi-bar-chart"></i>
                    <span>Laporan</span>
                </a>
            </li>

        @else

            <li class="nav-heading">Mahasiswa</li>

            <li class="nav-item">
                <a class="nav-link {{ request()->routeIs('user.dashboard') ? '' : 'collapsed' }}"
                   href="{{ route('user.dashboard') }}">
                    <i class="bi bi-grid"></i>
                    <span>Dashboard</span>
                </a>
            </li>

            <li class="nav-item">
                <a class="nav-link {{ request()->routeIs('user.sertifikat.create', 'user.sertifikat.store') ? '' : 'collapsed' }}"
                   href="{{ route('user.sertifikat.create') }}">
                    <i class="bi bi-cloud-upload"></i>
                    <span>Upload Sertifikat</span>
                </a>
            </li>

            <li class="nav-item">
                <a class="nav-link {{ request()->routeIs('user.sertifikat.index') ? '' : 'collapsed' }}"
                   href="{{ route('user.sertifikat.index') }}">
                    <i class="bi bi-list-check"></i>
                    <span>Riwayat Pengajuan</span>
                </a>
            </li>

            <li class="nav-item">
                <a class="nav-link {{ request()->routeIs('user.poin') ? '' : 'collapsed' }}"
                   href="{{ route('user.poin') }}">
                    <i class="bi bi-star"></i>
                    <span>Perolehan Poin</span>
                </a>
            </li>

            <li class="nav-item">
                <a class="nav-link {{ request()->routeIs('user.portofolio') ? '' : 'collapsed' }}"
                   href="{{ route('user.portofolio') }}">
                    <i class="bi bi-briefcase"></i>
                    <span>Portofolio</span>
                </a>
            </li>

        @endif

    </ul>

</aside>
