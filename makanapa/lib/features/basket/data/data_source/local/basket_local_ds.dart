import 'package:isar_community/isar.dart';
import 'package:makanapa/features/basket/data/data_source/basket_data_source.dart';
import 'package:makanapa/features/basket/data/models/entity/basket_group_isar_model.dart';
import 'package:makanapa/features/basket/data/models/entity/basket_item_isar_model.dart';
import 'package:makanapa/features/basket/data/models/response/basket_dashboard_response.dart';
import 'package:makanapa/features/basket/data/models/response/basket_summary_response.dart';
import 'package:makanapa/features/recipe/domain/models/ingredient_enum.dart';

class BasketLocalDs implements BasketLocalDataSource {
  final Isar isar;

  BasketLocalDs({required this.isar});

  @override
  Future<void> cacheIngredientGroupData(BasketSummaryResponse response) async {
    await isar.writeTxn(() async {
      final ingredientData = response;

      final existingItems = await isar.basketItemEntitys
          .filter()
          .groupIdEqualTo(ingredientData.groupId)
          .findAll();

      final existingMap = {
        for (var item in existingItems) item.ingredientId: item,
      };

      final itemsToSave = <BasketItemEntity>[];

      void addItems(List<dynamic> source, String type) {
        for (final item in source) {
          final existing = existingMap[item.id];
          final entity = existing ?? BasketItemEntity();

          entity
            ..groupId = ingredientData.groupId
            ..ingredientId = item.id
            ..name = item.name
            ..quantity = (item.quantity as num).toInt()
            ..unit = item.unit
            ..type = type;

          if (existing == null) {
            entity.isMarked = false;
          }

          itemsToSave.add(entity);
        }
      }

      addItems(
        ingredientData.ingredients.vegetables,
        IngredientEnum.vegetable.description,
      );
      addItems(
        ingredientData.ingredients.meats,
        IngredientEnum.meat.description,
      );
      addItems(
        ingredientData.ingredients.others,
        IngredientEnum.other.description,
      );

      await isar.basketItemEntitys.putAll(itemsToSave);
    });
  }

  @override
  Future<void> cacheIngredientMainData(BasketDashboardResponse response) async {
    final groupEntity = BasketGroupEntity.fromEntity(response);

    await isar.writeTxn(() async {
      await isar.basketGroupEntitys.put(groupEntity);

      final currentWeek = response.currentWeekIngredients;
      if (currentWeek != null) {
        final existingItems = await isar.basketItemEntitys
            .filter()
            .groupIdEqualTo(currentWeek.groupId)
            .findAll();

        final existingMap = {
          for (var item in existingItems) item.ingredientId: item,
        };

        final itemsToSave = <BasketItemEntity>[];

        void addItems(List<dynamic> source, String type) {
          for (final item in source) {
            final existing = existingMap[item.id];
            final entity = existing ?? BasketItemEntity();

            entity
              ..groupId = currentWeek.groupId
              ..ingredientId = item.id
              ..name = item.name
              ..quantity = (item.quantity as num).toInt()
              ..unit = item.unit
              ..type = type;

            if (existing == null) {
              entity.isMarked = false;
            }

            itemsToSave.add(entity);
          }
        }

        addItems(
          currentWeek.ingredients.vegetables,
          IngredientEnum.vegetable.description,
        );
        addItems(
          currentWeek.ingredients.meats,
          IngredientEnum.meat.description,
        );
        addItems(
          currentWeek.ingredients.others,
          IngredientEnum.other.description,
        );

        await isar.basketItemEntitys.putAll(itemsToSave);
      }
    });
  }

  @override
  Stream<List<BasketItemEntity>> getBasketStream({
    required int groupId,
    IngredientEnum type = IngredientEnum.vegetable,
  }) {
    return isar.basketItemEntitys
        .filter()
        .groupIdEqualTo(groupId)
        .typeEqualTo(type.description)
        .sortByName()
        .watch(fireImmediately: true);
  }

  @override
  Stream<BasketGroupEntity?> getIngredientsDashboard() {
    return isar.basketGroupEntitys.watchObject(1, fireImmediately: true);
  }

  @override
  Future<void> markIngredients(
    int groupId,
    int ingredientId,
    bool isMarked,
  ) async {
    await isar.writeTxn(() async {
      final existingItems = await isar.basketItemEntitys
          .filter()
          .groupIdEqualTo(groupId)
          .ingredientIdEqualTo(ingredientId)
          .findFirst();

      if (existingItems == null) {
        return;
      }
      existingItems.isMarked = isMarked;
      await isar.basketItemEntitys.put(existingItems);
    });
  }
}
