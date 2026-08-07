<?php

namespace App\Http\Requests\Admin;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rule;

class StoreSkemaPoinRequest extends FormRequest
{
    public function authorize(): bool
    {
        return auth()->check() && auth()->user()->isAdmin();
    }

    public function rules(): array
    {
        return [
            'tingkat' => ['nullable', 'string', 'max:100'],
            'peran' => ['nullable', 'string', 'max:100'],
            'poin' => ['required', 'numeric', 'min:0', 'max:9999.99'],
        ];
    }

    public function messages(): array
    {
        return [
            'poin.required' => 'Poin wajib diisi.',
            'poin.min' => 'Poin minimal 0.',
        ];
    }

    public function withValidator($validator): void
    {
        $validator->after(function ($validator) {
            // Minimal salah satu dari Tingkat/Peran harus diisi, supaya tiap baris
            // skema poin bisa dibedakan satu sama lain.
            if (! $this->filled('tingkat') && ! $this->filled('peran')) {
                $validator->errors()->add('tingkat', 'Isi minimal salah satu: Tingkat atau Peran.');
            }

            $jenis = $this->route('jenis');

            if ($jenis) {
                $sudahAda = $jenis->skemaPoin()
                    ->where('tingkat', $this->input('tingkat'))
                    ->where('peran', $this->input('peran'))
                    ->exists();

                if ($sudahAda) {
                    $validator->errors()->add('tingkat', 'Kombinasi Tingkat & Peran ini sudah ada pada jenis ini.');
                }
            }
        });
    }
}
