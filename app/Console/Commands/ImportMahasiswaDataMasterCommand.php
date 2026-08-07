<?php

namespace App\Console\Commands;

use App\Enums\PeranPengguna;
use App\Models\Mahasiswa;
use App\Models\Portofolio;
use App\Models\User;
use App\Services\DataMasterClient;
use Illuminate\Console\Command;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Str;

class ImportMahasiswaDataMasterCommand extends Command
{
    protected $signature = 'data-master:import-mahasiswa
        {--prodi_id= : Hanya import mahasiswa dari satu program studi (ID dari Master Data API)}
        {--angkatan_id= : Hanya import mahasiswa dari satu angkatan (ID dari Master Data API)}
        {--dry-run : Tampilkan yang AKAN diimpor tanpa benar-benar menyimpan ke database}';

    protected $description = 'Import massal mahasiswa dari Master Data API UKRI menjadi akun lokal SIKEMAH. '
        .'NIM (NPM) yang sudah punya akun lokal DILEWATI (tidak dibuat ulang/ditimpa) — pakai '
        .'"data-master:sinkron-mahasiswa" untuk memperbarui data mahasiswa yang sudah ada.';

    public function handle(DataMasterClient $client): int
    {
        if (! $client->aktif()) {
            $this->error('Integrasi Data Master belum aktif. Set DATA_MASTER_ENABLED=true dan lengkapi kredensial di .env terlebih dahulu.');

            return self::FAILURE;
        }

        $filter = array_filter([
            'prodi_id' => $this->option('prodi_id'),
            'angkatan_id' => $this->option('angkatan_id'),
        ]);

        $this->info('Mengambil daftar mahasiswa dari Master Data API...');

        $daftarMahasiswaApi = $client->daftarMahasiswa($filter);

        if (empty($daftarMahasiswaApi)) {
            $this->warn('Tidak ada data mahasiswa yang didapat dari Master Data API (cek filter, ability token, atau koneksi).');

            return self::SUCCESS;
        }

        $this->info(sprintf('Ditemukan %d mahasiswa dari Master Data API.', count($daftarMahasiswaApi)));

        $dryRun = (bool) $this->option('dry-run');
        $dibuat = 0;
        $dilewati = 0;
        $gagal = 0;

        $this->withProgressBar($daftarMahasiswaApi, function (array $data) use ($client, $dryRun, &$dibuat, &$dilewati, &$gagal) {
            $npm = $data['npm'] ?? null;
            $nama = $data['nama'] ?? null;

            if (! $npm || ! $nama) {
                $gagal++;

                return;
            }

            if (Mahasiswa::where('nim', $npm)->exists()) {
                $dilewati++;

                return;
            }

            if ($dryRun) {
                $dibuat++;

                return;
            }

            try {
                DB::transaction(function () use ($data, $client, $npm, $nama) {
                    $namaProdi = $data['prodi'] ?? null;

                    $pengguna = User::create([
                        'nama' => $nama,
                        'email' => strtolower($npm).'@sikemah.ukri',
                        'password' => Hash::make(Str::random(24)),
                        'peran' => PeranPengguna::Mahasiswa,
                    ]);

                    $mahasiswa = Mahasiswa::create([
                        'pengguna_id' => $pengguna->id,
                        'nim' => $npm,
                        'prodi' => $namaProdi ?? '',
                        'fakultas' => $namaProdi ? ($client->fakultasDariProdi($namaProdi) ?? '') : '',
                        'angkatan' => $data['angkatan'] ?? '',
                        'sinkron_data_master_pada' => now(),
                    ]);

                    Portofolio::create([
                        'mahasiswa_id' => $mahasiswa->id,
                        'total_poin' => 0,
                    ]);
                });

                $dibuat++;
            } catch (\Throwable $e) {
                report($e);
                $gagal++;
            }
        });

        $this->newLine(2);

        if ($dryRun) {
            $this->info("[DRY RUN] Akan dibuat: {$dibuat}, dilewati (sudah ada): {$dilewati}, dilewati (data tidak lengkap): {$gagal}.");
            $this->comment('Jalankan tanpa --dry-run untuk benar-benar menyimpan.');
        } else {
            $this->info("Selesai. Dibuat: {$dibuat}, dilewati (sudah ada): {$dilewati}, gagal: {$gagal}.");
        }

        return self::SUCCESS;
    }
}
