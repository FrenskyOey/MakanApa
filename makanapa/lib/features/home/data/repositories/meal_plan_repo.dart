import 'package:dartz/dartz.dart';
import 'package:makanapa/core/handlers/error/error_handler.dart';
import 'package:makanapa/features/home/data/data_source/plan_data_source.dart';
import 'package:makanapa/features/home/domain/models/create_plan_request.dart';
import 'package:makanapa/features/home/domain/models/dashboard.dart';
import 'package:makanapa/features/home/domain/repositories/meal_plan_repository.dart';
import 'package:makanapa/features/home/domain/models/weekly_plan.dart';

class MealPlanRepo implements MealPlanRepository {
  final PlanRemoteDataSource remoteDataSource;
  final PlanLocalDataSource localDataSource;

  MealPlanRepo({required this.remoteDataSource, required this.localDataSource});

  @override
  Future<Either<String, void>> getDashboardData() async {
    try {
      final dashboardResponse = await remoteDataSource.getDashboardData();
      await localDataSource.cacheDashboardData(dashboardResponse);
      return const Right(null);
    } catch (e, stackTrace) {
      final message = handleError(e, stackTrace);
      return Left(message);
    }
  }

  @override
  Stream<Dashboard?> getDashboardStream() {
    return localDataSource.getDashboardStream().map((entity) {
      try {
        return entity?.toDomain();
      } catch (e) {
        return null;
      }
    });
  }

  @override
  Future<Either<String, void>> createMealPlan(CreatePlanRequest params) async {
    try {
      await remoteDataSource.createMealPlan(params);
      // After creating a plan, refresh the dashboard to show the new plan.
      await getDashboardData();
      return const Right(null);
    } catch (e, stackTrace) {
      final message = handleError(e, stackTrace);
      return Left(message);
    }
  }

  @override
  Stream<WeeklyPlan?> getWeeklyPlanStream(int groupId) {
    return localDataSource.getWeeklyPlanStream(groupId).map((entity) {
      return entity?.toDomain();
    });
  }

  @override
  Future<Either<String, void>> reloadPlanDetail(int groupId) async {
    try {
      final weeklyPlanResponse = await remoteDataSource.getWeeklyPlan(groupId);
      final weeklyPlanDomain = weeklyPlanResponse.toDomain();
      await localDataSource.cacheWeeklyPlan(weeklyPlanDomain);
      return const Right(null);
    } catch (e, stackTrace) {
      final message = handleError(e, stackTrace);
      return Left(message);
    }
  }
}
