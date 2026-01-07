import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:makanapa/core/states/data_state.dart';
import 'package:makanapa/features/home/domain/models/weekly_plan.dart';
import 'package:makanapa/features/home/domain/repositories/meal_plan_repository.dart';
import 'package:makanapa/features/home/presentation/plan/controllers/plan_controller.dart';
import 'package:makanapa/features/home/presentation/plan/controllers/state/plan_event_state.dart';
import 'package:makanapa/features/home/presentation/plan/controllers/state/plan_ui_state.dart';
import 'package:makanapa/features/home/provider/plan_provider.dart';
import 'package:makanapa/features/recipe/domain/models/recipe_item.dart';

import 'plan_controller_test.mocks.dart';

@GenerateMocks([MealPlanRepository])
void main() {
  late MockMealPlanRepository mockRepo;
  late ProviderContainer container;
  late PlanController controller;

  setUp(() {
    mockRepo = MockMealPlanRepository();
    container = ProviderContainer(
      overrides: [mealPlanRepositoryProvider.overrideWithValue(mockRepo)],
    );
    // Keep provider alive during async operations
    container.listen(planControllerProvider, (_, __) {});
    controller = container.read(planControllerProvider.notifier);
  });

  tearDown(() {
    container.dispose();
  });

  group('PlanController', () {
    test('initial state is PlanUiState', () {
      final state = container.read(planControllerProvider);
      expect(state, isA<PlanUiState>());
    });

    group('loadData', () {
      const tGroupId = 123;
      final tWeeklyPlan = WeeklyPlan(
        groupId: tGroupId,
        startDate: DateTime.now(),
        endDate: DateTime.now(),
        meals: [],
      );

      test('updates state with data when successful', () async {
        // Arrange
        when(
          mockRepo.getWeeklyPlanStream(tGroupId),
        ).thenAnswer((_) => Stream.value(tWeeklyPlan));
        when(
          mockRepo.reloadPlanDetail(tGroupId),
        ).thenAnswer((_) async => const Right(null));

        // Act
        final future = controller.loadData(tGroupId);

        // Verify loading state is set immediately
        expect(container.read(planControllerProvider).state, isA<Loading>());

        await future;

        // Assert
        final state = container.read(planControllerProvider);
        expect(state.state, isA<Success>());
        expect(state.data, tWeeklyPlan);
        verify(mockRepo.getWeeklyPlanStream(tGroupId)).called(1);
        verify(mockRepo.reloadPlanDetail(tGroupId)).called(1);
      });

      test(
        'updates state to Error when reload fails and no stream data',
        () async {
          // Arrange
          when(
            mockRepo.getWeeklyPlanStream(tGroupId),
          ).thenAnswer((_) => Stream.value(null));
          when(
            mockRepo.reloadPlanDetail(tGroupId),
          ).thenAnswer((_) async => const Left('Network Error'));

          // Act
          await controller.loadData(tGroupId);

          // Assert
          final state = container.read(planControllerProvider);
          expect(state.state, isA<Error>());
          expect((state.state as Error).message, 'Network Error');
        },
      );

      test('keeps Success state if reload fails but stream has data', () async {
        // Arrange
        when(
          mockRepo.getWeeklyPlanStream(tGroupId),
        ).thenAnswer((_) => Stream.value(tWeeklyPlan));
        when(
          mockRepo.reloadPlanDetail(tGroupId),
        ).thenAnswer((_) async => const Left('Network Error'));

        // Act
        await controller.loadData(tGroupId);

        // Assert
        final state = container.read(planControllerProvider);
        expect(state.state, isA<Success>());
        expect(state.data, tWeeklyPlan);
      });
    });

    test('toDetailrecipe emits openRecipeDetail event', () {
      final item = RecipeItem();

      expectLater(controller.events, emits(isA<PlanEventState>()));

      controller.toDetailrecipe(item);
    });
  });
}
