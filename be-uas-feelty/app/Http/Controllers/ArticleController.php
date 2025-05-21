<?php

namespace App\Http\Controllers;

use App\Classes\ApiResponseClass;
use App\Http\Requests\Article\StoreArticleRequest;
use App\Http\Requests\Article\UpdateArticleRequest;
use App\Http\Resources\ArticleResource;
use App\Interfaces\ArticleRepositoryInterface;
use App\Models\Article;
use Exception;
use Illuminate\Support\Facades\DB;

class ArticleController extends Controller
{
    private ArticleRepositoryInterface $articleRepositoryInterface;

    public function __construct(ArticleRepositoryInterface $articleRepositoryInterface)
    {
        $this->articleRepositoryInterface = $articleRepositoryInterface;
    }

    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $articles = $this->articleRepositoryInterface->index();

        return ApiResponseClass::sendResponse(ArticleResource::collection($articles), 'Article get successfully', 200);
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
    public function store(StoreArticleRequest $request)
    {
        $data = [
            'title' => $request->title,
            'content' => $request->content
        ];

        DB::beginTransaction();

        try {
            $article = $this->articleRepositoryInterface->store($data);

            DB::commit();
            return ApiResponseClass::sendResponse(new ArticleResource($article), 'Article created successfully', 201);
        } catch (Exception $e) {
            return ApiResponseClass::rollback($e);
        }
    }

    /**
     * Display the specified resource.
     */
    public function show($id)
    {
        $article = $this->articleRepositoryInterface->getById($id);

        if (!$article) {
            return ApiResponseClass::sendResponse([], 'Article not found', 404);
        }

        return ApiResponseClass::sendResponse(new ArticleResource($article), '', 200);
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Article $article)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(UpdateArticleRequest $request, $id)
    {
        $data = [
            'title' => $request->title,
            'content' => $request->content
        ];

        DB::beginTransaction();

        try {
            $article = $this->articleRepositoryInterface->update($data, $id);

            DB::commit();
            return ApiResponseClass::sendResponse(new ArticleResource($article), 'Article updated successfully', 200);
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
            $this->articleRepositoryInterface->delete($id);

            DB::commit();
            return ApiResponseClass::sendResponse([], 'Article deleted successfully', 204);
        } catch (Exception $e) {
            return ApiResponseClass::rollback($e);
        }
    }
}
