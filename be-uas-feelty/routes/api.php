<?php

use App\Classes\ApiResponseClass;
use App\Http\Controllers\ArticleController;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\OAuthController;
use App\Http\Controllers\UserController;
use App\Http\Resources\UserResource;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

Route::get('/auth/google', [OAuthController::class, 'redirectToProvider'])->name('google.login');
Route::get('/auth/google/callback', [OAuthController::class, 'handleProviderCallback'])->name('google.callback');

Route::post('/register', [AuthController::class, 'register']);
Route::post('/login', [AuthController::class, 'login']);
Route::post('/logout', [AuthController::class, 'logout'])->middleware('auth:sanctum');

Route::middleware('auth:sanctum')->group(function () {
    Route::apiResource('/users', UserController::class);
    Route::get('/current-user', function (Request $request) {
        return ApiResponseClass::sendResponse(new UserResource($request->user()), 'Current login user get successfully', 200);
    });

    Route::apiResource('/articles', ArticleController::class);
});
