<?php

namespace App\Services;

use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Log;

/**
 * Client terpusat untuk mengambil data akademik dari Master Data API UKRI.
 *
 * Dokumentasi resmi : https://api.ukri.web.id/api/v1
 * Metode            : GET saja (read-only)
 * Autentikasi       : Bearer token (header Authorization)
 * Ability token     : diatur saat pembuatan API key di dashboard Master
 *                     Data API (fakultas:read, prodi:read, angkatan:read,
 *                     peminatan:read, dosen:read, mahasiswa:read) — kalau
 *                     ability kurang, request dibalas 403.
 *
 * Semua akses ke Master Data API HARUS lewat class ini saja, supaya kalau
 * nanti ada perubahan endpoint/format, cukup diubah di satu tempat.
 */
class DataMasterClient
{
    public function aktif(): bool
    {
        return (bool) config('services.data_master.enabled')
            && filled(config('services.data_master.url'))
            && filled(config('services.data_master.token'));
    }

    /*
    |--------------------------------------------------------------------
    | Daftar per entitas (dipakai untuk dropdown, laporan, sinkronisasi)
    |--------------------------------------------------------------------
    | Masing-masing mengembalikan SELURUH baris (semua halaman digabung),
    | bukan satu halaman saja — cocok dipakai untuk dropdown/lookup.
    */

    /**
     * @param  array{is_active?:bool}  $filter
     * @return array<int, array{id:int, nama_fakultas:string, is_active:bool, dekan:?string}>
     */
    public function daftarFakultas(array $filter = []): array
    {
        return $this->ambilSemuaHalaman('/fakultas', $filter, 'data_master:fakultas:'.md5(serialize($filter)));
    }

    /**
     * @param  array{fakultas_id?:int, is_active?:bool}  $filter
     * @return array<int, array{id:int, nama_prodi:string, is_active:bool, fakultas:?string, kaprodi:?string}>
     */
    public function daftarProdi(array $filter = []): array
    {
        return $this->ambilSemuaHalaman('/prodi', $filter, 'data_master:prodi:'.md5(serialize($filter)));
    }

    /**
     * @param  array{prodi_id?:int, fakultas_id?:int}  $filter
     */
    public function daftarAngkatan(array $filter = []): array
    {
        return $this->ambilSemuaHalaman('/angkatan', $filter);
    }

    /**
     * @param  array{prodi_id?:int, fakultas_id?:int}  $filter
     */
    public function daftarPeminatan(array $filter = []): array
    {
        return $this->ambilSemuaHalaman('/peminatan', $filter);
    }

    /**
     * @param  array{fakultas_id?:int, prodi_id?:int, nidn?:string}  $filter
     */
    public function daftarDosen(array $filter = []): array
    {
        return $this->ambilSemuaHalaman('/dosen', $filter);
    }

    /**
     * @param  array{prodi_id?:int, angkatan_id?:int, npm?:string}  $filter
     */
    public function daftarMahasiswa(array $filter = []): array
    {
        return $this->ambilSemuaHalaman('/mahasiswa', $filter);
    }

    /*
    |--------------------------------------------------------------------
    | Lookup satu mahasiswa berdasarkan NIM/NPM (dipakai proses sinkron)
    |--------------------------------------------------------------------
    */

