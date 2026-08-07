<table class="table table-borderless">
    <thead>
        <tr>
            <th>NIM</th>
            <th>Nama</th>
            <th>Prodi</th>
            <th>Fakultas</th>
            <th>Total Poin</th>
            <th class="text-end">Aksi</th>
        </tr>
    </thead>
    <tbody>
        @forelse ($mahasiswa as $item)
            <tr>
                <td>{{ $item->nim }}</td>
                <td>{{ $item->pengguna->nama }}</td>
                <td>{{ $item->prodi }}</td>
                <td>{{ $item->fakultas }}</td>
                <td>{{ number_format($item->portofolio->total_poin ?? 0, 0) }}</td>
                <td class="text-end">
                    <a href="{{ route('admin.portofolio-mahasiswa.show', $item) }}"
                       class="btn btn-sm btn-outline-primary">
                        <i class="bi bi-eye"></i> Lihat Portofolio
                    </a>
                    @if (app(\App\Services\DataMasterClient::class)->aktif())
                        <form action="{{ route('admin.portofolio-mahasiswa.sinkron-data-master', $item) }}"
                              method="POST" class="d-inline">
                            @csrf
                            <button type="submit" class="btn btn-sm btn-outline-secondary" title="Sinkron dari Data Master">
                                <i class="bi bi-arrow-repeat"></i>
                            </button>
                        </form>
                    @endif
                </td>
            </tr>
        @empty
            <tr>
                <td colspan="6" class="text-center text-muted py-4">Belum ada data mahasiswa</td>
            </tr>
        @endforelse
    </tbody>
</table>

{{ $mahasiswa->links() }}
