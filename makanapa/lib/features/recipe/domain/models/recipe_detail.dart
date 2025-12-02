import 'package:makanapa/features/recipe/domain/models/ingredients.dart';
import 'package:makanapa/features/recipe/domain/models/recipe_item.dart';

class RecipeDetail {
  final List<Ingredients> ingredients;
  final RecipeItem recipe;

  const RecipeDetail({required this.ingredients, required this.recipe});
}
