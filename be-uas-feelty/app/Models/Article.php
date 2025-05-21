<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Casts\Attribute as CastsAttribute;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Article extends Model
{
    /** @use HasFactory<\Database\Factories\ArticleFactory> */
    use HasFactory;

    protected $fillable = [
        'title',
        'content',
        'image',
    ];

    protected function image(): CastsAttribute
    {
        return CastsAttribute::make(
            get: fn($image) => url('/storage/posts/' . $image),
        );
    }
}
