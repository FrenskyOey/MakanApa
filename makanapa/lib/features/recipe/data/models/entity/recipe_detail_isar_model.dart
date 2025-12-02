import 'package:isar_community/isar.dart';
import 'package:makanapa/features/recipe/data/models/entity/embed_ingredients_model.dart';
import 'package:makanapa/features/recipe/data/models/entity/embed_recipe_model.dart';
import 'package:makanapa/features/recipe/domain/models/ingredients.dart';
import 'package:makanapa/features/recipe/domain/models/recipe_detail.dart';
import 'package:makanapa/features/recipe/domain/models/recipe_item.dart';

part 'recipe_detail_isar_model.g.dart';

@collection
class RecipeDetailEntity {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  late int recipeId;

  late List<IngredientsEmbedModel> ingredients; // embedded list
  late RecipeEmbedModel recipe; // embedded object

  RecipeDetailEntity();

  factory RecipeDetailEntity.fromEntity(int recipeId, RecipeDetail detail) {
    RecipeItem recipe = detail.recipe;
    return RecipeDetailEntity()
      ..recipeId = recipeId
      ..ingredients = detail.ingredients
          .map((item) => IngredientsEmbedModel.fromEntity(item))
          .toList()
      ..recipe = RecipeEmbedModel.fromEntity(recipe);
  }

  RecipeDetail toDomain() {
    List<Ingredients> ingredientz = ingredients
        .map((item) => item.toDomain())
        .toList();
    RecipeItem recipez = recipe.toDomain();

    return RecipeDetail(ingredients: ingredientz, recipe: recipez);
  }
}
