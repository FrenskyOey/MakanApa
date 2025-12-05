import 'package:makanapa/features/recipe/data/models/entity/recipe_detail_isar_model.dart';
import 'package:makanapa/features/recipe/data/models/entity/recipe_index_isar_model.dart';
import 'package:makanapa/features/recipe/data/models/entity/recipe_isar_model.dart';
import 'package:makanapa/features/recipe/data/models/response/recipe_detail_response.dart';
import 'package:makanapa/features/recipe/data/models/response/recipe_list_response.dart';
import 'package:makanapa/features/recipe/data/models/response/recipe_response.dart';
import 'package:makanapa/features/recipe/domain/models/recipe_detail.dart';
import 'package:makanapa/features/recipe/domain/models/recipe_item.dart';
import 'package:makanapa/features/recipe/domain/models/recipe_page.dart';

abstract class RecipeRemoteDataSource {
  Future<RecipeListResponse> getRecipeData(String? filterHash, int? cursorId);
  Future<RecipeDetailResponse> fetchRecipeDetail(int resepIds);
  Future<List<RecipeResponse>> searchRecipes(String? query);
  Future<String> bookMarkRecipe(int recipeId);
}

abstract class RecipeLocalDataSource {
  Stream<List<RecipeIndexEntity>> getCachedRecipes(
    String? filterHash,
    int pageIndex,
  );
  Future<void> cacheRecipeList(
    String? filterHash,
    int pageIndex,
    RecipePage page,
  );
  Future<void> cacheRecipeItemList(List<RecipeItem> data);
  Stream<RecipeDetailEntity?> getCachedRecipeDetail(int recipeId);
  Future<RecipeDetailEntity?> getReceiptDetail(int recipeId);
  Future<void> cacheRecipeDetail(int recipeId, RecipeDetail detail);
  Future<List<RecipeEntity>> getCachedSearchResults(String query);
  Future<List<RecipeEntity>> getReceiptByReceiptId(List<int> recipeIds);
  Future<RecipeIndexEntity?> getRecipeIndexEntity(
    String? filterHash,
    int targetPage,
  );
}
