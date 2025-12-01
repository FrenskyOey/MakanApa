import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:makanapa/features/recipe/data/models/response/ingredients_response.dart';
import 'package:makanapa/features/recipe/data/models/response/recipe_response.dart';
import 'package:makanapa/features/recipe/domain/models/recipe_detail.dart';

part 'recipe_detail_response.freezed.dart';
part 'recipe_detail_response.g.dart';

@freezed
abstract class RecipeDetailResponse with _$RecipeDetailResponse {
  const RecipeDetailResponse._();

  const factory RecipeDetailResponse({
    @JsonKey(name: 'resep') required RecipeResponse recipe,
    @JsonKey(name: 'bahan', defaultValue: List.empty)
    required List<IngredientsResponse> ingredients,
  }) = _RecipeDetailResponse;

  RecipeDetail toDomain() {
    return RecipeDetail(
      ingredients: ingredients.map((e) => e.toDomain()).toList(),
      recipe: recipe.toDomain(),
    );
  }

  factory RecipeDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$RecipeDetailResponseFromJson(json);
}
