@extends('layouts.app')

@section('content')

<div class="pagetitle">
    <h1>Tambah Upload Mandiri</h1>
    <nav>
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="{{ route('user.dashboard') }}">Home</a></li>
            <li class="breadcrumb-item active">Upload Sertifikat</li>
        </ol>
    </nav>
</div>

<section class="section">
    <form method="POST" action="{{ route('user.sertifikat.store') }}"
          enctype="multipart/form-data" id="form-sertifikat">
        @csrf

        <div class="row">
            {{-- ================= KOLOM KIRI: DATA KATEGORI ================= --}}
            <div class="col-12 col-lg-5">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Data Kategori</h5>

                        <div class="mb-3">
                            <label class="form-label fw-semibold">Kategori</label>
                            <select id="kategori_id_filter" class="form-select">
                                <option value="">-- Pilih Kategori --</option>
                                @foreach ($daftarKategori as $kategori)
                                    <option value="{{ $kategori->id }}">{{ $kategori->nama }}</option>
                                @endforeach
                            </select>
                        </div>

                        <div class="mb-3">
                            <label class="form-label fw-semibold">Kegiatan</label>
                            <select name="jenis_kegiatan_id" id="jenis_kegiatan_id"
                                    class="form-select @error('jenis_kegiatan_id') is-invalid @enderror">
                                <option value="">-- Pilih Kategori Dahulu --</option>
                                @foreach ($daftarJenisKegiatan as $item)
                                    <option value="{{ $item->id }}"
                                        data-kategori-id="{{ $item->kategori_id }}"
                                        @selected(old('jenis_kegiatan_id', $jenisKegiatanTerpilihAwal) == $item->id)>
                                        {{ $item->nama }}
                                    </option>
                                @endforeach
                            </select>
                            @error('jenis_kegiatan_id')
                                <div class="invalid-feedback">{{ $message }}</div>
                            @enderror
                        </div>

                        <div class="mb-3">
                            <label class="form-label fw-semibold">Jenis</label>
                            <select name="jenis_id" id="jenis_id"
                                    class="form-select @error('jenis_id') is-invalid @enderror">
                                <option value="">-- Pilih Kegiatan Dahulu --</option>
                                @foreach ($daftarJenis as $item)
                                    <option value="{{ $item->id }}" data-jenis-kegiatan-id="{{ $item->jenis_kegiatan_id }}">
                                        {{ $item->nama }}
                                    </option>
                                @endforeach
                            </select>
                            @error('jenis_id')
                                <div class="invalid-feedback">{{ $message }}</div>
                            @enderror
                            <small class="text-muted">Pilih salah satu secara manual — tidak terisi otomatis.</small>
                        </div>

                        <div class="mb-3" id="wrapper-tingkat">
                            <label class="form-label fw-semibold">Tingkat</label>
                            <select name="tingkat" id="tingkat" class="form-select @error('tingkat') is-invalid @enderror">
                                <option value="">-- Pilih Jenis Dahulu --</option>
                            </select>
                            @error('tingkat')
                                <div class="invalid-feedback">{{ $message }}</div>
                            @enderror
                        </div>

                        <div class="mb-3" id="wrapper-peran">
                            <label class="form-label fw-semibold">Peran</label>
                            <select name="peran" id="peran" class="form-select @error('peran') is-invalid @enderror">
                                <option value="">-- Pilih Jenis Dahulu --</option>
                            </select>
                            @error('peran')
                                <div class="invalid-feedback">{{ $message }}</div>
                            @enderror
                        </div>

                        <div class="mb-0">
                            <label class="form-label fw-semibold">Poin</label>
                            <div class="form-control bg-light" id="tampilan-poin">-</div>
                        </div>

                        <div id="info-jenis-kegiatan" class="mt-3 small text-muted d-none">
                            <div><strong>Dokumen diperlukan:</strong> <span id="info-dokumen"></span></div>
                            <div><strong>Periode penilaian:</strong> <span id="info-periode"></span></div>
                        </div>
                    </div>
                </div>
            </div>

            {{-- ================= KOLOM KANAN: DETAIL KEGIATAN ================= --}}
            <div class="col-12 col-lg-7">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Detail Kegiatan</h5>

                        <div class="mb-3">
                            <label class="form-label fw-semibold">Nama Kegiatan <span class="text-danger">*</span></label>
                            <input type="text" name="judul_sertifikat" value="{{ old('judul_sertifikat') }}"
                                   placeholder="Nama kegiatan sesuai yang tertulis di bukti"
                                   class="form-control @error('judul_sertifikat') is-invalid @enderror">
                            @error('judul_sertifikat')
                                <div class="invalid-feedback">{{ $message }}</div>
                            @enderror
                        </div>

                        <div class="row">
                            <div class="col-12 col-md-6 mb-3">
                                <label class="form-label fw-semibold">Penyelenggara</label>
                                <input type="text" name="penyelenggara_sertifikat" value="{{ old('penyelenggara_sertifikat') }}"
                                       class="form-control @error('penyelenggara_sertifikat') is-invalid @enderror">
                                @error('penyelenggara_sertifikat')
                                    <div class="invalid-feedback">{{ $message }}</div>
                                @enderror
                            </div>
                            <div class="col-12 col-md-6 mb-3">
                                <label class="form-label fw-semibold">Tempat Pelaksanaan</label>
                                <input type="text" name="tempat_pelaksanaan" value="{{ old('tempat_pelaksanaan') }}"
                                       class="form-control @error('tempat_pelaksanaan') is-invalid @enderror">
                                @error('tempat_pelaksanaan')
                                    <div class="invalid-feedback">{{ $message }}</div>
                                @enderror
                            </div>
                        </div>

                        <div class="mb-3">
                            <label class="form-label fw-semibold">
                                Scan Bukti Kegiatan (Sertifikat/Artikel/Surat Keterangan) <span class="text-danger">*</span>
                            </label>

                            <div id="dropzone" class="border border-2 border-dashed rounded p-4 text-center"
                                 style="cursor:pointer">
                                <i class="bi bi-cloud-upload fs-1 text-muted"></i>
                                <p class="mb-1">Seret &amp; letakkan berkas di sini, atau klik untuk pilih file</p>
                                <small class="text-muted">Format: PDF, JPG, PNG — maksimal 5 MB</small>
                                <input type="file" name="berkas" id="berkas" class="d-none"
                                       accept=".pdf,.jpg,.jpeg,.png">
                            </div>
                            @error('berkas')
                                <div class="text-danger small mt-1">{{ $message }}</div>
                            @enderror

                            <div id="area-preview" class="mt-3 d-none">
                                <div class="d-flex align-items-center gap-2 p-2 border rounded">
                                    <div id="preview-gambar"></div>
                                    <i id="preview-ikon-pdf" class="bi bi-file-earmark-pdf fs-2 text-danger d-none"></i>
                                    <div class="flex-grow-1">
                                        <div id="preview-nama" class="fw-semibold small"></div>
                                        <div id="preview-ukuran" class="text-muted small"></div>
                                    </div>
                                    <button type="button" id="btn-hapus-file" class="btn btn-sm btn-outline-danger">
                                        <i class="bi bi-x"></i>
                                    </button>
                                </div>
                            </div>
                        </div>

                        <div class="mb-3">
                            <label class="form-label fw-semibold">Deskripsi Kegiatan <span class="text-muted">(opsional)</span></label>
                            <textarea name="deskripsi_kegiatan" rows="3"
                                      class="form-control @error('deskripsi_kegiatan') is-invalid @enderror">{{ old('deskripsi_kegiatan') }}</textarea>
                            @error('deskripsi_kegiatan')
                                <div class="invalid-feedback">{{ $message }}</div>
                            @enderror
                        </div>

                        <div class="row">
                            <div class="col-12 col-md-6 mb-3">
                                <label class="form-label fw-semibold">Tanggal Mulai</label>
                                <input type="date" name="tanggal_mulai" id="input-tanggal-mulai" value="{{ old('tanggal_mulai') }}"
                                       class="form-control @error('tanggal_mulai') is-invalid @enderror">
                                @error('tanggal_mulai')
                                    <div class="invalid-feedback">{{ $message }}</div>
                                @enderror
                            </div>
                            <div class="col-12 col-md-6 mb-3">
                                <label class="form-label fw-semibold">Tanggal Selesai</label>
                                <input type="date" name="tanggal_selesai" id="input-tanggal-selesai" value="{{ old('tanggal_selesai') }}"
                                       class="form-control @error('tanggal_selesai') is-invalid @enderror">
                                @error('tanggal_selesai')
                                    <div class="invalid-feedback">{{ $message }}</div>
                                @enderror
                                <div class="invalid-feedback" id="pesan-tanggal-tidak-logis">
                                    Tanggal selesai tidak boleh sebelum tanggal mulai.
                                </div>
                            </div>
                        </div>

                        <div class="mb-3">
                            <label class="form-label fw-semibold">Nomor Sertifikat <span class="text-muted">(opsional)</span></label>
                            <input type="text" name="nomor_sertifikat" value="{{ old('nomor_sertifikat') }}"
                                   class="form-control @error('nomor_sertifikat') is-invalid @enderror">
                            @error('nomor_sertifikat')
                                <div class="invalid-feedback">{{ $message }}</div>
                            @enderror
                        </div>

                        <div id="area-progress" class="mb-3 d-none">
                            <div class="progress" style="height: 20px;">
                                <div id="progress-bar" class="progress-bar bg-primary" style="width: 0%">0%</div>
                            </div>
                        </div>

                        <div id="area-pesan" class="mb-3"></div>

                        <button type="submit" id="btn-submit" class="btn btn-primary">
                            <i class="bi bi-cloud-upload"></i> Simpan
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </form>
</section>

