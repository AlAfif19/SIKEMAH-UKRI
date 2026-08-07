<?php

namespace App\Console\Commands;

use App\Models\Mahasiswa;
use App\Services\DataMasterClient;
use Illuminate\Console\Command;

class SinkronDataMasterCommand extends Command
{
    protected $signature = 'data-master:sinkron-mahasiswa {nim?}';

    protected $description = 'Sinkronkan data prodi/fakultas/angkatan mahasiswa dari Data Master UKRI. '
        .'Tanpa argumen: sinkron semua mahasiswa. Dengan {nim}: sinkron satu mahasiswa saja.';

    public function handle(DataMasterClient $client): int
    {
        if (! $client->aktif()) {
            $this->error('Integrasi Data Master belum aktif. Set DATA_MASTER_ENABLED=true dan lengkapi kredensial di .env terlebih dahulu.');

            return self::FAILURE;
        }

        $query = Mahasiswa::query();

        if ($nim = $this->argument('nim')) {
            $query->where('nim', $nim);
        }

        $daftarMahasiswa = $query->get();

        if ($daftarMahasiswa->isEmpty()) {
            $this->warn('Tidak ada data mahasiswa yang cocok.');

            return self::SUCCESS;
        }

        $berhasil = 0;
        $gagal = 0;

        $this->withProgressBar($daftarMahasiswa, function (Mahasiswa $mahasiswa) use ($client, &$berhasil, &$gagal) {
            $data = $client->ambilDataMahasiswa($mahasiswa->nim);

            if (! $data) {
                $gagal++;

                return;
            }

            $mahasiswa->update([
                'prodi' => $data['prodi'] ?? $mahasiswa->prodi,
                'fakultas' => $data['fakultas'] ?? $mahasiswa->fakultas,
                'angkatan' => $data['angkatan'] ?? $mahasiswa->angkatan,
                'sinkron_data_master_pada' => now(),
            ]);

            $berhasil++;
        });

        $this->newLine(2);
        $this->info("Selesai. Berhasil: {$berhasil}, Gagal/tidak ditemukan: {$gagal}.");

        return self::SUCCESS;
    }
}
