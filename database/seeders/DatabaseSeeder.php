<?php

namespace Database\Seeders;

use App\Enums\PeranPengguna;
use App\Models\Jenis;
use App\Models\JenisKegiatan;
use App\Models\Kategori;
use App\Models\Mahasiswa;
use App\Models\SkemaPoin;
use App\Models\User;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;

class DatabaseSeeder extends Seeder
{
    public function run(): void
    {
        User::create([
            'nama' => 'Administrator',
            'email' => 'admin@sikemah.ukri',
            'password' => Hash::make('password'),
            'peran' => PeranPengguna::Admin,
        ]);

        // Akun mahasiswa NORMALNYA diisi dari Master Data API UKRI lewat:
        //   php artisan data-master:import-mahasiswa
        // atau otomatis saat login SSO. Satu akun demo di bawah HANYA untuk
        // dipakai tombol guest login (GuestLoginController) selama SSO
        // belum aktif — hapus/ganti kalau data mahasiswa asli sudah masuk.
        $mahasiswaDemo = User::create([
            'nama' => 'Mahasiswa Demo',
            'email' => 'mahasiswa@sikemah.ukri',
            'password' => Hash::make('password'),
            'peran' => PeranPengguna::Mahasiswa,
        ]);

        Mahasiswa::create([
            'pengguna_id' => $mahasiswaDemo->id,
            'nim' => '00000000',
            'prodi' => 'Sistem Informasi',
            'fakultas' => 'FIKSI',
            'angkatan' => '2024',
        ]);

        $this->seedKategoriKegiatanJenisDanSkemaPoin();
    }

