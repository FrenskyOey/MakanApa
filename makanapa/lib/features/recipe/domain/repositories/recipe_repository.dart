import 'package:dartz/dartz.dart';
import 'package:makanapa/features/recipe/domain/models/recipe_detail.dart';
import 'package:makanapa/features/recipe/domain/models/recipe_item.dart';
import 'package:makanapa/features/recipe/domain/models/recipe_page.dart';

abstract class RecipeRepository {
  Future<Either<String, RecipePage>> getReceiptPage({
    required int pageIndex,
    String? filter,
  });
  Stream<List<RecipeItem>> getReceiptStream({
    required int pageIndex,
    String? filter,
  });

  Future<RecipePage?> getLocalReceiptPage({
    required int pageIndex,
    String? filter,
  });

  Future<Either<String, void>> getRecipeDetail({required int recipeId});
  Stream<RecipeDetail?> getRecipeDetailStream({required int recipeId});

  Stream<List<RecipeItem>> getSearchStream();
  Future<Either<String, List<RecipeItem>>> searchRecipes({
    required String query,
  });

  Future<Either<String, void>> bookmarkRecipe({required int recipeId});
}
