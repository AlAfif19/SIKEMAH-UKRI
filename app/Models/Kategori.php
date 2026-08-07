<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Kategori extends Model
{
    use HasFactory;

    protected $table = 'kategori';

    protected $fillable = [
        'nama',
        'poin_maksimum',
    ];

    protected function casts(): array
    {
        return [
            'poin_maksimum' => 'decimal:2',
        ];
    }

    public function jenisKegiatan(): HasMany
    {
        return $this->hasMany(JenisKegiatan::class, 'kategori_id');
    }
}
