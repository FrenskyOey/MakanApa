import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:makanapa/features/recipe/domain/models/ingredient_enum.dart';

part 'ingredients.freezed.dart';

@freezed
abstract class Ingredients with _$Ingredients {
  const factory Ingredients({
    @Default(0) int id,
    @Default("") String name,
    @Default(IngredientEnum.other) IngredientEnum type,
    @Default("") String unit,
    @Default(0) int qty,
  }) = _Ingredients;
}
