import 'package:dartz/dartz.dart';
import 'package:makanapa/features/recipe/domain/models/recipe_detail.dart';
import 'package:makanapa/features/recipe/domain/models/recipe_item.dart';
import 'package:makanapa/features/recipe/domain/models/recipe_page.dart';

abstract class RecipeRepository {
  Future<Either<String, RecipePage>> getReceiptPage({
    int cursor = 0,
    String? filter,
  });
  Future<Either<String, RecipeDetail>> getRecipeDetail({required int recipeId});
  Future<Either<String, List<RecipeItem>>> searchRecipes({
    required String query,
  });
  Future<Either<String, Unit>> bookmarkRecipe({required int recipeId});
}
