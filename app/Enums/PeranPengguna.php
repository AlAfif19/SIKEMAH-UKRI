<?php

namespace App\Enums;

enum PeranPengguna: string
{
    case Admin = 'admin';
    case Mahasiswa = 'mahasiswa';

    public function label(): string
    {
        return match ($this) {
            self::Admin => 'Admin',
            self::Mahasiswa => 'Mahasiswa',
        };
    }
}
