<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Attributes\Fillable;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;

#[Fillable(['kategori_id', 'nama', 'dokumen', 'periode_penilaian', 'penilai'])]
class JenisKegiatan extends Model
{
    use HasFactory;

    protected $table = 'jenis_kegiatan';

    public function kategori(): BelongsTo
    {
        return $this->belongsTo(Kategori::class, 'kategori_id');
    }

    /**
     * Label yang ditampilkan ke user tetap "Kegiatan" — nama class ini
     * historis dari sebelum level "Jenis" ditambahkan di bawahnya.
     */
    public function jenis(): HasMany
    {
        return $this->hasMany(Jenis::class, 'jenis_kegiatan_id');
    }
}
