<?php

namespace App\Models;

use App\Enums\StatusSertifikat;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class Sertifikat extends Model
{
    use HasFactory;

    protected $table = 'sertifikat';

    protected $fillable = [
        'mahasiswa_id',
        'jenis_id',
        'tingkat',
        'peran',
        'judul_sertifikat',
        'nomor_sertifikat',
        'penyelenggara_sertifikat',
        'tempat_pelaksanaan',
        'deskripsi_kegiatan',
        'tanggal_mulai',
        'tanggal_selesai',
        'berkas',
        'thumbnail',
        'status',
        'pengguna_validator_id',
        'catatan',
        'poin',
    ];

    protected function casts(): array
    {
        return [
            'status' => StatusSertifikat::class,
            'poin' => 'decimal:2',
            'tanggal_mulai' => 'date',
            'tanggal_selesai' => 'date',
        ];
    }

    public function mahasiswa(): BelongsTo
    {
        return $this->belongsTo(Mahasiswa::class, 'mahasiswa_id');
    }

    public function jenis(): BelongsTo
    {
        return $this->belongsTo(Jenis::class, 'jenis_id');
    }

    public function validator(): BelongsTo
    {
        return $this->belongsTo(User::class, 'pengguna_validator_id');
    }
}
