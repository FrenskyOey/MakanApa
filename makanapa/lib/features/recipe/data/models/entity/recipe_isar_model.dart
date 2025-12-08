import 'package:isar_community/isar.dart';
import 'package:makanapa/features/recipe/domain/models/class_enum.dart';
import 'package:makanapa/features/recipe/domain/models/recipe_item.dart';
import 'package:makanapa/features/recipe/domain/models/dish_enum.dart';

part 'recipe_isar_model.g.dart';

@collection
class RecipeEntity {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  late int dataId;

  late String name;
  late String enName;
  late String picture;
  late String dishType;
  late String classType;

  /// Creates an empty [RecipeEntity] for Isar.
  RecipeEntity();

  factory RecipeEntity.fromEntity(RecipeItem item) {
    return RecipeEntity()
      ..dataId = item.id
      ..name = item.name
      ..enName = item.enName
      ..picture = item.picture
      ..dishType = item.dishType.name
      ..classType = item.classType.name;
  }

  /// Converts the [RecipeEntity] to a [RecipeItem] domain model.
  RecipeItem toDomain() {
    return RecipeItem(
      id: dataId,
      name: name,
      enName: enName,
      picture: picture,
      dishType: DishEnum.values.byName(dishType),
      classType: ClassEnum.values.byName(classType),
    );
  }
}
