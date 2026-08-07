<?php

namespace App\Console\Commands;

use App\Enums\StatusSertifikat;
use App\Models\Mahasiswa;
use App\Models\Portofolio;
use Illuminate\Console\Command;

class SinkronPortofolioCommand extends Command
{
    protected $signature = 'portofolio:sinkron';

    protected $description = 'Menghitung ulang total_poin setiap mahasiswa dari jumlah poin sertifikat yang Disetujui, memperbaiki data yang sudah tidak sinkron';

    public function handle(): int
    {
        $mahasiswaTerdampak = 0;

        Mahasiswa::with('pengguna')->get()->each(function (Mahasiswa $mahasiswa) use (&$mahasiswaTerdampak) {
            $totalSeharusnya = $mahasiswa->sertifikat()
                ->where('status', StatusSertifikat::Disetujui)
                ->sum('poin');

            $portofolio = Portofolio::firstOrNew(['mahasiswa_id' => $mahasiswa->id]);
            $totalSebelumnya = $portofolio->total_poin ?? 0;

            if ((float) $totalSebelumnya !== (float) $totalSeharusnya) {
                $portofolio->total_poin = $totalSeharusnya;
                $portofolio->save();

                $mahasiswaTerdampak++;

                $this->line(sprintf(
                    '%s (%s): %s -> %s poin',
                    $mahasiswa->pengguna->nama ?? '-',
                    $mahasiswa->nim,
                    $totalSebelumnya,
                    $totalSeharusnya
                ));
            }
        });

        if ($mahasiswaTerdampak === 0) {
            $this->info('Semua portofolio sudah sinkron, tidak ada yang diperbaiki.');
        } else {
            $this->info("Selesai. {$mahasiswaTerdampak} data portofolio diperbaiki.");
        }

        return self::SUCCESS;
    }
}
