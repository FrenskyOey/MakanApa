import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:makanapa/features/recipe/domain/models/ingredient_enum.dart';
import 'package:makanapa/features/recipe/domain/models/ingredients.dart';

part 'ingredients_response.freezed.dart';
part 'ingredients_response.g.dart';

@freezed
abstract class IngredientsResponse with _$IngredientsResponse {
  const IngredientsResponse._();

  const factory IngredientsResponse({
    @JsonKey(name: 'id', defaultValue: 0) required int id,
    @JsonKey(name: 'name', defaultValue: '') required String name,
    @JsonKey(name: 'bahantype', defaultValue: '') required String types,
    @JsonKey(name: 'unittype', defaultValue: '') required String unitType,
    @JsonKey(name: 'qty', defaultValue: 0) required int quantity,
  }) = _IngredientsResponse;

  Ingredients toDomain() {
    return Ingredients(
      id: id,
      name: name,
      type: IngredientEnum.fromDescription(types),
      unit: unitType,
      qty: quantity,
    );
  }

  factory IngredientsResponse.fromJson(Map<String, dynamic> json) =>
      _$IngredientsResponseFromJson(json);
}
