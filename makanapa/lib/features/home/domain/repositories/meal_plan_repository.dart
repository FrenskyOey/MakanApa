import 'package:dartz/dartz.dart';
import 'package:makanapa/features/home/domain/models/create_plan_request.dart';
import 'package:makanapa/features/home/domain/models/dashboard.dart';
import 'package:makanapa/features/home/domain/models/weekly_plan.dart';

abstract class MealPlanRepository {
  Future<Either<String, void>> getDashboardData();
  Future<Either<String, void>> reloadPlanDetail(int groupId);
  Future<Either<String, void>> createMealPlan(CreatePlanRequest params);

  Stream<Dashboard?> getDashboardStream();
  Stream<WeeklyPlan?> getWeeklyPlanStream(int groupId);
}
