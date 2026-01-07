import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:makanapa/features/home/domain/models/avaiblity_item.dart';
import 'package:makanapa/features/home/domain/repositories/meal_plan_repository.dart';
import 'package:makanapa/features/home/presentation/create/controllers/create_controller.dart';
import 'package:makanapa/features/home/presentation/create/controllers/state/create_event_state.dart';
import 'package:makanapa/features/home/presentation/create/controllers/state/create_ui_state.dart';
import 'package:makanapa/features/home/presentation/create/model/create_enum.dart';
import 'package:makanapa/features/home/presentation/create/model/create_item_model.dart';
import 'package:makanapa/features/home/provider/plan_provider.dart';
import 'package:makanapa/features/recipe/domain/models/recipe_item.dart';

import 'create_controller_test.mocks.dart';

@GenerateMocks([MealPlanRepository])
void main() {
  late MockMealPlanRepository mockRepo;
  late ProviderContainer container;
  late CreateController controller;
  late RecipeItem tRecipe;

  setUp(() {
    mockRepo = MockMealPlanRepository();
    container = ProviderContainer(
      overrides: [mealPlanRepositoryProvider.overrideWithValue(mockRepo)],
    );
    // Keep provider alive
    container.listen(createControllerProvider, (_, __) {});
    controller = container.read(createControllerProvider.notifier);

    tRecipe = const RecipeItem(
      id: 123,
      name: 'Nasi Goreng',
      enName: 'Fried Rice',
      picture: 'http://image.com/img.png',
    );
  });

  tearDown(() {
    container.dispose();
  });

  group('CreateController', () {
    test('initial state is CreateUiState', () {
      final state = container.read(createControllerProvider);
      expect(state, isA<CreateUiState>());
    });

    group('initData', () {
      test(
        'initializes form items correctly for a date range (Good Case)',
        () async {
          // Arrange
          final startDate = DateTime(2023, 1, 1);
          final endDate = DateTime(2023, 1, 3); // 2 days difference -> 3 items
          final item = AvaiblityItem(startDate: startDate, endDate: endDate);

          // Act
          controller.initData(item);

          // Assert
          final state = container.read(createControllerProvider);
          expect(state.startDate, startDate);
          expect(state.endDate, endDate);
          expect(state.formItem.length, 3);
          expect(state.formItem.first.date, startDate);
          expect(state.formItem.last.date, endDate);
        },
      );

      test(
        'initializes form items correctly for single day (Edge Case)',
        () async {
          // Arrange
          final date = DateTime(2023, 1, 1);
          final item = AvaiblityItem(startDate: date, endDate: date);

          // Act
          controller.initData(item);

          // Assert
          final state = container.read(createControllerProvider);
          expect(state.formItem.length, 1);
          expect(state.formItem.first.date, date);
        },
      );
    });

    group('onActionSubmited', () {
      final tDate = DateTime(2023, 1, 1);
      final tCreateItem = CreateItem(indexes: 0, date: tDate);

      test('emits selectFoodPage event when action is create (Good Case)', () {
        // Act & Assert
        expectLater(
          controller.events,
          emits(
            CreateEventState.selectFoodPage(
              CreateItem(indexes: 0, date: DateTime.now()),
              MealType.lunch,
            ),
          ),
        ).catchError((e) {});

        expectLater(
          controller.events,
          emits(
            predicate<CreateEventState>((event) {
              return event.maybeWhen(
                selectFoodPage: (item, type) =>
                    item.indexes == 0 && type == MealType.lunch,
                orElse: () => false,
              );
            }),
          ),
        );

        controller.onActionSubmited(
          tCreateItem,
          MealType.lunch,
          ActionType.create,
        );
      });

      test(
        'deletes meal from state when action is delete (State Change Case)',
        () {
          // Arrange: Initialize with some data
          final item = AvaiblityItem(startDate: tDate, endDate: tDate);
          controller.initData(item);
          controller.updateMeals(tCreateItem, MealType.lunch, tRecipe);

          // Act
          controller.onActionSubmited(
            tCreateItem,
            MealType.lunch,
            ActionType.delete,
          );

          // Assert
          final state = container.read(createControllerProvider);
          expect(state.formItem[0].lunchItem, isNull);
        },
      );
    });

    group('updateMeals', () {
      final tDate = DateTime(2023, 1, 1);
      final tCreateItem = CreateItem(indexes: 0, date: tDate);
      setUp(() {
        final item = AvaiblityItem(startDate: tDate, endDate: tDate);
        controller.initData(item);
      });

      test('updates lunch item correctly (Good Case)', () {
        // Act
        controller.updateMeals(tCreateItem, MealType.lunch, tRecipe);

        // Assert
        final state = container.read(createControllerProvider);
        expect(state.formItem[0].lunchItem, tRecipe);
        expect(state.formItem[0].dinnerItem, isNull);
      });
    });

    group('createPlan', () {
      final tDate = DateTime(2023, 1, 1);
      final tCreateItem = CreateItem(indexes: 0, date: tDate);

      setUp(() {
        final item = AvaiblityItem(startDate: tDate, endDate: tDate);
        controller.initData(item);
      });

      test(
        'emits toastError when no meals are selected (Bad Case - Validation)',
        () async {
          //Arrange
          final startDate = DateTime(2023, 1, 1);
          final endDate = DateTime(2023, 1, 3); // 2 days difference -> 3 items
          final item = AvaiblityItem(startDate: startDate, endDate: endDate);

          //Assert
          final expectation = expectLater(
            controller.events,
            emits(
              const CreateEventState.toastError(
                'Anda belum memilih makanan untuk plan minggu ini',
              ),
            ),
          );

          // Act
          controller.initData(item);
          await controller.createPlan();
          await expectation;
        },
      );

      test('calls repo and emits closePage on success (Good Case)', () async {
        // Arrange
        final startDate = DateTime(2023, 1, 1);
        final endDate = DateTime(2023, 1, 3); // 2 days difference -> 3 items
        final item = AvaiblityItem(startDate: startDate, endDate: endDate);

        // Assert
        final expectation = expectLater(
          controller.events,
          emits(const CreateEventState.closePage()),
        );

        // Arrange
        controller.initData(item);

        controller.updateMeals(tCreateItem, MealType.lunch, tRecipe);
        controller.updateMeals(
          tCreateItem.copyWith(indexes: 1),
          MealType.lunch,
          tRecipe,
        );
        controller.updateMeals(
          tCreateItem.copyWith(indexes: 2),
          MealType.lunch,
          tRecipe,
        );

        when(
          mockRepo.createMealPlan(any),
        ).thenAnswer((_) async => const Right(null));

        // Act
        await controller.createPlan();
        await expectation;

        // Assert
        verify(mockRepo.createMealPlan(any)).called(1);
        final state = container.read(createControllerProvider);
        expect(state.showLoading, false);
      });

      test(
        'calls repo and emits toastError on failure (Bad Case - API)',
        () async {
          // Arrange
          final startDate = DateTime(2023, 1, 1);
          final endDate = DateTime(2023, 1, 3); // 2 days difference -> 3 items
          final item = AvaiblityItem(startDate: startDate, endDate: endDate);

          // Assert
          final expectation = expectLater(
            controller.events,
            emits(const CreateEventState.toastError('API Error')),
          );

          when(
            mockRepo.createMealPlan(any),
          ).thenAnswer((_) async => const Left('API Error'));

          // Act
          controller.initData(item);
          controller.updateMeals(tCreateItem, MealType.lunch, tRecipe);
          controller.updateMeals(
            tCreateItem.copyWith(indexes: 1),
            MealType.lunch,
            tRecipe,
          );
          controller.updateMeals(
            tCreateItem.copyWith(indexes: 2),
            MealType.lunch,
            tRecipe,
          );

          // Act
          await controller.createPlan();
          await expectation;
        },
      );
    });
  });
}
