<?php

namespace App\Repositories;

use App\Interfaces\ArticleRepositoryInterface;
use App\Models\Article;

class ArticleRepository implements ArticleRepositoryInterface
{
    public function index()
    {
        return Article::latest()->paginate(5);
    }

    public function getById($id)
    {
        return Article::findOrFail($id);
    }

    public function store(array $data)
    {
        return Article::create($data);
    }

    public function update(array $data, $id)
    {
        return Article::whereId($id)->update($data);
    }

    public function delete($id)
    {
        Article::destroy($id);
    }
}
