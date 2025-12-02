import 'package:dartz/dartz.dart';
import 'package:makanapa/features/recipe/domain/models/recipe_detail.dart';
import 'package:makanapa/features/recipe/domain/models/recipe_item.dart';
import 'package:makanapa/features/recipe/domain/models/recipe_page.dart';

abstract class RecipeRepository {
  Future<Either<String, void>> getReceiptPage({int? cursorId, String? filter});
  Stream<List<RecipePage>> getReceiptStream({int? cursorId, String? filter});

  Future<Either<String, void>> getRecipeDetail({required int recipeId});
  Stream<RecipeDetail> getRecipeDetailStream({required int recipeId});

  Stream<List<RecipeItem>> searchRecipes({required String query});

  Future<Either<String, Unit>> bookmarkRecipe({required int recipeId});
}