@push('scripts')
<script>
    const petaSkemaPoin = @json($petaSkemaPoin);
    const infoJenisKegiatan = @json($daftarJenisKegiatan->keyBy('id')->map(fn ($j) => [
        'dokumen' => $j->dokumen,
        'periode_penilaian' => $j->periode_penilaian,
    ]));

    const filterKategori = document.getElementById('kategori_id_filter');
    const selectJenisKegiatan = document.getElementById('jenis_kegiatan_id');
    const selectJenis = document.getElementById('jenis_id');
    const selectTingkat = document.getElementById('tingkat');
    const selectPeran = document.getElementById('peran');
    const tampilanPoin = document.getElementById('tampilan-poin');
    const wrapperTingkat = document.getElementById('wrapper-tingkat');
    const wrapperPeran = document.getElementById('wrapper-peran');
    const infoBox = document.getElementById('info-jenis-kegiatan');
    const infoDokumen = document.getElementById('info-dokumen');
    const infoPeriode = document.getElementById('info-periode');

    const semuaOpsiJenisKegiatan = Array.from(selectJenisKegiatan.options);
    const semuaOpsiJenis = Array.from(selectJenis.options);

    // 1) Filter Kegiatan berdasarkan Kategori terpilih (murni client-side)
    filterKategori.addEventListener('change', function () {
        const kategoriTerpilih = filterKategori.value;

        selectJenisKegiatan.innerHTML = '';
        semuaOpsiJenisKegiatan.forEach((opsi) => {
            const cocok = ! kategoriTerpilih || opsi.value === '' || opsi.dataset.kategoriId === kategoriTerpilih;
            if (cocok) {
                selectJenisKegiatan.appendChild(opsi.cloneNode(true));
            }
        });

        resetJenisDanBawahnya();
    });

    function resetJenisDanBawahnya() {
        selectJenis.innerHTML = '<option value="">-- Pilih Kegiatan Dahulu --</option>';
        resetTingkatPeranPoin();
    }

    function resetTingkatPeranPoin() {
        selectTingkat.innerHTML = '<option value="">-- Tidak Berlaku --</option>';
        selectPeran.innerHTML = '<option value="">-- Tidak Berlaku --</option>';
        tampilanPoin.textContent = '-';
        wrapperTingkat.classList.add('d-none');
        wrapperPeran.classList.add('d-none');
    }

    // 2) Saat Kegiatan dipilih: isi pilihan Jenis (TIDAK otomatis terpilih —
    //    mahasiswa wajib memilih sendiri secara manual), dan tampilkan info
    //    dokumen/periode penilaian milik Kegiatan tersebut.
    selectJenisKegiatan.addEventListener('change', function () {
        const idKegiatan = selectJenisKegiatan.value;
        resetJenisDanBawahnya();

        if (! idKegiatan) {
            infoBox.classList.add('d-none');
            return;
        }

        selectJenis.innerHTML = '<option value="">-- Pilih Jenis --</option>';
        semuaOpsiJenis.forEach((opsi) => {
            if (opsi.dataset.jenisKegiatanId === idKegiatan) {
                selectJenis.appendChild(opsi.cloneNode(true));
            }
        });

        const info = infoJenisKegiatan[idKegiatan];
        if (info) {
            infoDokumen.textContent = info.dokumen || '-';
            infoPeriode.textContent = info.periode_penilaian || '-';
            infoBox.classList.remove('d-none');
        }
    });

    // 3) Saat Jenis dipilih (manual): tampilkan dropdown Tingkat/Peran HANYA
    //    kalau memang dipakai oleh Jenis ini.
    selectJenis.addEventListener('change', function () {
        const id = selectJenis.value;
        resetTingkatPeranPoin();

        if (! id || ! petaSkemaPoin[id]) return;

        const kombinasi = petaSkemaPoin[id];
        const daftarTingkat = [...new Set(kombinasi.map(k => k.tingkat).filter(Boolean))];
        const daftarPeran = [...new Set(kombinasi.map(k => k.peran).filter(Boolean))];

        if (daftarTingkat.length > 0) {
            wrapperTingkat.classList.remove('d-none');
            selectTingkat.innerHTML = '<option value="">-- Pilih Tingkat --</option>';
            daftarTingkat.forEach(t => {
                const opsi = document.createElement('option');
                opsi.value = t;
                opsi.textContent = t;
                selectTingkat.appendChild(opsi);
            });
        }

        if (daftarPeran.length > 0) {
            wrapperPeran.classList.remove('d-none');
            selectPeran.innerHTML = '<option value="">-- Pilih Peran --</option>';
            daftarPeran.forEach(p => {
                const opsi = document.createElement('option');
                opsi.value = p;
                opsi.textContent = p;
                selectPeran.appendChild(opsi);
            });
        }

        // Kalau Jenis ini tidak punya dimensi tingkat/peran sama sekali
        // (seharusnya tidak terjadi kalau data skema poin lengkap), tetap coba
        // hitung poin langsung dari satu-satunya kombinasi yang ada.
        if (daftarTingkat.length === 0 && daftarPeran.length === 0 && kombinasi.length > 0) {
            tampilanPoin.textContent = kombinasi[0].poin;
        }

        hitungPoin();
    });

    function hitungPoin() {
        const id = selectJenis.value;
        if (! id || ! petaSkemaPoin[id]) {
            tampilanPoin.textContent = '-';
            return;
        }

        const tingkatDipakai = ! wrapperTingkat.classList.contains('d-none');
        const peranDipakai = ! wrapperPeran.classList.contains('d-none');

        const nilaiTingkat = tingkatDipakai ? (selectTingkat.value || null) : null;
        const nilaiPeran = peranDipakai ? (selectPeran.value || null) : null;

        // Kalau dimensinya dipakai tapi belum dipilih, jangan tampilkan poin dulu.
        if ((tingkatDipakai && ! nilaiTingkat) || (peranDipakai && ! nilaiPeran)) {
            tampilanPoin.textContent = '-';
            return;
        }

        const cocok = petaSkemaPoin[id].find(k =>
            (k.tingkat || null) === nilaiTingkat && (k.peran || null) === nilaiPeran
        );

        tampilanPoin.textContent = cocok ? cocok.poin : '-';
    }

    selectTingkat.addEventListener('change', hitungPoin);
    selectPeran.addEventListener('change', hitungPoin);

    // Kalau Kegiatan sudah ter-pre-select saat halaman dimuat (misal validasi gagal
    // dan form di-render ulang dengan old input), picu ulang alur Kegiatan → Jenis,
    // tapi Jenis TETAP tidak dipilih otomatis kecuali memang ada old('jenis_id').
    if (selectJenisKegiatan.value) {
        const opsiTerpilih = selectJenisKegiatan.options[selectJenisKegiatan.selectedIndex];
        if (opsiTerpilih && opsiTerpilih.dataset.kategoriId) {
            filterKategori.value = opsiTerpilih.dataset.kategoriId;
        }
        selectJenisKegiatan.dispatchEvent(new Event('change'));

        const jenisTersimpan = @json(old('jenis_id'));
        if (jenisTersimpan) {
            selectJenis.value = jenisTersimpan;
            selectJenis.dispatchEvent(new Event('change'));
            selectTingkat.value = @json(old('tingkat'));
            selectPeran.value = @json(old('peran'));
            hitungPoin();
        }
    }

    // ================= Upload berkas: dropzone, preview, progress bar =================
    const dropzone = document.getElementById('dropzone');
    const inputBerkas = document.getElementById('berkas');
    const areaPreview = document.getElementById('area-preview');
    const previewGambar = document.getElementById('preview-gambar');
    const previewIkonPdf = document.getElementById('preview-ikon-pdf');
    const previewNama = document.getElementById('preview-nama');
    const previewUkuran = document.getElementById('preview-ukuran');
    const btnHapusFile = document.getElementById('btn-hapus-file');
    const form = document.getElementById('form-sertifikat');
    const areaProgress = document.getElementById('area-progress');
    const progressBar = document.getElementById('progress-bar');
    const areaPesan = document.getElementById('area-pesan');
    const btnSubmit = document.getElementById('btn-submit');
    const inputTanggalMulai = document.getElementById('input-tanggal-mulai');
    const inputTanggalSelesai = document.getElementById('input-tanggal-selesai');

    dropzone.addEventListener('click', () => inputBerkas.click());

    ['dragover', 'dragleave', 'drop'].forEach(eventName => {
        dropzone.addEventListener(eventName, (e) => e.preventDefault());
    });
    dropzone.addEventListener('dragover', () => dropzone.classList.add('border-primary'));
    dropzone.addEventListener('dragleave', () => dropzone.classList.remove('border-primary'));
    dropzone.addEventListener('drop', (e) => {
        dropzone.classList.remove('border-primary');
        if (e.dataTransfer.files.length) {
            inputBerkas.files = e.dataTransfer.files;
            tampilkanPreview(e.dataTransfer.files[0]);
        }
    });

    inputBerkas.addEventListener('change', () => {
        if (inputBerkas.files.length) {
            tampilkanPreview(inputBerkas.files[0]);
        }
    });

    function tampilkanPreview(file) {
        previewNama.textContent = file.name;
        previewUkuran.textContent = (file.size / 1024).toFixed(0) + ' KB';
        areaPreview.classList.remove('d-none');

        if (file.type.startsWith('image/')) {
            previewIkonPdf.classList.add('d-none');
            const pembaca = new FileReader();
            pembaca.onload = (e) => {
                previewGambar.innerHTML = `<img src="${e.target.result}" style="width:48px;height:48px;object-fit:cover;border-radius:4px">`;
            };
            pembaca.readAsDataURL(file);
        } else {
            previewGambar.innerHTML = '';
            previewIkonPdf.classList.remove('d-none');
        }
    }

    btnHapusFile.addEventListener('click', () => {
        inputBerkas.value = '';
        areaPreview.classList.add('d-none');
    });

    // Validasi logika tanggal langsung saat dipilih — jangan tunggu sampai klik
    // Simpan. Sebelumnya form tetap bisa di-submit walau tanggal selesai < tanggal
    // mulai; baru gagal di validasi server (422) tanpa disadari sebagai kesalahan
    // tanggal, dan datanya memang tidak pernah masuk ke Riwayat.
    function tanggalLogis() {
        if (! inputTanggalMulai.value || ! inputTanggalSelesai.value) {
            inputTanggalSelesai.classList.remove('is-invalid');
            return true;
        }

        const logis = inputTanggalSelesai.value >= inputTanggalMulai.value;
        inputTanggalSelesai.classList.toggle('is-invalid', ! logis);
        return logis;
    }

    // Batasi date picker Tanggal Selesai supaya tidak bisa memilih tanggal
    // sebelum Tanggal Mulai sama sekali (lapisan pertama, sebelum validasi di atas).
    inputTanggalMulai.addEventListener('change', () => {
        inputTanggalSelesai.min = inputTanggalMulai.value || '';
        tanggalLogis();
    });
    inputTanggalSelesai.addEventListener('change', tanggalLogis);

    // Submit lewat XHR agar progress upload bisa ditampilkan (form biasa tidak bisa)
    form.addEventListener('submit', function (e) {
        e.preventDefault();

        if (! inputBerkas.files.length) {
            areaPesan.innerHTML = '<div class="alert alert-danger py-2">Pilih berkas sertifikat terlebih dahulu.</div>';
            return;
        }

        if (! tanggalLogis()) {
            areaPesan.innerHTML = '<div class="alert alert-danger py-2">Tanggal selesai tidak boleh sebelum tanggal mulai. Perbaiki dulu tanggalnya.</div>';
            inputTanggalSelesai.focus();
            return;
        }

        const formData = new FormData(form);
        const xhr = new XMLHttpRequest();

        areaProgress.classList.remove('d-none');
        areaPesan.innerHTML = '';
        btnSubmit.disabled = true;

        xhr.upload.addEventListener('progress', (e) => {
            if (e.lengthComputable) {
                const persen = Math.round((e.loaded / e.total) * 100);
                progressBar.style.width = persen + '%';
                progressBar.textContent = persen + '%';
            }
        });

        xhr.addEventListener('load', () => {
            btnSubmit.disabled = false;

            // Sukses: server sudah menyimpan flash 'success' + mengirim URL Riwayat
            // lewat JSON. Kita navigasi SATU KALI ke sana — supaya notifikasi
            // (session flash) sampai utuh ke halaman Riwayat, tanpa hop tersembunyi
            // yang bikin pesannya "termakan" seperti sebelumnya.
            if (xhr.status >= 200 && xhr.status < 300) {
                let respons = {};
                try { respons = JSON.parse(xhr.responseText); } catch (e) {}

                window.location.href = respons.redirect || '{{ route('user.sertifikat.index') }}';
                return;
            }

            areaProgress.classList.add('d-none');

            if (xhr.status === 422) {
                const respons = JSON.parse(xhr.responseText);
                const daftarError = Object.values(respons.errors ?? {}).flat();
                areaPesan.innerHTML = '<div class="alert alert-danger py-2">' + daftarError.join('<br>') + '</div>';
            } else {
                let pesan = 'Terjadi kesalahan saat mengunggah. Coba lagi.';
                try {
                    const respons = JSON.parse(xhr.responseText);
                    pesan = respons.message || pesan;
                } catch (e) {}
                areaPesan.innerHTML = '<div class="alert alert-danger py-2">' + pesan + '</div>';
            }
        });

        xhr.addEventListener('error', () => {
            btnSubmit.disabled = false;
            areaProgress.classList.add('d-none');
            areaPesan.innerHTML = '<div class="alert alert-danger py-2">Koneksi terputus saat mengunggah. Coba lagi.</div>';
        });

        xhr.open('POST', form.action, true);
        xhr.setRequestHeader('X-Requested-With', 'XMLHttpRequest');
        xhr.setRequestHeader('Accept', 'application/json');
        xhr.send(formData);
    });
</script>
@endpush

@endsection
