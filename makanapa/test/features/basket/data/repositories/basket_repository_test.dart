import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:makanapa/features/basket/data/data_source/basket_data_source.dart';
import 'package:makanapa/features/basket/data/models/entity/basket_group_isar_model.dart';
import 'package:makanapa/features/basket/data/models/entity/basket_item_isar_model.dart';
import 'package:makanapa/features/basket/data/models/entity/basket_upcoming_embed.dart';
import 'package:makanapa/features/basket/data/models/response/basket_dashboard_response.dart';
import 'package:makanapa/features/basket/data/models/response/basket_ingredients_response.dart';
import 'package:makanapa/features/basket/data/models/response/basket_summary_response.dart';
import 'package:makanapa/features/basket/data/repositories/basket_repository.dart';
import 'package:makanapa/features/basket/domain/models/basket_group.dart';
import 'package:makanapa/features/basket/domain/models/basket_option.dart';
import 'package:makanapa/features/recipe/domain/models/ingredient_enum.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'basket_repository_test.mocks.dart';

@GenerateMocks([BasketRemoteDataSource, BasketLocalDataSource])
void main() {
  late MockBasketRemoteDataSource remoteRepo;
  late MockBasketLocalDataSource localRepo;
  late BasketRepo basketRepo;

  setUp(() {
    remoteRepo = MockBasketRemoteDataSource();
    localRepo = MockBasketLocalDataSource();
    basketRepo = BasketRepo(
      remoteDataSource: remoteRepo,
      localDataSource: localRepo,
    );
  });

  group('getIngredientsSummary Test', () {
    test(
      'should return BasketSummary when remote and local calls succeed',
      () async {
        // Arrange
        final tResponse = BasketDashboardResponse(
          currentWeekIngredients: null,
          upcomingPlans: [],
        );
        when(
          remoteRepo.getIngredientMainData(),
        ).thenAnswer((_) async => tResponse);
        when(
          localRepo.cacheIngredientMainData(tResponse),
        ).thenAnswer((_) async => Future.value());

        // Act
        final result = await basketRepo.getIngredientsSummary();

        // Assert
        verify(remoteRepo.getIngredientMainData());
        verify(localRepo.cacheIngredientMainData(tResponse));
        expect(result, isA<Right<String, BasketSummary>>());
      },
    );

    test('should return Left when remote call fails', () async {
      // Arrange
      when(
        remoteRepo.getIngredientMainData(),
      ).thenThrow(Exception('Remote Error'));

      // Act
      final result = await basketRepo.getIngredientsSummary();

      // Assert
      verify(remoteRepo.getIngredientMainData());
      verifyZeroInteractions(localRepo);
      expect(result, isA<Left<String, BasketSummary>>());
    });

    test('should return Left when local cache fails', () async {
      // Arrange
      final tResponse = BasketDashboardResponse(
        currentWeekIngredients: null,
        upcomingPlans: [],
      );
      when(
        remoteRepo.getIngredientMainData(),
      ).thenAnswer((_) async => tResponse);
      when(
        localRepo.cacheIngredientMainData(tResponse),
      ).thenThrow(Exception('Cache Error'));

      // Act
      final result = await basketRepo.getIngredientsSummary();

      // Assert
      expect(result, isA<Left<String, BasketSummary>>());
    });
  });

  group('getIngredientOption Test', () {
    test('should emit BasketSummary when local stream emits data', () async {
      // Arrange
      final tEntity = BasketGroupEntity()
        ..lastUpdated = DateTime.now()
        ..currentGroup = null
        ..upcomingData = [];
      when(
        localRepo.getIngredientsDashboard(),
      ).thenAnswer((_) => Stream.value(tEntity));

      // Act
      final stream = basketRepo.getIngredientOption();

      // Assert
      expectLater(stream, emits(isA<BasketSummary>()));
    });

    test(
      'should emit empty BasketSummary when local stream emits null',
      () async {
        // Arrange
        when(
          localRepo.getIngredientsDashboard(),
        ).thenAnswer((_) => Stream.value(null));

        // Act
        final stream = basketRepo.getIngredientOption();

        // Assert
        expectLater(
          stream,
          emits(const BasketSummary(currentGroup: null, upcomingGroup: [])),
        );
      },
    );

    test(
      'should emit updated BasketSummary when stream updates from empty to full',
      () async {
        // Arrange
        final tEntityEmpty = BasketGroupEntity()
          ..lastUpdated = DateTime.now()
          ..currentGroup = null
          ..upcomingData = [];

        final tEntityFull = BasketGroupEntity()
          ..lastUpdated = DateTime.now()
          ..currentGroup = (BasketUpcomingEmbed()
            ..groupId = 1
            ..startDate = DateTime.now()
            ..endDate = DateTime.now().add(const Duration(days: 7)))
          ..upcomingData = [
            BasketUpcomingEmbed()
              ..groupId = 2
              ..startDate = DateTime.now().add(const Duration(days: 8))
              ..endDate = DateTime.now().add(const Duration(days: 14)),
          ];

        when(
          localRepo.getIngredientsDashboard(),
        ).thenAnswer((_) => Stream.fromIterable([tEntityEmpty, tEntityFull]));

        // Act
        final stream = basketRepo.getIngredientOption();

        // Assert
        expectLater(
          stream,
          emitsInOrder([
            predicate<BasketSummary>((summary) {
              return summary.currentGroup == null &&
                  summary.upcomingGroup.isEmpty;
            }),
            predicate<BasketSummary>((summary) {
              return summary.currentGroup != null &&
                  summary.currentGroup!.groupId == 1 &&
                  summary.upcomingGroup.length == 1 &&
                  summary.upcomingGroup.first.groupId == 2;
            }),
          ]),
        );
      },
    );
  });

  group('getBasketData Test', () {
    test(
      'should emit BasketGroup with data when local stream emits items',
      () async {
        // Arrange
        final tItems = [
          BasketItemEntity()
            ..groupId = 1
            ..ingredientId = 1
            ..quantity = 1
            ..isMarked = false
            ..unit = 'pcs'
            ..type = IngredientEnum.vegetable.description
            ..name = 'Item 1',
        ];
        const tGroupId = 1;
        const tType = IngredientEnum.vegetable;

        when(
          localRepo.getBasketStream(groupId: tGroupId, type: tType),
        ).thenAnswer((_) => Stream.value(tItems));

        // Act
        final stream = basketRepo.getBasketData(groupId: tGroupId, type: tType);

        // Assert
        expectLater(
          stream,
          emits(
            predicate<BasketGroup>((group) {
              return group.type == tType.description && group.data.length == 1;
            }),
          ),
        );
      },
    );

    test(
      'should emit empty BasketGroup when local stream emits empty list',
      () async {
        // Arrange
        const tGroupId = 1;
        const tType = IngredientEnum.vegetable;

        when(
          localRepo.getBasketStream(groupId: tGroupId, type: tType),
        ).thenAnswer((_) => Stream.value([]));

        // Act
        final stream = basketRepo.getBasketData(groupId: tGroupId, type: tType);

        // Assert
        expectLater(
          stream,
          emits(
            predicate<BasketGroup>((group) {
              return group.data.isEmpty;
            }),
          ),
        );
      },
    );
  });

  group('getIngridientData Test', () {
    test(
      'should return Right(null) when remote and local calls succeed',
      () async {
        // Arrange
        const tGroupId = 1;
        final tResponse = BasketSummaryResponse(
          groupId: tGroupId,
          startDate: '',
          ingredients: BasketIngredientsResponse(
            vegetables: [],
            meats: [],
            others: [],
          ),
        );

        when(
          remoteRepo.getIngredientByGroupId(tGroupId),
        ).thenAnswer((_) async => tResponse);
        when(
          localRepo.cacheIngredientGroupData(tResponse),
        ).thenAnswer((_) async => Future.value());

        // Act
        final result = await basketRepo.getIngridientData(groupId: tGroupId);

        // Assert
        verify(remoteRepo.getIngredientByGroupId(tGroupId));
        verify(localRepo.cacheIngredientGroupData(tResponse));
        expect(result, const Right(null));
      },
    );

    test('should return Left when remote call fails', () async {
      // Arrange
      const tGroupId = 1;
      when(
        remoteRepo.getIngredientByGroupId(tGroupId),
      ).thenThrow(Exception('Remote Error'));

      // Act
      final result = await basketRepo.getIngridientData(groupId: tGroupId);

      // Assert
      expect(result, isA<Left<String, void>>());
    });

    test('should return Left when local cache fails', () async {
      // Arrange
      const tGroupId = 1;
      final tResponse = BasketSummaryResponse(
        groupId: tGroupId,
        startDate: '',
        ingredients: BasketIngredientsResponse(
          vegetables: [],
          meats: [],
          others: [],
        ),
      );

      when(
        remoteRepo.getIngredientByGroupId(tGroupId),
      ).thenAnswer((_) async => tResponse);
      when(
        localRepo.cacheIngredientGroupData(tResponse),
      ).thenThrow(Exception('Cache Error'));

      // Act
      final result = await basketRepo.getIngridientData(groupId: tGroupId);

      // Assert
      expect(result, isA<Left<String, void>>());
    });
  });

  group('updateMark Test', () {
    test('should return Right(null) when local call succeeds', () async {
      // Arrange
      const tGroupId = 1;
      const tIngredientId = 1;
      const tIsMarked = true;

      when(
        localRepo.markIngredients(tGroupId, tIngredientId, tIsMarked),
      ).thenAnswer((_) async => Future.value());

      // Act
      final result = await basketRepo.updateMark(
        groupId: tGroupId,
        ingredientId: tIngredientId,
        isMarked: tIsMarked,
      );

      // Assert
      verify(localRepo.markIngredients(tGroupId, tIngredientId, tIsMarked));
      expect(result, const Right(null));
    });

    test('should return Left when local call fails', () async {
      // Arrange
      when(
        localRepo.markIngredients(any, any, any),
      ).thenThrow(Exception('DB Error'));

      // Act
      final result = await basketRepo.updateMark(
        groupId: 1,
        ingredientId: 1,
        isMarked: true,
      );

      // Assert
      expect(result, isA<Left<String, void>>());
    });
  });
}
