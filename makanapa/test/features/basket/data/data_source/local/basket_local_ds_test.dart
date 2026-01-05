import 'package:flutter_test/flutter_test.dart';
import 'package:makanapa/features/basket/data/data_source/local/basket_local_ds.dart';
import 'package:makanapa/features/basket/data/models/entity/basket_group_isar_model.dart';
import 'package:makanapa/features/basket/data/models/entity/basket_item_isar_model.dart';
import 'package:makanapa/features/basket/data/models/response/basket_ingredients_response.dart';
import 'package:makanapa/features/basket/data/models/response/basket_item_response.dart';
import 'package:makanapa/features/basket/data/models/entity/basket_upcoming_embed.dart';
import 'package:makanapa/features/basket/data/models/response/basket_dashboard_response.dart';
import 'package:makanapa/features/basket/data/models/response/basket_upcoming_plan_response.dart';
import 'package:makanapa/features/basket/data/models/response/basket_summary_response.dart';
import 'package:makanapa/features/recipe/domain/models/ingredient_enum.dart';
import 'package:isar_community/isar.dart';

void main() {
  late Isar isar;
  late BasketLocalDs basketLocalDs;

  setUpAll(() async {
    // Only happens once for the whole file
    await Isar.initializeIsarCore(download: true);
  });

  setUp(() async {
    // Create an in-memory Isar instance with all schemas
    isar = await Isar.open(
      [BasketItemEntitySchema, BasketGroupEntitySchema],
      directory: '', // Empty string for in-memory
      name: 'test_${DateTime.now().millisecondsSinceEpoch}',
    );

    basketLocalDs = BasketLocalDs(isar: isar);
  });

  tearDown(() async {
    await isar.close(deleteFromDisk: true);
  });

  group('cacheIngredientGroupData', () {
    test('should save new items with all fields correctly', () async {
      // Arrange
      final response = BasketSummaryResponse(
        groupId: 123,
        startDate: '01-01-2024',
        ingredients: BasketIngredientsResponse(
          vegetables: [
            BasketItemResponse(id: 1, name: 'Tomato', quantity: 2, unit: 'pcs'),
            BasketItemResponse(id: 2, name: 'Onion', quantity: 3, unit: 'kg'),
          ],
          meats: [
            BasketItemResponse(
              id: 10,
              name: 'Chicken Breast',
              quantity: 500,
              unit: 'g',
            ),
          ],
          others: [
            BasketItemResponse(id: 20, name: 'Salt', quantity: 1, unit: 'tbsp'),
          ],
        ),
      );

      // Act
      await basketLocalDs.cacheIngredientGroupData(response);

      // Assert
      final savedItems = await isar.basketItemEntitys
          .filter()
          .groupIdEqualTo(123)
          .findAll();

      expect(savedItems.length, 4);

      // Verify vegetable items
      final vegetables = savedItems
          .where((item) => item.type == IngredientEnum.vegetable.description)
          .toList();
      expect(vegetables.length, 2);

      final tomato = vegetables.firstWhere((item) => item.ingredientId == 1);
      expect(tomato.groupId, 123);
      expect(tomato.ingredientId, 1);
      expect(tomato.name, 'Tomato');
      expect(tomato.quantity, 2);
      expect(tomato.unit, 'pcs');
      expect(tomato.type, IngredientEnum.vegetable.description);
      expect(tomato.isMarked, false);
      expect(tomato.id, isNot(Isar.autoIncrement)); // Should have auto ID

      // Verify meat items
      final meats = savedItems
          .where((item) => item.type == IngredientEnum.meat.description)
          .toList();
      expect(meats.length, 1);
      expect(meats.first.name, 'Chicken Breast');
      expect(meats.first.quantity, 500);

      // Verify other items
      final others = savedItems
          .where((item) => item.type == IngredientEnum.other.description)
          .toList();
      expect(others.length, 1);
      expect(others.first.name, 'Salt');
    });

    test(
      'should update existing items while preserving isMarked status',
      () async {
        // Arrange - Create initial items with different isMarked states
        await isar.writeTxn(() async {
          await isar.basketItemEntitys.putAll([
            BasketItemEntity()
              ..groupId = 123
              ..ingredientId = 1
              ..name = 'Tomato Old'
              ..quantity = 1
              ..unit = 'pcs'
              ..type = IngredientEnum.vegetable.description
              ..isMarked = true, // User has marked this
            BasketItemEntity()
              ..groupId = 123
              ..ingredientId = 2
              ..name = 'Onion Old'
              ..quantity = 2
              ..unit = 'kg'
              ..type = IngredientEnum.vegetable.description
              ..isMarked = false,
            BasketItemEntity()
              ..groupId = 123
              ..ingredientId = 10
              ..name = 'Chicken Old'
              ..quantity = 300
              ..unit = 'g'
              ..type = IngredientEnum.meat.description
              ..isMarked = true, // User has marked this too
          ]);
        });

        // New response with updated data
        final response = BasketSummaryResponse(
          groupId: 123,
          startDate: '02-01-2024',
          ingredients: BasketIngredientsResponse(
            vegetables: [
              BasketItemResponse(
                id: 1,
                name: 'Tomato Fresh',
                quantity: 5,
                unit: 'kg',
              ),
              BasketItemResponse(
                id: 2,
                name: 'Onion Fresh',
                quantity: 4,
                unit: 'kg',
              ),
            ],
            meats: [
              BasketItemResponse(
                id: 10,
                name: 'Chicken Fresh',
                quantity: 800,
                unit: 'g',
              ),
            ],
            others: [],
          ),
        );

        // Act
        await basketLocalDs.cacheIngredientGroupData(response);

        // Assert
        final updatedItems = await isar.basketItemEntitys
            .filter()
            .groupIdEqualTo(123)
            .findAll();

        expect(updatedItems.length, 3);

        // Check that data is updated but isMarked is preserved
        final tomato = updatedItems.firstWhere(
          (item) => item.ingredientId == 1,
        );
        expect(tomato.name, 'Tomato Fresh'); // Updated
        expect(tomato.quantity, 5); // Updated
        expect(tomato.unit, 'kg'); // Updated
        expect(tomato.isMarked, true); // PRESERVED!

        final onion = updatedItems.firstWhere((item) => item.ingredientId == 2);
        expect(onion.name, 'Onion Fresh');
        expect(onion.isMarked, false); // PRESERVED!

        final chicken = updatedItems.firstWhere(
          (item) => item.ingredientId == 10,
        );
        expect(chicken.name, 'Chicken Fresh');
        expect(chicken.quantity, 800);
        expect(chicken.isMarked, true); // PRESERVED!
      },
    );

    test('should handle mixed new and existing items correctly', () async {
      // Arrange - One existing item
      await isar.writeTxn(() async {
        await isar.basketItemEntitys.put(
          BasketItemEntity()
            ..groupId = 123
            ..ingredientId = 1
            ..name = 'Tomato'
            ..quantity = 1
            ..unit = 'pcs'
            ..type = IngredientEnum.vegetable.description
            ..isMarked = true,
        );
      });

      // Response with 1 existing + 2 new items
      final response = BasketSummaryResponse(
        groupId: 123,
        startDate: '01-01-2024',
        ingredients: BasketIngredientsResponse(
          vegetables: [
            BasketItemResponse(
              id: 1,
              name: 'Tomato Updated',
              quantity: 3,
              unit: 'pcs',
            ), // Existing
            BasketItemResponse(
              id: 2,
              name: 'Carrot',
              quantity: 5,
              unit: 'pcs',
            ), // New
          ],
          meats: [
            BasketItemResponse(
              id: 10,
              name: 'Beef',
              quantity: 400,
              unit: 'g',
            ), // New
          ],
          others: [],
        ),
      );

      // Act
      await basketLocalDs.cacheIngredientGroupData(response);

      // Assert
      final items = await isar.basketItemEntitys
          .filter()
          .groupIdEqualTo(123)
          .findAll();

      expect(items.length, 3);

      // Existing item: should preserve isMarked
      final existingItem = items.firstWhere((item) => item.ingredientId == 1);
      expect(existingItem.name, 'Tomato Updated'); // Data updated
      expect(existingItem.quantity, 3);
      expect(existingItem.isMarked, true); // Flag preserved

      // New items: should have isMarked = false
      final carrot = items.firstWhere((item) => item.ingredientId == 2);
      expect(carrot.isMarked, false);

      final beef = items.firstWhere((item) => item.ingredientId == 10);
      expect(beef.isMarked, false);
      expect(beef.type, IngredientEnum.meat.description);
    });

    test('should handle empty ingredient lists gracefully', () async {
      // Arrange
      final response = BasketSummaryResponse(
        groupId: 123,
        startDate: '01-01-2024',
        ingredients: BasketIngredientsResponse(
          vegetables: [],
          meats: [],
          others: [],
        ),
      );

      // Act
      await basketLocalDs.cacheIngredientGroupData(response);

      // Assert
      final items = await isar.basketItemEntitys
          .filter()
          .groupIdEqualTo(123)
          .findAll();

      expect(items.isEmpty, true);
    });
  });

  group('cacheIngredientMainData', () {
    test('should save dashboard data and ingredients correctly', () async {
      // Arrange
      final summaryResponse = BasketSummaryResponse(
        groupId: 100,
        startDate: '01-01-2024',
        ingredients: BasketIngredientsResponse(
          vegetables: [
            BasketItemResponse(id: 1, name: 'Carrot', quantity: 5, unit: 'pcs'),
          ],
          meats: [],
          others: [],
        ),
      );

      final dashboardResponse = BasketDashboardResponse(
        currentWeekIngredients: summaryResponse,
        upcomingPlans: [
          BasketUpcomingPlanResponse(groupId: 101, startDate: '08-01-2024'),
        ],
      );

      // Act
      await basketLocalDs.cacheIngredientMainData(dashboardResponse);

      // Assert
      // Check Group Entity
      final groupEntity = await isar.basketGroupEntitys.get(1);
      expect(groupEntity, isNotNull);
      expect(groupEntity?.currentGroup?.groupId, 100);
      expect(groupEntity?.upcomingData.length, 1);
      expect(groupEntity?.upcomingData.first.groupId, 101);

      // Check Ingredients
      final savedItems = await isar.basketItemEntitys
          .filter()
          .groupIdEqualTo(100)
          .findAll();
      expect(savedItems.length, 1);
      expect(savedItems.first.name, 'Carrot');
    });

    test(
      'should update existing ingredients while preserving isMarked status',
      () async {
        // Arrange
        await isar.writeTxn(() async {
          await isar.basketItemEntitys.put(
            BasketItemEntity()
              ..groupId = 100
              ..ingredientId = 1
              ..name = 'Carrot Old'
              ..quantity = 1
              ..unit = 'pcs'
              ..type = IngredientEnum.vegetable.description
              ..isMarked = true,
          );
        });

        final summaryResponse = BasketSummaryResponse(
          groupId: 100,
          startDate: '01-01-2024',
          ingredients: BasketIngredientsResponse(
            vegetables: [
              BasketItemResponse(
                id: 1,
                name: 'Carrot Fresh',
                quantity: 10,
                unit: 'kg',
              ),
            ],
            meats: [],
            others: [],
          ),
        );

        final dashboardResponse = BasketDashboardResponse(
          currentWeekIngredients: summaryResponse,
          upcomingPlans: [],
        );

        // Act
        await basketLocalDs.cacheIngredientMainData(dashboardResponse);

        // Assert
        final item = await isar.basketItemEntitys
            .filter()
            .groupIdEqualTo(100)
            .ingredientIdEqualTo(1)
            .findFirst();

        expect(item, isNotNull);
        expect(item!.name, 'Carrot Fresh');
        expect(item.quantity, 10);
        expect(item.unit, 'kg');
        expect(item.isMarked, true); // Preserved
      },
    );

    test('should handle null currentWeekIngredients gracefully', () async {
      // Arrange
      final dashboardResponse = BasketDashboardResponse(
        currentWeekIngredients: null,
        upcomingPlans: [
          BasketUpcomingPlanResponse(groupId: 200, startDate: '15-01-2024'),
        ],
      );

      // Act
      await basketLocalDs.cacheIngredientMainData(dashboardResponse);

      // Assert
      final groupEntity = await isar.basketGroupEntitys.get(1);
      expect(groupEntity, isNotNull);
      expect(groupEntity?.currentGroup, isNull);
      expect(groupEntity?.upcomingData.length, 1);
      expect(groupEntity?.upcomingData.first.groupId, 200);

      // Ensure no ingredients were accidentally saved (assuming empty DB)
      final count = await isar.basketItemEntitys.count();
      expect(count, 0);
    });

    test('should update upcoming plans in dashboard data', () async {
      // Arrange - Initial Save
      final initialResponse = BasketDashboardResponse(
        currentWeekIngredients: null,
        upcomingPlans: [
          BasketUpcomingPlanResponse(groupId: 101, startDate: '08-01-2024'),
        ],
      );
      await basketLocalDs.cacheIngredientMainData(initialResponse);

      // New Response
      final newResponse = BasketDashboardResponse(
        currentWeekIngredients: null,
        upcomingPlans: [
          BasketUpcomingPlanResponse(groupId: 102, startDate: '15-01-2024'),
          BasketUpcomingPlanResponse(groupId: 103, startDate: '22-01-2024'),
        ],
      );

      // Act
      await basketLocalDs.cacheIngredientMainData(newResponse);

      // Assert
      final groupEntity = await isar.basketGroupEntitys.get(1);
      expect(groupEntity, isNotNull);
      expect(groupEntity?.upcomingData.length, 2);
      expect(groupEntity?.upcomingData[0].groupId, 102);
      expect(groupEntity?.upcomingData[1].groupId, 103);
    });
  });

  group('markIngredients', () {
    test('should update isMarked status when item exists', () async {
      // Arrange
      await isar.writeTxn(() async {
        await isar.basketItemEntitys.put(
          BasketItemEntity()
            ..groupId = 100
            ..ingredientId = 1
            ..name = 'Carrot'
            ..quantity = 1
            ..unit = 'pcs'
            ..type = IngredientEnum.vegetable.description
            ..isMarked = false,
        );
      });

      // Act
      await basketLocalDs.markIngredients(100, 1, true);

      // Assert
      final item = await isar.basketItemEntitys
          .filter()
          .groupIdEqualTo(100)
          .ingredientIdEqualTo(1)
          .findFirst();

      expect(item, isNotNull);
      expect(item!.isMarked, true);
    });

    test('should do nothing when item does not exist', () async {
      // Act
      await basketLocalDs.markIngredients(999, 999, true);

      // Assert
      final item = await isar.basketItemEntitys
          .filter()
          .groupIdEqualTo(999)
          .ingredientIdEqualTo(999)
          .findFirst();
      expect(item, isNull);
    });
  });

  group('getIngredientsDashboard', () {
    test('should emit updated data 3 times when database changes', () async {
      // Arrange
      final stream = basketLocalDs.getIngredientsDashboard();

      // Act & Assert
      expectLater(
        stream,
        emitsInOrder([
          isNull, // Initial state (empty DB)
          predicate<BasketGroupEntity?>((item) {
            return item != null &&
                item.lastUpdated == DateTime(2024, 1, 1) &&
                item.upcomingData.isEmpty;
          }),
          predicate<BasketGroupEntity?>((item) {
            return item != null &&
                item.lastUpdated == DateTime(2024, 1, 2) &&
                item.currentGroup?.groupId == 100;
          }),
          predicate<BasketGroupEntity?>((item) {
            return item != null &&
                item.lastUpdated == DateTime(2024, 1, 3) &&
                item.upcomingData.length == 1 &&
                item.upcomingData.first.groupId == 200;
          }),
        ]),
      );

      // Trigger 1
      await isar.writeTxn(() async {
        await isar.basketGroupEntitys.put(
          BasketGroupEntity()
            ..id = 1
            ..lastUpdated = DateTime(2024, 1, 1)
            ..currentGroup = null
            ..upcomingData = [],
        );
      });

      // Trigger 2
      await isar.writeTxn(() async {
        await isar.basketGroupEntitys.put(
          BasketGroupEntity()
            ..id = 1
            ..lastUpdated = DateTime(2024, 1, 2)
            ..currentGroup = (BasketUpcomingEmbed()
              ..groupId = 100
              ..startDate = DateTime(2024, 1, 2)
              ..endDate = DateTime(2024, 1, 8))
            ..upcomingData = [],
        );
      });

      // Trigger 3
      await isar.writeTxn(() async {
        await isar.basketGroupEntitys.put(
          BasketGroupEntity()
            ..id = 1
            ..lastUpdated = DateTime(2024, 1, 3)
            ..currentGroup = null
            ..upcomingData = [
              BasketUpcomingEmbed()
                ..groupId = 200
                ..startDate = DateTime(2024, 2, 1)
                ..endDate = DateTime(2024, 2, 7),
            ],
        );
      });
    });
  });

  group('getBasketStream', () {
    test(
      'should emit empty list initially, then updated list after insertion',
      () async {
        // Arrange
        const groupId = 300;
        const type = IngredientEnum.vegetable;

        // Act
        final stream = basketLocalDs.getBasketStream(
          groupId: groupId,
          type: type,
        );

        // Assert
        expectLater(
          stream,
          emitsInOrder([
            isEmpty, // Initial state (empty DB for this group/type)
            predicate<List<BasketItemEntity>>((list) {
              return list.length == 1 &&
                  list.first.name == 'Spinach' &&
                  list.first.groupId == groupId;
            }),
          ]),
        );

        // Trigger Insertion
        await isar.writeTxn(() async {
          await isar.basketItemEntitys.put(
            BasketItemEntity()
              ..groupId = groupId
              ..ingredientId = 50
              ..name = 'Spinach'
              ..quantity = 2
              ..unit = 'bundle'
              ..type = type.description
              ..isMarked = false,
          );
        });
      },
    );
  });
}