    /**
     * Ambil data mahasiswa berdasarkan NIM (=NPM di Master Data API) dari
     * Data Master. Endpoint detail /mahasiswa/{id} memakai ID internal API,
     * bukan NPM, jadi pencarian dilakukan lewat endpoint daftar dengan
     * filter ?npm=.
     *
     * @return array{nama?:string, prodi?:string, fakultas?:string, angkatan?:string}|null
     *         null kalau integrasi belum aktif, request gagal, ATAU mahasiswa
     *         tidak ditemukan — pemanggil WAJIB punya fallback (jangan
     *         anggap null berarti data lokal harus dikosongkan).
     */
    public function ambilDataMahasiswa(string $nim): ?array
    {
        if (! $this->aktif()) {
            return null;
        }

        try {
            $respons = Http::timeout((int) config('services.data_master.timeout', 10))
                ->withHeaders($this->authHeaders())
                ->get($this->url('/mahasiswa'), ['npm' => $nim]);

            if ($respons->failed()) {
                $this->logGagal('mahasiswa', $respons, ['nim' => $nim]);

                return null;
            }

            $mahasiswa = $respons->json('data.0');

            if (! $mahasiswa) {
                Log::info('Data Master: NIM tidak ditemukan', ['nim' => $nim]);

                return null;
            }

            $namaProdi = $mahasiswa['prodi'] ?? null;

            return [
                'nama' => $mahasiswa['nama'] ?? null,
                'prodi' => $namaProdi,
                'fakultas' => $namaProdi ? $this->fakultasDariProdi($namaProdi) : null,
                'angkatan' => $mahasiswa['angkatan'] ?? null,
            ];
        } catch (\Throwable $e) {
            report($e);

            return null;
        }
    }

    /*
    |--------------------------------------------------------------------
    | Helper internal
    |--------------------------------------------------------------------
    */

    /**
     * Endpoint /mahasiswa hanya memberi nama prodi, bukan nama fakultas,
     * jadi fakultas dicari lewat daftar prodi. Daftar prodi di-cache 6 jam
     * karena datanya hampir tidak pernah berubah (lihat "Praktik terbaik"
     * no. 5 di dokumentasi API: cache data yang jarang berubah).
     */
    public function fakultasDariProdi(string $namaProdi): ?string
    {
        foreach ($this->daftarProdi() as $prodi) {
            if (isset($prodi['nama_prodi']) && strcasecmp($prodi['nama_prodi'], $namaProdi) === 0) {
                return $prodi['fakultas'] ?? null;
            }
        }

        return null;
    }

    /**
     * Ambil SEMUA halaman dari satu endpoint daftar, mengikuti meta.last_page
     * (satu halaman = 20 baris, tidak bisa diubah lewat parameter — lihat
     * dokumentasi). Kalau $cacheKey diisi, hasil gabungannya di-cache 6 jam.
     */
    private function ambilSemuaHalaman(string $path, array $query = [], ?string $cacheKey = null): array
    {
        if (! $this->aktif()) {
            return [];
        }

        $ambil = function () use ($path, $query) {
            $hasil = [];
            $page = 1;
            $lastPage = 1;

            do {
                $respons = Http::timeout((int) config('services.data_master.timeout', 10))
                    ->withHeaders($this->authHeaders())
                    ->get($this->url($path), array_merge($query, ['page' => $page]));

                if ($respons->failed()) {
                    $this->logGagal($path, $respons, $query);
                    break;
                }

                $hasil = array_merge($hasil, $respons->json('data') ?? []);
                $lastPage = (int) ($respons->json('meta.last_page') ?? $page);
                $page++;
            } while ($page <= $lastPage);

            return $hasil;
        };

        if ($cacheKey) {
            return Cache::remember($cacheKey, now()->addHours(6), $ambil);
        }

        return $ambil();
    }

    private function url(string $path): string
    {
        return rtrim(config('services.data_master.url'), '/').'/'.ltrim($path, '/');
    }

    private function authHeaders(): array
    {
        return [
            'Authorization' => 'Bearer '.config('services.data_master.token'),
            'Accept' => 'application/json',
        ];
    }

    /**
     * Catat kegagalan request sesuai kode status yang didokumentasikan
     * (401 token salah/kedaluwarsa, 403 ability kurang, 404 tidak ada,
     * 405 metode salah).
     */
    private function logGagal(string $konteks, $respons, array $extra = []): void
    {
        Log::warning('Data Master: request gagal', array_merge([
            'endpoint' => $konteks,
            'status' => $respons->status(),
            'pesan' => $respons->json('message'),
        ], $extra));
    }
}
