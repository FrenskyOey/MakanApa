import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:makanapa/features/recipe/domain/models/recipe_item.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:makanapa/features/home/domain/models/avaiblity_item.dart';
import 'package:makanapa/features/home/domain/models/dashboard.dart';
import 'package:makanapa/features/home/domain/repositories/meal_plan_repository.dart';
import 'package:makanapa/features/home/presentation/home/controllers/home_controller.dart';
import 'package:makanapa/features/home/presentation/home/controllers/state/home_event_state.dart';
import 'package:makanapa/features/home/presentation/home/controllers/state/home_ui_state.dart';
import 'package:makanapa/features/home/provider/plan_provider.dart';

import 'home_controller_test.mocks.dart';

@GenerateMocks([MealPlanRepository])
void main() {
  late MockMealPlanRepository mockRepo;
  late ProviderContainer container;
  late HomeController controller;

  setUp(() {
    mockRepo = MockMealPlanRepository();
    container = ProviderContainer(
      overrides: [mealPlanRepositoryProvider.overrideWithValue(mockRepo)],
    );
    // Listen to the provider to keep it alive (prevent auto-dispose)
    container.listen(homeControllerProvider, (_, __) {});
    controller = container.read(homeControllerProvider.notifier);
  });

  tearDown(() {
    container.dispose();
  });

  group('HomeController', () {
    test('initial state is HomeUiState', () {
      final state = container.read(homeControllerProvider);
      expect(state, isA<HomeUiState>());
    });

    group('reloadDashboardData', () {
      test('updates state with dashboard data when successful', () async {
        // Arrange
        final tDashboard = Dashboard(upcomingItems: [], avaiblityItems: []);

        when(
          mockRepo.getDashboardStream(),
        ).thenAnswer((_) => Stream.value(tDashboard));
        when(
          mockRepo.getDashboardData(),
        ).thenAnswer((_) async => const Right(null));

        // Act
        await controller.reloadDashboardData();

        // Assert
        final state = container.read(homeControllerProvider);
        expect(state.dashboardData, tDashboard);
        expect(state.hideLoading, true);
        verify(mockRepo.getDashboardData()).called(1);
      });

      test(
        'sets error message when getDashboardData fails and no data exists',
        () async {
          // Arrange
          when(mockRepo.getDashboardStream()).thenAnswer((_) => Stream.empty());
          when(
            mockRepo.getDashboardData(),
          ).thenAnswer((_) async => const Left('Server Error'));

          // Act
          await controller.reloadDashboardData();

          // Assert
          final state = container.read(homeControllerProvider);
          expect(state.errorMessages, "Ada yang error mohon coba lagi");
          expect(state.hideLoading, true);
        },
      );

      test(
        'emits toast error when getDashboardData fails and data exists',
        () async {
          // Arrange
          final tDashboard = Dashboard(upcomingItems: [], avaiblityItems: []);

          // Setup stream to emit data so state.dashboardData is not null
          when(
            mockRepo.getDashboardStream(),
          ).thenAnswer((_) => Stream.value(tDashboard));
          when(
            mockRepo.getDashboardData(),
          ).thenAnswer((_) async => const Left('Server Error'));

          // Act
          // We expect a toast error event
          expectLater(
            controller.events,
            emitsThrough(
              predicate<HomeEventState>((event) {
                return event.toString().contains(
                  "Ada yang error mohon coba lagi",
                );
              }),
            ),
          );

          await controller.reloadDashboardData();
        },
      );
    });

    group('Events', () {
      test('createPlans emits openCreatePlan event', () {
        final item = AvaiblityItem(
          startDate: DateTime.now(),
          endDate: DateTime.now(),
        );

        expectLater(
          controller.events,
          emits(
            predicate<HomeEventState>((event) {
              // Assuming Freezed toString or similar structure
              return event.toString().contains('openCreatePlan');
            }),
          ),
        );

        controller.createPlans(item);
      });

      test('toDetailrecipe emits openRecipeDetail event', () {
        final item = RecipeItem();

        expectLater(
          controller.events,
          emits(
            predicate<HomeEventState>((event) {
              return event.toString().contains('openRecipeDetail');
            }),
          ),
        );

        controller.toDetailrecipe(item);
      });

      test('toPlanDetail emits openPlanDetail event', () {
        const groupId = 123;

        expectLater(
          controller.events,
          emits(
            predicate<HomeEventState>((event) {
              return event.toString().contains('openPlanDetail') &&
                  event.toString().contains('123');
            }),
          ),
        );

        controller.toPlanDetail(groupId);
      });
    });
  });
}
