<table class="table table-borderless">
    <thead>
        <tr>
            <th>Nama</th>
            <th>Kategori</th>
            <th>Dokumen</th>
            <th>Periode Penilaian</th>
            <th>Jml Jenis</th>
            <th class="text-end">Aksi</th>
        </tr>
    </thead>
    <tbody>
        @forelse ($jenisKegiatan as $item)
            <tr>
                <td>{{ $item->nama }}</td>
                <td>{{ $item->kategori->nama }}</td>
                <td>{{ $item->dokumen ?? '-' }}</td>
                <td>{{ $item->periode_penilaian ?? '-' }}</td>
                <td>{{ $item->jenis_count }}</td>
                <td class="text-end">
                    <a href="{{ route('admin.jenis-kegiatan.edit', $item) }}"
                       class="btn btn-sm btn-outline-primary">
                        <i class="bi bi-pencil"></i>
                    </a>
                    <form action="{{ route('admin.jenis-kegiatan.destroy', $item) }}"
                          method="POST" class="d-inline"
                          onsubmit="return confirm('Hapus kegiatan ini beserta seluruh Jenis dan skema poinnya?');">
                        @csrf
                        @method('DELETE')
                        <button type="submit" class="btn btn-sm btn-outline-danger">
                            <i class="bi bi-trash"></i>
                        </button>
                    </form>
                </td>
            </tr>
        @empty
            <tr>
                <td colspan="6" class="text-center text-muted py-4">Belum ada kegiatan</td>
            </tr>
        @endforelse
    </tbody>
</table>

{{ $jenisKegiatan->links() }}
