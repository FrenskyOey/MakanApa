// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_detail_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RecipeDetailResponse _$RecipeDetailResponseFromJson(
  Map<String, dynamic> json,
) => _RecipeDetailResponse(
  recipe: RecipeResponse.fromJson(json['resep'] as Map<String, dynamic>),
  ingredients:
      (json['bahan'] as List<dynamic>?)
          ?.map((e) => IngredientsResponse.fromJson(e as Map<String, dynamic>))
          .toList() ??
      List.empty(),
);

Map<String, dynamic> _$RecipeDetailResponseToJson(
  _RecipeDetailResponse instance,
) => <String, dynamic>{'resep': instance.recipe, 'bahan': instance.ingredients};
