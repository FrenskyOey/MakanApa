import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:makanapa/features/home/data/data_source/plan_data_source.dart';
import 'package:makanapa/features/home/data/models/entity/dashboard_isar_model.dart';
import 'package:makanapa/features/home/data/models/entity/weekly_detail_isar_model.dart';
import 'package:makanapa/features/home/data/models/response/create_plan_response.dart';
import 'package:makanapa/features/home/data/models/response/dashboard/dashboard_response.dart';
import 'package:makanapa/features/home/data/models/response/dashboard/weekly_plan_response.dart';
import 'package:makanapa/features/home/data/repositories/meal_plan_repo.dart';
import 'package:makanapa/features/home/domain/models/create_plan_request.dart';
import 'package:makanapa/features/home/domain/models/daily_meal.dart';
import 'package:makanapa/features/home/domain/models/weekly_plan.dart';

import 'meal_plan_repo_test.mocks.dart';

@GenerateMocks([PlanRemoteDataSource, PlanLocalDataSource])
void main() {
  late MealPlanRepo repository;
  late MockPlanRemoteDataSource mockRemoteDataSource;
  late MockPlanLocalDataSource mockLocalDataSource;

  setUp(() {
    mockRemoteDataSource = MockPlanRemoteDataSource();
    mockLocalDataSource = MockPlanLocalDataSource();
    repository = MealPlanRepo(
      remoteDataSource: mockRemoteDataSource,
      localDataSource: mockLocalDataSource,
    );
  });

  group('getDashboardData', () {
    const tDashboardResponse = DashboardResponse(
      upcomingPlans: [],
      availablePlans: [],
    );

    test('should return Right(null) when remote call is successful', () async {
      // Arrange
      when(
        mockRemoteDataSource.getDashboardData(),
      ).thenAnswer((_) async => tDashboardResponse);
      when(
        mockLocalDataSource.cacheDashboardData(any),
      ).thenAnswer((_) async => Future.value());

      // Act
      final result = await repository.getDashboardData();

      // Assert
      verify(mockRemoteDataSource.getDashboardData());
      verify(mockLocalDataSource.cacheDashboardData(tDashboardResponse));
      expect(result, const Right(null));
    });

    test('should return Left(String) when remote call fails', () async {
      // Arrange
      when(
        mockRemoteDataSource.getDashboardData(),
      ).thenThrow(Exception('Server error'));

      // Act
      final result = await repository.getDashboardData();

      // Assert
      verify(mockRemoteDataSource.getDashboardData());
      verifyZeroInteractions(mockLocalDataSource);
      expect(result, isA<Left>());
    });
  });

  group('getDashboardStream', () {
    const tDashboardResponse = DashboardResponse(
      upcomingPlans: [
        UpcomingPlanResponse(groupId: 101, startDate: '10-10-2023'),
      ],
      availablePlans: [AvailablePlanResponse(startDate: '17-10-2023')],
    );
    final tEntity = DashboardEntity.fromResponse(tDashboardResponse);
    final tDashboard = tEntity.toDomain();

    test('should emit Dashboard when stream emits entity', () {
      // Arrange
      when(
        mockLocalDataSource.getDashboardStream(),
      ).thenAnswer((_) => Stream.value(tEntity));

      // Act
      final stream = repository.getDashboardStream();

      // Assert
      expectLater(stream, emits(tDashboard));
    });
  });

  group('createMealPlan', () {
    final tRequest = CreatePlanRequest(
      startDate: DateTime.now(),
      endDate: DateTime.now(),
      dailyInputs: [],
    );
    const tCreateResponse = CreatePlanResponse(groupId: 1, message: 'Success');
    const tDashboardResponse = DashboardResponse(
      upcomingPlans: [],
      availablePlans: [],
    );

    test(
      'should return Right(null) when creation and refresh are successful',
      () async {
        // Arrange
        when(
          mockRemoteDataSource.createMealPlan(any),
        ).thenAnswer((_) async => tCreateResponse);
        // Mock the subsequent getDashboardData calls
        when(
          mockRemoteDataSource.getDashboardData(),
        ).thenAnswer((_) async => tDashboardResponse);
        when(
          mockLocalDataSource.cacheDashboardData(any),
        ).thenAnswer((_) async => Future.value());

        // Act
        final result = await repository.createMealPlan(tRequest);

        // Assert
        verify(mockRemoteDataSource.createMealPlan(tRequest));
        verify(
          mockRemoteDataSource.getDashboardData(),
        ); // Verify refresh happened
        expect(result, const Right(null));
      },
    );

    test('should return Left(String) when creation fails', () async {
      // Arrange
      when(
        mockRemoteDataSource.createMealPlan(any),
      ).thenThrow(Exception('Creation failed'));

      // Act
      final result = await repository.createMealPlan(tRequest);

      // Assert
      verify(mockRemoteDataSource.createMealPlan(tRequest));
      verifyNever(mockRemoteDataSource.getDashboardData());
      expect(result, isA<Left>());
    });
  });

  group('getWeeklyPlanStream', () {
    const tGroupId = 123;
    final tWeeklyPlan = WeeklyPlan(
      groupId: tGroupId,
      startDate: DateTime.now(),
      endDate: DateTime.now().add(const Duration(days: 7)),
      meals: [
        DailyMeal(times: DateTime.now()),
        DailyMeal(times: DateTime.now().add(const Duration(days: 1))),
      ],
    );
    final tEntity = WeeklyDetailEntity.fromEntity(tWeeklyPlan);

    test('should emit WeeklyPlan when stream emits entity', () {
      // Arrange
      when(
        mockLocalDataSource.getWeeklyPlanStream(tGroupId),
      ).thenAnswer((_) => Stream.value(tEntity));

      // Act
      final stream = repository.getWeeklyPlanStream(tGroupId);

      // Assert
      expectLater(stream, emits(tWeeklyPlan));
    });
  });

  group('reloadPlanDetail', () {
    const tGroupId = 123;
    const tWeeklyResponse = WeeklyPlanResponse(
      groupId: tGroupId,
      startDate: '01-01-2023',
      endDate: '07-01-2023',
      mealPlan: [],
    );

    test('should return Right(null) when remote call is successful', () async {
      // Arrange
      when(
        mockRemoteDataSource.getWeeklyPlan(tGroupId),
      ).thenAnswer((_) async => tWeeklyResponse);
      when(
        mockLocalDataSource.cacheWeeklyPlan(any),
      ).thenAnswer((_) async => Future.value());

      // Act
      final result = await repository.reloadPlanDetail(tGroupId);

      // Assert
      verify(mockRemoteDataSource.getWeeklyPlan(tGroupId));
      verify(mockLocalDataSource.cacheWeeklyPlan(any));
      expect(result, const Right(null));
    });

    test('should return Left(String) when remote call fails', () async {
      // Arrange
      when(
        mockRemoteDataSource.getWeeklyPlan(tGroupId),
      ).thenThrow(Exception('Network error'));

      // Act
      final result = await repository.reloadPlanDetail(tGroupId);

      // Assert
      verify(mockRemoteDataSource.getWeeklyPlan(tGroupId));
      verifyZeroInteractions(mockLocalDataSource);
      expect(result, isA<Left>());
    });
  });
}
