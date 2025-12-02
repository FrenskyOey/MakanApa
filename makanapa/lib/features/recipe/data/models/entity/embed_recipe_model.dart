import 'package:isar_community/isar.dart';
import 'package:makanapa/features/recipe/domain/models/class_enum.dart';
import 'package:makanapa/features/recipe/domain/models/dish_enum.dart';
import 'package:makanapa/features/recipe/domain/models/recipe_item.dart';

part 'embed_recipe_model.g.dart';

@embedded
class RecipeEmbedModel {
  late int dataId;
  late String name;
  late String enName;
  late String picture;
  late String dishType;
  late String classType;
  late String urlLink;

  RecipeEmbedModel();

  factory RecipeEmbedModel.fromEntity(RecipeItem item) {
    return RecipeEmbedModel()
      ..dataId = item.id
      ..name = item.name
      ..enName = item.enName
      ..picture = item.picture
      ..dishType = item.dishType.name
      ..classType = item.classType.name
      ..urlLink = item.urlLinks;
  }

  /// Converts the [RecipeEmbedModel] to a [RecipeItem] domain model.
  RecipeItem toDomain() {
    return RecipeItem(
      id: dataId,
      name: name,
      enName: enName,
      picture: picture,
      dishType: DishEnum.values.byName(dishType),
      classType: ClassEnum.values.byName(classType),
      urlLinks: urlLink,
    );
  }
}
