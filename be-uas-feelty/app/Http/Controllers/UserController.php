<?php

namespace App\Http\Controllers;

use App\Classes\ApiResponseClass;
use App\Http\Requests\User\StoreUserRequest;
use App\Http\Requests\User\UpdateUserRequest;
use App\Http\Resources\UserResource;
use App\Interfaces\UserRepositoryInterface;
use App\Models\User;
use Exception;
use Illuminate\Support\Facades\DB;

class UserController extends Controller
{
    private UserRepositoryInterface $userRepositoryInterface;

    public function __construct(UserRepositoryInterface $userRepositoryInterface)
    {
        $this->userRepositoryInterface = $userRepositoryInterface;
    }

    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $data = $this->userRepositoryInterface->index();

        return ApiResponseClass::sendResponse(UserResource::collection($data), 'User get successfully', 200);
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(StoreUserRequest $request)
    {
        $photo = $request->file('photo');

        $data = [
            'name' => $request->name,
            'email' => $request->email,
            'password' => bcrypt($request->password),
            'phone_number' => $request->phone_number,
            'address' => $request->address,
            'gender' => $request->gender,
            'date_of_birth' => $request->date_of_birth,
            'photo' => $photo->hashName(),
        ];

        DB::beginTransaction();

        try {
            $photo->store('public/users');
            $user = $this->userRepositoryInterface->store($data);

            DB::commit();
            return ApiResponseClass::sendResponse(new UserResource($user), 'User created successfully', 201);
        } catch (Exception $e) {
            return ApiResponseClass::rollback($e);
        }
    }

    /**
     * Display the specified resource.
     */
    public function show($id)
    {
        $data = $this->userRepositoryInterface->getById($id);

        if (!$data) {
            return ApiResponseClass::sendResponse([], 'User not found', 404);
        }

        return ApiResponseClass::sendResponse(new UserResource($data), 'User get by ID successfully', 200);
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(User $user)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(UpdateUserRequest $request, $id)
    {
        $photo = $request->file('photo');

        $data = [
            'name' => $request->name,
            'email' => $request->email,
            'password' => bcrypt($request->password),
            'phone_number' => $request->phone_number,
            'address' => $request->address,
            'gender' => $request->gender,
            'date_of_birth' => $request->date_of_birth,
            'photo' => $photo->hashName(),
        ];

        DB::beginTransaction();

        try {
            $photo->store('public/users');
            $updatedUser = $this->userRepositoryInterface->update($data, $id);

            DB::commit();
            return ApiResponseClass::sendResponse(new UserResource($updatedUser), 'User updated successfully', 200);
        } catch (Exception $e) {
            return ApiResponseClass::rollback($e);
        }
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy($id)
    {
        DB::beginTransaction();

        try {
            $this->userRepositoryInterface->delete($id);

            DB::commit();
            return ApiResponseClass::sendResponse([], 'User deleted successfully', 200);
        } catch (Exception $e) {
            return ApiResponseClass::rollback($e);
        }
    }
}
