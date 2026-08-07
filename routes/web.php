<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Admin\DashboardController as AdminDashboardController;
use App\Http\Controllers\Admin\JenisController;
use App\Http\Controllers\Admin\JenisKegiatanController;
use App\Http\Controllers\Admin\KategoriController;
use App\Http\Controllers\Admin\LaporanController;
use App\Http\Controllers\Admin\PortofolioMahasiswaController;
use App\Http\Controllers\Admin\SkemaPoinController;
use App\Http\Controllers\Admin\ValidasiSertifikatController;
use App\Http\Controllers\Auth\AuthenticatedSessionController;
use App\Http\Controllers\Auth\SsoController;
use App\Http\Controllers\User\DashboardController as UserDashboardController;
use App\Http\Controllers\User\SertifikatController as UserSertifikatController;
use App\Http\Controllers\User\PortofolioController as UserPortofolioController;

Route::redirect('/', '/login');

Route::middleware('guest')->group(function () {
    Route::get('/login', [AuthenticatedSessionController::class, 'create'])->name('login');
    Route::post('/login', [AuthenticatedSessionController::class, 'store']);

    Route::get('/auth/sso/redirect', [SsoController::class, 'redirect'])->name('sso.redirect');
    Route::get('/auth/sso/callback', [SsoController::class, 'callback'])->name('sso.callback');
});

Route::middleware('auth')->group(function () {
    Route::post('/logout', [AuthenticatedSessionController::class, 'destroy'])->name('logout');
    Route::get('/notifikasi', [\App\Http\Controllers\NotifikasiController::class, 'index'])->name('notifikasi.index');
});

Route::middleware(['auth', 'admin'])->prefix('admin')->name('admin.')->group(function () {
    Route::get('/dashboard', [AdminDashboardController::class, 'index'])->name('dashboard');
    Route::resource('kategori', KategoriController::class)->except('show');
    Route::resource('jenis-kegiatan', JenisKegiatanController::class)
        ->except('show')
        ->parameters(['jenis-kegiatan' => 'jenisKegiatan']);

    Route::post('/jenis-kegiatan/{jenisKegiatan}/jenis', [JenisController::class, 'store'])
        ->name('jenis-kegiatan.jenis.store');
    Route::get('/jenis/{jenis}/edit', [JenisController::class, 'edit'])->name('jenis.edit');
    Route::put('/jenis/{jenis}', [JenisController::class, 'update'])->name('jenis.update');
    Route::delete('/jenis-kegiatan/{jenisKegiatan}/jenis/{jenis}', [JenisController::class, 'destroy'])
        ->name('jenis-kegiatan.jenis.destroy');

    Route::post('/jenis/{jenis}/skema-poin', [SkemaPoinController::class, 'store'])
        ->name('jenis.skema-poin.store');
    Route::delete('/jenis/{jenis}/skema-poin/{skemaPoin}', [SkemaPoinController::class, 'destroy'])
        ->name('jenis.skema-poin.destroy');

    Route::prefix('validasi-sertifikat')->name('validasi-sertifikat.')->group(function () {
        Route::get('/', [ValidasiSertifikatController::class, 'index'])->name('index');
        Route::get('/{sertifikat}', [ValidasiSertifikatController::class, 'show'])->name('show');
        Route::post('/{sertifikat}/setujui', [ValidasiSertifikatController::class, 'setujui'])->name('setujui');
        Route::post('/{sertifikat}/tolak', [ValidasiSertifikatController::class, 'tolak'])->name('tolak');
        Route::post('/validasi-massal', [ValidasiSertifikatController::class, 'validasiMassal'])->name('massal');
    });

    Route::prefix('laporan')->name('laporan.')->group(function () {
        Route::get('/', [LaporanController::class, 'index'])->name('index');
        Route::get('/export/fakultas', [LaporanController::class, 'exportFakultas'])->name('export.fakultas');
        Route::get('/export/prodi', [LaporanController::class, 'exportProdi'])->name('export.prodi');
    });

    Route::get('/portofolio-mahasiswa', [PortofolioMahasiswaController::class, 'index'])->name('portofolio-mahasiswa.index');
    Route::get('/portofolio-mahasiswa/{mahasiswa}', [PortofolioMahasiswaController::class, 'show'])->name('portofolio-mahasiswa.show');
    Route::post('/portofolio-mahasiswa/{mahasiswa}/sinkron-data-master', [PortofolioMahasiswaController::class, 'sinkronDataMaster'])->name('portofolio-mahasiswa.sinkron-data-master');
});

Route::middleware(['auth', 'user'])->prefix('user')->name('user.')->group(function () {
    Route::get('/dashboard', [UserDashboardController::class, 'index'])->name('dashboard');
    Route::get('/sertifikat', [UserSertifikatController::class, 'index'])->name('sertifikat.index');
    Route::get('/sertifikat/create', [UserSertifikatController::class, 'create'])->name('sertifikat.create');
    Route::post('/sertifikat', [UserSertifikatController::class, 'store'])->name('sertifikat.store');
    Route::delete('/sertifikat/{sertifikat}', [UserSertifikatController::class, 'destroy'])->name('sertifikat.destroy');
    Route::get('/poin', [UserPortofolioController::class, 'poin'])->name('poin');
    Route::get('/portofolio', [UserPortofolioController::class, 'index'])->name('portofolio');
    Route::get('/portofolio/cetak', [UserPortofolioController::class, 'cetak'])->name('portofolio.cetak');
});
