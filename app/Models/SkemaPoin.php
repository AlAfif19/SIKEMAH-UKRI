<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class SkemaPoin extends Model
{
    use HasFactory;

    protected $table = 'skema_poin';

    protected $fillable = [
        'jenis_id',
        'tingkat',
        'peran',
        'poin',
    ];

    protected function casts(): array
    {
        return [
            'poin' => 'decimal:2',
        ];
    }

    public function jenis(): BelongsTo
    {
        return $this->belongsTo(Jenis::class, 'jenis_id');
    }

    public function label(): string
    {
        return implode(' — ', array_filter([$this->tingkat, $this->peran]));
    }
}
