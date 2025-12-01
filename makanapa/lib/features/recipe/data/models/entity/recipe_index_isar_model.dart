import 'package:isar_community/isar.dart';
import 'package:makanapa/features/recipe/domain/models/recipe_page.dart';
import 'package:makanapa/features/recipe/data/models/entity/recipe_isar_model.dart';

part 'recipe_index_isar_model.g.dart';

@collection
class RecipeIndexEntity {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  late String filterKey;
  late int? cursorId;
  late int? nextCursor;
  late int? dataCounter;
  late List<int> recipeIds;
  late DateTime timestamp;

  RecipeIndexEntity();

  factory RecipeIndexEntity.fromPage(
    String filterKey,
    RecipePage page,
    int? cursor,
  ) {
    return RecipeIndexEntity()
      ..filterKey = filterKey
      ..cursorId = cursor
      ..nextCursor = page.nextCursor
      ..recipeIds = page.data.map((item) => item.id).toList()
      ..dataCounter = page.dataCounter
      ..timestamp = DateTime.now();
  }

  Future<RecipePage> toDomain(Isar isar, int limit) async {
    final recipeEntities = await isar.recipeEntitys.getAllByDataId(recipeIds);

    final recipes = recipeEntities
        .whereType<RecipeEntity>()
        .map((entity) => entity.toDomain())
        .toList();

    return RecipePage(
      data: recipes,
      nextCursor: nextCursor ?? 0,
      limit: limit,
      dataCounter: dataCounter ?? 0,
    );
  }
}