    /**
     * Seed 3 Kategori -> Kegiatan -> Jenis -> Skema Poin, PERSIS sesuai
     * "Tabel Penilaian TAK".
     *
     * Untuk nama Kegiatan yang mengandung "/" (menandakan beberapa pilihan
     * spesifik, misal "Pameran/Fashion Show"), Jenis dipecah jadi opsi
     * terpisah yang lebih spesifik ("Pameran", "Fashion Show") — mahasiswa
     * pilih satu saja, TIDAK ditulis gabungan semuanya. Skema poin yang
     * sama berlaku untuk setiap Jenis pecahan tersebut (karena tabel TAK
     * memang tidak membedakan poinnya per pecahan, cuma per Tingkat/Peran).
     *
     * Untuk Kegiatan yang namanya tidak ada "/", Jenis dibuat 1 saja dengan
     * nama yang sama dengan Kegiatan-nya (admin bisa ubah/tambah nanti).
     */
    private function seedKategoriKegiatanJenisDanSkemaPoin(): void
    {
        $data = [
            'Tri Dharma Perguruan Tinggi' => [
                [
                    'nama' => 'Upacara Bendera',
                    'jenis' => ['Upacara Bendera'],
                    'dokumen' => 'Daftar Hadir',
                    'periode_penilaian' => 'Tiap Kegiatan',
                    'penilai' => 'Wakil Dekan Bid. Kemahasiswaan FIKSI',
                    'skema' => [
                        ['peran' => 'Petugas', 'poin' => 5],
                        ['peran' => 'Peserta', 'poin' => 1],
                    ],
                ],
                [
                    'nama' => 'Penyajian Makalah dalam Pertemuan Ilmiah',
                    'jenis' => ['Penyajian Makalah dalam Pertemuan Ilmiah'],
                    'dokumen' => 'Sertifikat',
                    'periode_penilaian' => 'Tiap Kegiatan',
                    'penilai' => 'LPPM UKRI (unit Fakultas)',
                    'skema' => [
                        ['tingkat' => 'Internasional', 'poin' => 25],
                        ['tingkat' => 'Nasional', 'poin' => 20],
                        ['tingkat' => 'Regional', 'poin' => 15],
                        ['tingkat' => 'Internal UKRI', 'poin' => 10],
                    ],
                ],
                [
                    'nama' => 'Publikasi Ilmiah dalam Jurnal',
                    'jenis' => ['Publikasi Ilmiah dalam Jurnal'],
                    'dokumen' => 'Jurnal',
                    'periode_penilaian' => 'Tiap Jurnal',
                    'penilai' => 'LPPM UKRI (unit Fakultas)',
                    'skema' => [
                        ['tingkat' => 'Internasional', 'poin' => 25],
                        ['tingkat' => 'Terakreditasi Nasional', 'poin' => 20],
                        ['tingkat' => 'Belum Terakreditasi', 'poin' => 15],
                        ['tingkat' => 'Internal UKRI', 'poin' => 10],
                    ],
                ],
                [
                    'nama' => 'Menulis Artikel di Media Massa',
                    'jenis' => ['Menulis Artikel di Media Massa'],
                    'dokumen' => 'Media Massa',
                    'periode_penilaian' => 'Tiap Tulisan',
                    'penilai' => 'Sekretaris Dekanat FIKSI',
                    'skema' => [
                        ['tingkat' => 'Internasional', 'poin' => 15],
                        ['tingkat' => 'Nasional', 'poin' => 10],
                        ['tingkat' => 'Regional', 'poin' => 5],
                    ],
                ],
                [
                    'nama' => 'Peserta Aktif Pertemuan Ilmiah/Minat Bakat (Workshop/Seminar)',
                    'jenis' => ['Workshop', 'Seminar'],
                    'dokumen' => 'Sertifikat',
                    'periode_penilaian' => 'Tiap Kegiatan',
                    'penilai' => 'LPPM UKRI (unit Fakultas)',
                    'skema' => [
                        ['tingkat' => 'Internasional', 'poin' => 7],
                        ['tingkat' => 'Nasional', 'poin' => 5],
                        ['tingkat' => 'Regional', 'poin' => 2],
                    ],
                ],
                [
                    'nama' => 'Kegiatan Kepedulian Sosial/Pengabdian Masyarakat',
                    'jenis' => ['Kepedulian Sosial', 'Pengabdian Masyarakat'],
                    'dokumen' => 'Sertifikat',
                    'periode_penilaian' => 'Tiap Kegiatan',
                    'penilai' => 'Wakil Dekan Bid. Kemahasiswaan FIKSI',
                    'skema' => [
                        ['tingkat' => 'Internasional', 'poin' => 25],
                        ['tingkat' => 'Nasional', 'poin' => 20],
                        ['tingkat' => 'Regional', 'poin' => 10],
                        ['tingkat' => 'Internal', 'poin' => 5],
                    ],
                ],
                [
                    'nama' => 'Kompetisi Bidang Ilmiah/Minat',
                    'jenis' => ['Bidang Ilmiah', 'Bidang Minat'],
                    'dokumen' => 'Sertifikat',
                    'periode_penilaian' => 'Tiap Kegiatan',
                    'penilai' => 'Wakil Dekan Bid. Kemahasiswaan FIKSI',
                    'skema' => [
                        ['tingkat' => 'Internasional', 'peran' => 'Juara I/II/III', 'poin' => 30],
                        ['tingkat' => 'Internasional', 'peran' => 'Peserta', 'poin' => 10],
                        ['tingkat' => 'Nasional', 'peran' => 'Juara I/II/III', 'poin' => 25],
                        ['tingkat' => 'Nasional', 'peran' => 'Peserta', 'poin' => 7],
                        ['tingkat' => 'Provinsi', 'peran' => 'Juara I/II/III', 'poin' => 10],
                        ['tingkat' => 'Provinsi', 'peran' => 'Peserta', 'poin' => 5],
                        ['tingkat' => 'UKRI', 'peran' => 'Juara I/II/III', 'poin' => 5],
                        ['tingkat' => 'UKRI', 'peran' => 'Peserta', 'poin' => 3],
                    ],
                ],
                [
                    'nama' => 'Asisten Mata Kuliah/Praktikum/Mentor',
                    'jenis' => ['Mata Kuliah', 'Praktikum', 'Mentor'],
                    'dokumen' => 'SK Program Studi',
                    'periode_penilaian' => 'Tiap Semester',
                    'penilai' => 'Kepala Laboratorium FIKSI',
                    'skema' => [
                        ['peran' => 'Koordinator Asisten', 'poin' => 20],
                        ['peran' => 'Asisten', 'poin' => 15],
                        ['peran' => 'Studi Group', 'poin' => 5],
                    ],
                ],
                [
                    'nama' => 'Pameran/Fashion Show',
                    'jenis' => ['Pameran', 'Fashion Show'],
                    'dokumen' => 'Sertifikat',
                    'periode_penilaian' => 'Tiap Kegiatan',
                    'penilai' => 'Wakil Dekan Bid. Kemahasiswaan FIKSI',
                    'skema' => [
                        ['tingkat' => 'Internasional', 'poin' => 20],
                        ['tingkat' => 'Nasional', 'poin' => 15],
                        ['tingkat' => 'Regional', 'poin' => 5],
                    ],
                ],
                [
                    'nama' => 'Proyek Riset',
                    'jenis' => ['Proyek Riset'],
                    'dokumen' => 'SK Direktur/Ketua LPPM',
                    'periode_penilaian' => 'Tiap Kegiatan',
                    'penilai' => 'LPPM UKRI (unit Fakultas)',
                    'skema' => [
                        ['tingkat' => 'UKRI', 'poin' => 15],
                        ['tingkat' => 'Fakultas', 'poin' => 10],
                    ],
                ],
                [
                    'nama' => 'Bekerja',
                    'jenis' => ['Bekerja'],
                    'dokumen' => 'Surat Keterangan Tempat Kerja',
                    'periode_penilaian' => 'Tiap Kegiatan',
                    'penilai' => 'Pusat Karir (CDC) UKRI',
                    'skema' => [
                        ['peran' => 'Pegawai Tetap', 'poin' => 20],
                        ['peran' => 'Wirausaha', 'poin' => 20],
                        ['peran' => 'Part Time', 'poin' => 10],
                    ],
                ],
            ],

            'Organisasi Kemahasiswaan Internal UKRI' => [
                [
                    'nama' => 'BEM / DPM Universitas',
                    'jenis' => ['BEM Universitas', 'DPM Universitas'],
                    'dokumen' => 'Sertifikat, SK Kepengurusan',
                    'periode_penilaian' => 'Tiap Semester',
                    'penilai' => 'Wakil Dekan Bid. Kemahasiswaan FIKSI',
                    'skema' => [
                        ['peran' => 'Ketua/Wakil', 'poin' => 25],
                        ['peran' => 'Sekretaris/Bendahara/Kabid', 'poin' => 20],
                        ['peran' => 'Staf Bidang', 'poin' => 10],
                    ],
                ],
                [
                    'nama' => 'BEM / DPM FIKSI (Fakultas)',
                    'jenis' => ['BEM FIKSI', 'DPM FIKSI'],
                    'dokumen' => 'Sertifikat, SK Kepengurusan',
                    'periode_penilaian' => 'Tiap Semester',
                    'penilai' => 'Wakil Dekan Bid. Kemahasiswaan FIKSI',
                    'skema' => [
                        ['peran' => 'Ketua/Wakil', 'poin' => 20],
                        ['peran' => 'Sekretaris/Bendahara/Kabid', 'poin' => 15],
                        ['peran' => 'Staf Bidang', 'poin' => 10],
                    ],
                ],
                [
                    'nama' => 'HMPS Sistem Informasi / HMPS Bisnis Digital',
                    'jenis' => ['HMPS Sistem Informasi', 'HMPS Bisnis Digital'],
                    'dokumen' => 'Sertifikat, SK Kepengurusan',
                    'periode_penilaian' => 'Tiap Semester',
                    'penilai' => 'Wakil Dekan Bid. Kemahasiswaan FIKSI',
                    'skema' => [
                        ['peran' => 'Ketua/Wakil', 'poin' => 20],
                        ['peran' => 'Sekretaris/Bendahara/Kabid', 'poin' => 15],
                        ['peran' => 'Staf Bidang', 'poin' => 10],
                    ],
                ],
                [
                    'nama' => 'Panitia Kegiatan Tingkat UKRI',
                    'jenis' => ['Panitia Kegiatan Tingkat UKRI'],
                    'dokumen' => 'Sertifikat, SK Kepanitiaan',
                    'periode_penilaian' => 'Tiap Kepanitiaan',
                    'penilai' => 'Wakil Dekan Bid. Kemahasiswaan FIKSI',
                    'skema' => [
                        ['peran' => 'Ketua/Wakil', 'poin' => 15],
                        ['peran' => 'Sekretaris/Bendahara/Kabid', 'poin' => 10],
                        ['peran' => 'Anggota', 'poin' => 5],
                    ],
                ],
                [
                    'nama' => 'Panitia Kegiatan Tingkat Provinsi',
                    'jenis' => ['Panitia Kegiatan Tingkat Provinsi'],
                    'dokumen' => 'Sertifikat, SK Kepanitiaan',
                    'periode_penilaian' => 'Tiap Kepanitiaan',
                    'penilai' => 'Wakil Dekan Bid. Kemahasiswaan FIKSI',
                    'skema' => [
                        ['peran' => 'Ketua/Wakil', 'poin' => 15],
                        ['peran' => 'Sekretaris/Bendahara/Kabid', 'poin' => 10],
                        ['peran' => 'Anggota', 'poin' => 5],
                    ],
                ],
                [
                    'nama' => 'Panitia Kegiatan Tingkat Internasional',
                    'jenis' => ['Panitia Kegiatan Tingkat Internasional'],
                    'dokumen' => 'Sertifikat, SK Kepanitiaan',
                    'periode_penilaian' => 'Tiap Kepanitiaan',
                    'penilai' => 'Wakil Dekan Bid. Kemahasiswaan FIKSI',
                    'skema' => [
                        ['peran' => 'Ketua/Wakil', 'poin' => 25],
                        ['peran' => 'Sekretaris/Bendahara/Kabid', 'poin' => 20],
                        ['peran' => 'Anggota', 'poin' => 10],
                    ],
                ],
                [
                    'nama' => 'Panitia Kegiatan Tingkat Nasional',
                    'jenis' => ['Panitia Kegiatan Tingkat Nasional'],
                    'dokumen' => 'Sertifikat, SK Kepanitiaan',
                    'periode_penilaian' => 'Tiap Kepanitiaan',
                    'penilai' => 'Wakil Dekan Bid. Kemahasiswaan FIKSI',
                    'skema' => [
                        ['peran' => 'Ketua/Wakil', 'poin' => 20],
                        ['peran' => 'Sekretaris/Bendahara/Kabid', 'poin' => 15],
                        ['peran' => 'Anggota', 'poin' => 8],
                    ],
                ],
                [
                    'nama' => 'Unit Kegiatan Mahasiswa (UKM)',
                    'jenis' => ['Unit Kegiatan Mahasiswa (UKM)'],
                    'dokumen' => 'Sertifikat, SK Kepanitiaan',
                    'periode_penilaian' => 'Tiap Kepanitiaan',
                    'penilai' => 'Wakil Dekan Bid. Kemahasiswaan FIKSI',
                    'skema' => [
                        ['peran' => 'Ketua/Wakil', 'poin' => 20],
                        ['peran' => 'Sekretaris/Bendahara/Kabid', 'poin' => 15],
                        ['peran' => 'Staf Bidang', 'poin' => 10],
                        ['peran' => 'Anggota', 'poin' => 5],
                    ],
                ],
                [
                    'nama' => 'Peserta Pelatihan Kepemimpinan',
                    'jenis' => ['Peserta Pelatihan Kepemimpinan'],
                    'dokumen' => 'Sertifikat, SK Kepanitiaan',
                    'periode_penilaian' => 'Tiap Kepanitiaan',
                    'penilai' => 'Wakil Dekan Bid. Kemahasiswaan FIKSI',
                    'skema' => [
                        ['peran' => 'LDKO/LDKO Lanjutan', 'poin' => 10],
                        ['peran' => 'Selain LDKO', 'poin' => 5],
                    ],
                ],
                [
                    'nama' => 'Peserta Orientasi Mahasiswa Baru',
                    'jenis' => ['Peserta Orientasi Mahasiswa Baru'],
                    'dokumen' => 'Sertifikat, SK Kepanitiaan',
                    'periode_penilaian' => 'Tiap Kepanitiaan',
                    'penilai' => 'Wakil Dekan Bid. Kemahasiswaan FIKSI',
                    'skema' => [
                        ['tingkat' => 'UKRI', 'poin' => 5],
                        ['tingkat' => 'Fakultas', 'poin' => 5],
                        ['tingkat' => 'Prodi', 'poin' => 5],
                    ],
                ],
                [
                    'nama' => 'Promosi UKRI',
                    'jenis' => ['Promosi UKRI'],
                    'dokumen' => 'Surat Tugas',
                    'periode_penilaian' => 'Tiap Kegiatan',
                    'penilai' => 'Humas & Marketing UKRI',
                    'skema' => [
                        ['peran' => 'Petugas Pameran', 'poin' => 5],
                        ['peran' => 'Roadshow', 'poin' => 5],
                        ['peran' => 'Try Out Sekolah', 'poin' => 5],
                        ['peran' => 'Edutrip', 'poin' => 5],
                    ],
                ],
            ],

            'Organisasi Ekstra Kampus' => [
                [
                    'nama' => 'Organisasi Tingkat Nasional',
                    'jenis' => ['Organisasi Tingkat Nasional'],
                    'dokumen' => 'Sertifikat, Surat Keterangan, Piagam',
                    'periode_penilaian' => 'Tiap Semester',
                    'penilai' => 'Wakil Dekan Bid. Kemahasiswaan FIKSI',
                    'skema' => [
                        ['peran' => 'Ketua/Sekretaris/Bendahara/Kabid', 'poin' => 25],
                        ['peran' => 'Anggota Biasa', 'poin' => 5],
                    ],
                ],
                [
                    'nama' => 'Organisasi Tingkat Provinsi',
                    'jenis' => ['Organisasi Tingkat Provinsi'],
                    'dokumen' => 'Sertifikat, Surat Keterangan, Piagam',
                    'periode_penilaian' => 'Tiap Periode Kepengurusan',
                    'penilai' => 'Wakil Dekan Bid. Kemahasiswaan FIKSI',
                    'skema' => [
                        ['peran' => 'Pengurus', 'poin' => 20],
                        ['peran' => 'Anggota Biasa', 'poin' => 5],
                    ],
                ],
                [
                    'nama' => 'Organisasi Tingkat Kabupaten/Kota',
                    'jenis' => ['Organisasi Tingkat Kabupaten', 'Organisasi Tingkat Kota'],
                    'dokumen' => 'Sertifikat, Surat Keterangan, Piagam',
                    'periode_penilaian' => 'Tiap Periode Kepengurusan',
                    'penilai' => 'Wakil Dekan Bid. Kemahasiswaan FIKSI',
                    'skema' => [
                        ['peran' => 'Pengurus', 'poin' => 15],
                        ['peran' => 'Anggota Biasa', 'poin' => 5],
                    ],
                ],
                [
                    'nama' => 'Organisasi Tingkat Kecamatan',
                    'jenis' => ['Organisasi Tingkat Kecamatan'],
                    'dokumen' => 'Sertifikat, Surat Keterangan, Piagam',
                    'periode_penilaian' => 'Tiap Periode Kepengurusan',
                    'penilai' => 'Wakil Dekan Bid. Kemahasiswaan FIKSI',
                    'skema' => [
                        ['peran' => 'Pengurus', 'poin' => 10],
                        ['peran' => 'Anggota Biasa', 'poin' => 5],
                    ],
                ],
                [
                    'nama' => 'Organisasi Tingkat RT/RW',
                    'jenis' => ['Organisasi Tingkat RT', 'Organisasi Tingkat RW'],
                    'dokumen' => 'Sertifikat, Surat Keterangan, Piagam',
                    'periode_penilaian' => 'Tiap Periode Kepengurusan',
                    'penilai' => 'Wakil Dekan Bid. Kemahasiswaan FIKSI',
                    'skema' => [
                        ['peran' => 'Pengurus', 'poin' => 10],
                        ['peran' => 'Anggota Biasa', 'poin' => 5],
                    ],
                ],
            ],
        ];

        foreach ($data as $namaKategori => $daftarKegiatan) {
            $poinMaksimum = 0;
            foreach ($daftarKegiatan as $keg) {
                foreach ($keg['skema'] as $s) {
                    $poinMaksimum = max($poinMaksimum, $s['poin']);
                }
            }

            $kategori = Kategori::create([
                'nama' => $namaKategori,
                'poin_maksimum' => $poinMaksimum,
            ]);

            foreach ($daftarKegiatan as $keg) {
                $jenisKegiatan = JenisKegiatan::create([
                    'kategori_id' => $kategori->id,
                    'nama' => $keg['nama'],
                    'dokumen' => $keg['dokumen'],
                    'periode_penilaian' => $keg['periode_penilaian'],
                    'penilai' => $keg['penilai'],
                ]);

                foreach ($keg['jenis'] as $namaJenis) {
                    $jenis = Jenis::create([
                        'jenis_kegiatan_id' => $jenisKegiatan->id,
                        'nama' => $namaJenis,
                    ]);

                    foreach ($keg['skema'] as $s) {
                        SkemaPoin::create([
                            'jenis_id' => $jenis->id,
                            'tingkat' => $s['tingkat'] ?? null,
                            'peran' => $s['peran'] ?? null,
                            'poin' => $s['poin'],
                        ]);
                    }
                }
            }
        }
    }
}
