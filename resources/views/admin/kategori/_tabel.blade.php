<table class="table table-borderless">
    <thead>
        <tr>
            <th>Nama</th>
            <th>Poin Maksimum</th>
            <th>Jml Jenis Kegiatan</th>
            <th class="text-end">Aksi</th>
        </tr>
    </thead>
    <tbody>
        @forelse ($kategori as $item)
            <tr>
                <td>{{ $item->nama }}</td>
                <td>{{ number_format($item->poin_maksimum, 0) }}</td>
                <td>{{ $item->jenis_kegiatan_count }}</td>
                <td class="text-end">
                    <a href="{{ route('admin.kategori.edit', $item) }}"
                       class="btn btn-sm btn-outline-primary">
                        <i class="bi bi-pencil"></i>
                    </a>
                    <form action="{{ route('admin.kategori.destroy', $item) }}"
                          method="POST" class="d-inline"
                          data-confirm="Hapus kategori ini?"
                          data-confirm-title="Hapus Kategori"
                          data-confirm-tombol="Ya, Hapus"
                          data-confirm-tipe="danger">
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
                <td colspan="4" class="text-center text-muted py-4">Belum ada kategori</td>
            </tr>
        @endforelse
    </tbody>
</table>

{{ $kategori->links() }}
