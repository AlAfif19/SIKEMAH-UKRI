@if (session('error'))
    <div class="alert alert-danger">{{ session('error') }}</div>
@endif

<form id="form-massal" method="POST" action="{{ route('admin.validasi-sertifikat.massal') }}">
    @csrf

    @if ($status === 'menunggu')
        <div class="mb-2">
            <button type="submit" class="btn btn-sm btn-success" id="btn-setujui-massal" disabled
                    onclick="return confirm('Setujui semua pengajuan terpilih? Poin akan otomatis ditambahkan ke portofolio masing-masing mahasiswa.');">
                <i class="bi bi-check2-all"></i> Setujui yang Dipilih
            </button>
        </div>
    @endif

    <table class="table table-borderless">
        <thead>
            <tr>
                @if ($status === 'menunggu')
                    <th><input type="checkbox" id="pilih-semua"></th>
                @endif
                <th>Mahasiswa</th>
                <th>Berkas</th>
                <th>Nama Kegiatan</th>
                <th>Kategori / Jenis</th>
                <th>Tingkat / Peran</th>
                <th>Poin</th>
                <th>Status</th>
                <th>Diajukan</th>
                <th class="text-end">Aksi</th>
            </tr>
        </thead>
        <tbody>
            @forelse ($sertifikat as $item)
                <tr>
                    @if ($status === 'menunggu')
                        <td>
                            <input type="checkbox" name="sertifikat_id[]" value="{{ $item->id }}"
                                   class="cek-item">
                        </td>
                    @endif
                    <td>
                        {{ $item->mahasiswa->pengguna->nama }}<br>
                        <small class="text-muted">{{ $item->mahasiswa->nim }}</small>
                    </td>
                    <td>
                        <a href="{{ route('admin.validasi-sertifikat.show', $item) }}">
                            @if ($item->thumbnail)
                                <img src="{{ asset('storage/'.$item->thumbnail) }}"
                                     alt="Thumbnail berkas" loading="lazy"
                                     style="width:48px;height:48px;object-fit:cover;border-radius:4px;">
                            @else
                                <i class="bi bi-file-earmark-pdf text-danger" style="font-size:1.8rem;"></i>
                            @endif
                        </a>
                    </td>
                    <td>{{ $item->judul_sertifikat }}</td>
                    <td>
                        {{ $item->jenis->kegiatan->kategori->nama }}<br>
                        <small class="text-muted">{{ $item->jenis->kegiatan->nama }} — {{ $item->jenis->nama }}</small>
                    </td>
                    <td>{{ implode(' / ', array_filter([$item->tingkat, $item->peran])) ?: '-' }}</td>
                    <td>{{ number_format($item->poin, 0) }}</td>
                    <td>
                        <span class="badge {{ $item->status->badgeClass() }}">
                            {{ $item->status->label() }}
                        </span>
                    </td>
                    <td>{{ $item->created_at->format('d M Y') }}</td>
                    <td class="text-end">
                        <a href="{{ route('admin.validasi-sertifikat.show', $item) }}"
                           class="btn btn-sm btn-outline-primary">
                            <i class="bi bi-eye"></i> Detail
                        </a>
                    </td>
                </tr>
            @empty
                <tr>
                    <td colspan="10" class="text-center text-muted py-4">Tidak ada data</td>
                </tr>
            @endforelse
        </tbody>
    </table>
</form>

{{ $sertifikat->links() }}
