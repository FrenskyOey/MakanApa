import 'package:isar_community/isar.dart';
import 'package:makanapa/features/recipe/domain/models/ingredient_enum.dart';
import 'package:makanapa/features/recipe/domain/models/ingredients.dart';

part 'embed_ingredients_model.g.dart';

@embedded
class IngredientsEmbedModel {
  late int dataId;
  late String name;
  late String type;
  late String unit;
  late int qty;

  IngredientsEmbedModel();

  factory IngredientsEmbedModel.fromEntity(Ingredients item) {
    return IngredientsEmbedModel()
      ..dataId = item.id
      ..name = item.name
      ..type = item.type.name
      ..unit = item.unit
      ..qty = item.qty;
  }

  /// Converts the [IngredientEmbedModel] to a [Ingredient] domain model.
  Ingredients toDomain() {
    return Ingredients(
      id: dataId,
      name: name,
      type: IngredientEnum.values.byName(type),
      unit: unit,
      qty: qty,
    );
  }
}
