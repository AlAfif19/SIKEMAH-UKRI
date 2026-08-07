# Integrasi Data Master UKRI — Persiapan & Panduan

## Jawaban langsung: apakah SIKEMAH sudah bisa menangani ini?

**Ya.** Sudah disiapkan struktur lengkapnya (config, service class, titik integrasi, command sinkron, tombol manual di admin) — statusnya sama seperti SSO kemarin: **siap, tapi tidak aktif** sampai kredensial & dokumentasi API sungguhan didapat. Tidak ada bagian sistem lain yang perlu diubah nanti — cukup isi `.env` dan sesuaikan satu file (`DataMasterClient.php`) kalau format autentikasi/response-nya berbeda dari perkiraan.

## Kenapa "token" dan "secret" membingungkan — ini 3 pola yang biasanya dipakai

| Pola | Cara kerja | Ciri-ciri |
|---|---|---|
| **1. Bearer token tunggal** | Satu token statis dikirim di header `Authorization: Bearer <token>` setiap request | Paling simpel. Kalau pemberi akses cuma bilang "ini tokennya" tanpa istilah "secret" terpisah, biasanya ini. |
| **2. Token + Secret untuk signature (HMAC)** | Token = identitas, Secret = kunci untuk **menandatangani** request (bukan dikirim langsung). Server menghitung ulang signature dan membandingkan | Dipakai kalau mereka peduli soal request bisa dipalsukan/di-replay. Biasanya ada header seperti `X-Signature` atau `X-Timestamp`. |
| **3. Client ID + Client Secret (OAuth2 Client Credentials)** | Mirip SSO kemarin, tapi tanpa user login — sistem SIKEMAH sendiri "login" pakai client_id+secret ke satu endpoint, ditukar jadi `access_token` sementara, baru dipakai hit API data | Dipakai kalau Data Master juga berbasis Passport/OAuth2 seperti SSO. |

**Saran konkret:** saat minta akses ke pengelola Data Master, tanyakan langsung: *"Apakah ini Bearer token statis, atau perlu ditukar dulu (client_id+secret → access_token)? Kalau ada 'secret', itu dikirim di header atau dipakai untuk signature?"* — jawaban itu langsung menentukan yang perlu diubah di `DataMasterClient.php`.

## Yang sudah disiapkan

| File | Isi |
|---|---|
| `config/services.php` → `services.data_master` | `enabled`, `url`, `token`, `secret`, `timeout` — dibaca dari `.env` |
| `.env.example` | 5 variabel `DATA_MASTER_*`, default `DATA_MASTER_ENABLED=false` |
| `app/Services/DataMasterClient.php` | Class terpusat — **satu-satunya tempat** yang perlu diubah kalau pola autentikasi/response beda dari perkiraan. Berisi catatan lengkap 3 pola di atas langsung di komentar kode. |
| `database/migrations/..._add_sinkron_data_master_pada...` | Kolom `sinkron_data_master_pada` di tabel `mahasiswa` — mencatat kapan data terakhir berhasil ditarik dari Data Master (`null` = belum pernah/masih data manual) |
| `app/Http/Controllers/Auth/SsoController.php` | Saat mahasiswa baru login lewat SSO, otomatis coba tarik prodi/fakultas/angkatan dari Data Master dulu — **fallback ke `"-"`** kalau belum aktif/gagal (perilaku lama tidak berubah) |
| `app/Console/Commands/SinkronDataMasterCommand.php` | `php artisan data-master:sinkron-mahasiswa` — sinkron semua mahasiswa, atau `php artisan data-master:sinkron-mahasiswa 20221310002` untuk satu NIM saja |
| Tombol 🔄 di halaman **Portofolio Mahasiswa** (admin) | Sinkron manual satu mahasiswa langsung dari UI — **otomatis tersembunyi** selama integrasi belum aktif, jadi tidak mengganggu tampilan sekarang |

## Yang perlu disiapkan (dari sisi kamu / pengelola Data Master)

1. **URL endpoint API** (misal `https://datamaster.ukri.ac.id/api`)
2. **Kredensial** — token, dan secret kalau ada (simpan di `.env`, **jangan pernah** commit ke git)
3. **Dokumentasi field response** — nama field asli untuk nama/prodi/fakultas/angkatan (kode sekarang menebak `prodi` atau `program_studi`, dst. — perlu dipastikan)
4. **Rate limit** — kalau ada, supaya command sinkron massal tidak diblokir (bisa ditambah `sleep()` antar request kalau perlu)
5. **Format NIM** — pastikan format NIM di Data Master sama dengan yang dipakai SSO (`username` dari SSO dipakai sebagai key pencarian ke Data Master)

## Dampak ke sistem yang sudah ada

- **Tidak ada dampak sekarang** — semua nonaktif secara default, kode lama (fallback manual `"-"`) tetap berjalan seperti biasa.
- **Setelah aktif:** akun mahasiswa yang baru login via SSO otomatis dapat data lengkap. Akun yang **sudah ada** (masih placeholder `"-"`) perlu dibetulkan sekali lewat `php artisan data-master:sinkron-mahasiswa` (semua) atau tombol 🔄 (satu-satu).
- **Kalau Data Master down/lambat saat mahasiswa login SSO:** login tetap berhasil (poin desain fallback ini) — hanya prodi/fakultas yang sementara `"-"` sampai disinkron ulang nanti.
- **Keamanan:** token/secret di `.env`, tidak pernah tampil di log kecuali terjadi error tak terduga (`report($e)` mencatat exception, bukan mencetak token).

## Langkah aktivasi nanti (setelah akses diberikan)

1. Buka `app/Services/DataMasterClient.php`, cek apakah pola autentikasinya cocok dengan yang sudah ada (Bearer token). Kalau beda (HMAC atau OAuth2 client credentials), sesuaikan method `authHeaders()` sesuai 2 alternatif yang sudah dikomentari di file itu.
2. Cek nama field response asli, sesuaikan bagian normalisasi di `ambilDataMahasiswa()`.
3. Isi `.env`:
   ```env
   DATA_MASTER_ENABLED=true
   DATA_MASTER_URL=https://url-asli-dari-mereka
   DATA_MASTER_TOKEN=isi_token_asli
   DATA_MASTER_SECRET=isi_secret_asli_kalau_ada
   ```
4. Jalankan migration: `php artisan migrate`
5. Tes satu NIM dulu: `php artisan data-master:sinkron-mahasiswa <nim>`
6. Kalau berhasil, jalankan tanpa argumen untuk sinkron semua mahasiswa yang sudah ada.
