import 'package:isar_community/isar.dart';
import 'package:makanapa/features/recipe/data/data_source/recipe_data_source.dart';
import 'package:makanapa/features/recipe/data/models/entity/recipe_detail_isar_model.dart';
import 'package:makanapa/features/recipe/data/models/entity/recipe_index_isar_model.dart';
import 'package:makanapa/features/recipe/data/models/entity/recipe_isar_model.dart';
import 'package:makanapa/features/recipe/domain/models/recipe_detail.dart';
import 'package:makanapa/features/recipe/domain/models/recipe_item.dart';
import 'package:makanapa/features/recipe/domain/models/recipe_page.dart';

class RecipeLocalDs implements RecipeLocalDataSource {
  final Isar isar;

  RecipeLocalDs({required this.isar});

  @override
  Stream<List<RecipeIndexEntity>> getCachedRecipes(
    String? filterHash,
    int pageIndex,
  ) {
    final pages = pageIndex;

    return isar.recipeIndexEntitys
        .filter()
        .filterKeyEqualTo(filterHash ?? "")
        .pageIndexLessThan(pages, include: true)
        .sortByPageIndex()
        .watch(fireImmediately: true);
  }

  @override
  Future<void> cacheRecipeList(
    String? filterHash,
    int pageIndex,
    RecipePage page,
  ) async {
    final filterKeys = filterHash ?? "";

    // update recipe table
    final recipeData = page.data;
    await _saveReceiptData(recipeData);

    // update index table
    await isar.writeTxn(() async {
      final insertData = RecipeIndexEntity.fromPage(
        filterKeys,
        page,
        pageIndex,
      );

      final existingData = await isar.recipeIndexEntitys
          .filter()
          .filterKeyEqualTo(filterKeys)
          .and()
          .pageIndexEqualTo(insertData.pageIndex)
          .findFirst();

      if (existingData != null) {
        insertData.id = existingData.id;
      }
      await isar.recipeIndexEntitys.put(insertData);
    });
  }

  Future<void> _saveReceiptData(List<RecipeItem> data) async {
    final recipeEntity = data.map((recipe) {
      return RecipeEntity.fromEntity(recipe);
    }).toList();

    isar.writeTxn(() async {
      await isar.recipeEntitys.putAllByDataId(recipeEntity);
    });
  }

  @override
  Stream<RecipeDetailEntity?> getCachedRecipeDetail(int recipeId) {
    return isar.recipeDetailEntitys
        .filter()
        .recipeIdEqualTo(recipeId)
        .watch(fireImmediately: true)
        .map((data) => data.isNotEmpty ? data.first : null);
  }

  @override
  Future<void> cacheRecipeDetail(int recipeId, RecipeDetail detail) async {
    await isar.writeTxn(() async {
      final insertData = RecipeDetailEntity.fromEntity(recipeId, detail);

      final existingData = await isar.recipeDetailEntitys
          .filter()
          .recipeIdEqualTo(insertData.recipeId)
          .findFirst();

      if (existingData != null) {
        insertData.id = existingData.id;
      }

      await isar.recipeDetailEntitys.put(insertData);
    });
  }

  @override
  Future<List<RecipeEntity>> getCachedSearchResults(String query) async {
    if (query.isEmpty) {
      return await isar.recipeEntitys
          .where()
          .sortByDataId()
          .limit(10)
          .findAll();
    }

    final searchData = await isar.recipeEntitys
        .filter()
        .nameContains(query)
        .or()
        .enNameContains(query)
        .sortByName()
        .limit(10)
        .findAll();
    return searchData;
  }

  @override
  Future<List<RecipeEntity>> getReceiptByReceiptId(List<int> recipeIds) async {
    final recipeEntities = await isar.recipeEntitys.getAllByDataId(recipeIds);
    return recipeEntities.whereType<RecipeEntity>().toList();
  }

  @override
  Future<RecipeIndexEntity?> getRecipeIndexEntity(
    String? filterHash,
    int targetPage,
  ) async {
    final prevPage = targetPage;
    final indexData = await isar.recipeIndexEntitys
        .filter()
        .filterKeyEqualTo(filterHash ?? "")
        .pageIndexEqualTo(prevPage)
        .findFirst();
    return indexData;
  }

  @override
  Future<void> cacheRecipeItemList(List<RecipeItem> data) async {
    await _saveReceiptData(data);
  }
}
