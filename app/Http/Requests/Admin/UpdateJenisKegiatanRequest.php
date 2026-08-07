<?php

namespace App\Http\Requests\Admin;

use Illuminate\Foundation\Http\FormRequest;

class UpdateJenisKegiatanRequest extends FormRequest
{
    public function authorize(): bool
    {
        return auth()->check() && auth()->user()->isAdmin();
    }

    public function rules(): array
    {
        return [
            'kategori_id' => ['required', 'exists:kategori,id'],
            'nama' => ['required', 'string', 'max:255'],
            'dokumen' => ['nullable', 'string', 'max:255'],
            'periode_penilaian' => ['nullable', 'string', 'max:255'],
            'penilai' => ['nullable', 'string', 'max:255'],
        ];
    }

    public function messages(): array
    {
        return [
            'kategori_id.required' => 'Kategori wajib dipilih.',
            'nama.required' => 'Nama jenis kegiatan wajib diisi.',
        ];
    }
}
