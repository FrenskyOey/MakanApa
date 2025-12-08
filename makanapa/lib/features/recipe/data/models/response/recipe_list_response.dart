import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:makanapa/features/recipe/data/models/response/recipe_response.dart';
import 'package:makanapa/features/recipe/domain/models/recipe_page.dart';

part 'recipe_list_response.freezed.dart';
part 'recipe_list_response.g.dart';

@freezed
abstract class RecipeListResponse with _$RecipeListResponse {
  const RecipeListResponse._();

  const factory RecipeListResponse({
    @JsonKey(name: 'resep_list', defaultValue: List.empty)
    required List<RecipeResponse> items,
    @JsonKey(name: 'next_cursor', defaultValue: 0) required int nextCursors,
    @JsonKey(name: 'limit', defaultValue: 25) required int limits,
    @JsonKey(name: 'next_data_counter', defaultValue: 0)
    required int dataCounters,
  }) = _RecipeListResponse;

  RecipePage toDomain() {
    return RecipePage(
      data: items.map((e) => e.toDomain()).toList(),
      nextCursor: nextCursors,
      limit: limits,
      dataCounter: dataCounters,
    );
  }

  factory RecipeListResponse.fromJson(Map<String, dynamic> json) =>
      _$RecipeListResponseFromJson(json);
}
