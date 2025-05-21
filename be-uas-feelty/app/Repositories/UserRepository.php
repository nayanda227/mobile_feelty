<?php

namespace App\Repositories;

use App\Interfaces\UserRepositoryInterface;
use App\Models\User;

class UserRepository implements UserRepositoryInterface
{
    public function index()
    {
        return User::latest()->paginate(5);
    }

    public function getById($id)
    {
        return User::findOrFail($id);
    }

    public function store(array $data)
    {
        return User::create($data);
    }

    public function update(array $data, $id)
    {
        return User::whereId($id)->update($data);
    }

    public function delete($id)
    {
        User::destroy($id);
    }
}
