<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <title>Portofolio - {{ $mahasiswa?->pengguna?->nama ?? auth()->user()->nama }}</title>
    <style>
        * { box-sizing: border-box; }
        body {
            font-family: 'Segoe UI', Arial, sans-serif;
            color: #212529;
            padding: 40px;
            max-width: 900px;
            margin: 0 auto;
        }
        .kop {
            text-align: center;
            border-bottom: 3px solid #212529;
            padding-bottom: 16px;
            margin-bottom: 24px;
        }
        .kop img { height: 60px; margin-bottom: 8px; }
        .kop h1 { font-size: 20px; margin: 4px 0; }
        .kop p { margin: 2px 0; color: #555; }
        .info-mahasiswa { margin-bottom: 20px; }
        .info-mahasiswa table { width: 100%; }
        .info-mahasiswa td { padding: 3px 0; }
        .info-mahasiswa td:first-child { width: 160px; font-weight: 600; }
        .total-poin {
            text-align: center;
            background: #f1f3f5;
            border-radius: 8px;
            padding: 16px;
            margin-bottom: 24px;
        }
        .total-poin .angka { font-size: 32px; font-weight: 700; }
        table.daftar {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 24px;
        }
        table.daftar th, table.daftar td {
            border: 1px solid #ccc;
            padding: 8px;
            font-size: 13px;
            text-align: left;
        }
        table.daftar th { background: #e9ecef; }
        .tanda-tangan {
            margin-top: 60px;
            display: flex;
            justify-content: flex-end;
        }
        .tanda-tangan .kolom { text-align: center; width: 240px; }
        .tanda-tangan .garis { margin-top: 60px; border-top: 1px solid #212529; }
        .tombol-cetak {
            text-align: center;
            margin-bottom: 24px;
        }
        @media print {
            .tombol-cetak { display: none; }
            body { padding: 0; }
        }
        @media screen and (max-width: 600px) {
            body { padding: 16px; }
            .kop img { height: 44px; }
            .kop h1 { font-size: 16px; }
            table.daftar th, table.daftar td { font-size: 11px; padding: 5px; }
        }
    </style>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.10.1/html2pdf.bundle.min.js"></script>
</head>
<body>

    <div class="tombol-cetak">
        @if ($modeAdmin ?? false)
            <a href="{{ route('admin.portofolio-mahasiswa.index') }}" style="padding:8px 20px;font-size:14px;text-decoration:none;border:1px solid #ccc;border-radius:4px;margin-right:8px;">
                ← Kembali ke Daftar Mahasiswa
            </a>
        @else
            <a href="{{ route('user.portofolio') }}" style="padding:8px 20px;font-size:14px;text-decoration:none;border:1px solid #ccc;border-radius:4px;margin-right:8px;">
                ← Kembali ke Portofolio
            </a>
        @endif
        <button id="btn-unduh-pdf" onclick="unduhPDF()" style="padding:8px 20px;font-size:14px;cursor:pointer;">
            Unduh PDF
        </button>
    </div>

    <div id="konten-cetak">

    <div class="kop">
        <img src="{{ asset('assets/img/Logo UKRI.png') }}" alt="Logo UKRI">
        <h1>REKAP PORTOFOLIO KEGIATAN KEMAHASISWAAN</h1>
        <p>Universitas Kebangsaan Republik Indonesia (UKRI)</p>
        <p>Dasar Penyusunan Surat Keterangan Pendamping Ijazah (SKPI)</p>
    </div>

    <div class="info-mahasiswa">
        <table>
            <tr><td>Nama</td><td>: {{ $mahasiswa?->pengguna?->nama ?? '-' }}</td></tr>
            <tr><td>NIM</td><td>: {{ $mahasiswa?->nim ?? '-' }}</td></tr>
            <tr><td>Program Studi</td><td>: {{ $mahasiswa?->prodi ?? '-' }}</td></tr>
            <tr><td>Fakultas</td><td>: {{ $mahasiswa?->fakultas ?? '-' }}</td></tr>
            <tr><td>Angkatan</td><td>: {{ $mahasiswa?->angkatan ?? '-' }}</td></tr>
            <tr><td>Tanggal Cetak</td><td>: {{ now()->translatedFormat('d F Y') }}</td></tr>
        </table>
    </div>

    <div class="total-poin">
        <div>Total Poin Terkumpul</div>
        <div class="angka">{{ number_format($portofolio->total_poin ?? 0, 0) }}</div>
    </div>

    <div style="overflow-x: auto; -webkit-overflow-scrolling: touch;">
    <table class="daftar">
        <thead>
            <tr>
                <th>No</th>
                <th>Nama Kegiatan</th>
                <th>No. Sertifikat</th>
                <th>Kategori</th>
                <th>Jenis Kegiatan</th>
                <th>Tingkat / Peran</th>
                <th>Penyelenggara</th>
                <th>Tanggal</th>
                <th>Poin</th>
            </tr>
        </thead>
        <tbody>
            @forelse ($daftarSertifikatDisetujui as $index => $item)
                <tr>
                    <td>{{ $index + 1 }}</td>
                    <td>{{ $item->judul_sertifikat }}</td>
                    <td>{{ $item->nomor_sertifikat ?? '-' }}</td>
                    <td>{{ $item->jenis->kegiatan->kategori->nama }}</td>
                    <td>{{ $item->jenis->kegiatan->nama }} — {{ $item->jenis->nama }}</td>
                    <td>{{ implode(' / ', array_filter([$item->tingkat, $item->peran])) ?: '-' }}</td>
                    <td>{{ $item->penyelenggara_sertifikat ?? '-' }}</td>
                    <td>{{ $item->tanggal_mulai?->format('d-m-Y') ?? '-' }}</td>
                    <td>{{ number_format($item->poin, 0) }}</td>
                </tr>
            @empty
                <tr>
                    <td colspan="9" style="text-align:center;color:#888;">Belum ada kegiatan tersertifikasi</td>
                </tr>
            @endforelse
        </tbody>
    </table>
    </div>

    <div class="tanda-tangan">
        <div class="kolom">
            <div>Mengetahui,</div>
            <div>Admin Kemahasiswaan UKRI</div>
            <div class="garis">&nbsp;</div>
        </div>
    </div>

    </div>{{-- /#konten-cetak --}}

    <script>
        function unduhPDF() {
            var tombol = document.getElementById('btn-unduh-pdf');
            var labelAsli = tombol.innerHTML;
            tombol.disabled = true;
            tombol.innerHTML = 'Menyiapkan PDF...';

            var konten = document.getElementById('konten-cetak');
            var namaFile = 'Portofolio-{{ $mahasiswa?->nim ?? auth()->user()->nama }}.pdf';

            html2pdf().set({
                margin: 10,
                filename: namaFile,
                image: { type: 'jpeg', quality: 0.98 },
                html2canvas: { scale: 2, useCORS: true },
                jsPDF: { unit: 'mm', format: 'a4', orientation: 'portrait' },
            }).from(konten).save().finally(function () {
                tombol.disabled = false;
                tombol.innerHTML = labelAsli;
            });
        }
    </script>
</body>
</html>
