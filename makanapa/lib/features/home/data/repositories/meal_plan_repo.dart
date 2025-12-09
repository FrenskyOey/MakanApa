import 'package:dartz/dartz.dart';
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
    throw UnimplementedError();
  }

  @override
  Future<Either<String, void>> createMealPlan(CreatePlanRequest params) async {
    throw UnimplementedError();
  }

  @override
  Stream<Dashboard?> getDashboardStream() {
    throw UnimplementedError();
  }

  @override
  Stream<WeeklyPlan> getWeeklyPlanStream() {
    throw UnimplementedError();
  }

  @override
  Future<Either<String, void>> reloadPlanDetail(int groupId) async {
    throw UnimplementedError();
  }
}
