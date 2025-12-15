import 'package:makanapa/features/home/data/models/entity/dashboard_isar_model.dart';
import 'package:makanapa/features/home/data/models/entity/weekly_detail_isar_model.dart';
import 'package:makanapa/features/home/data/models/response/create_plan_response.dart';
import 'package:makanapa/features/home/data/models/response/dashboard/dashboard_response.dart';
import 'package:makanapa/features/home/data/models/response/dashboard/weekly_plan_response.dart';
import 'package:makanapa/features/home/domain/models/create_plan_request.dart';
import 'package:makanapa/features/home/domain/models/weekly_plan.dart';

abstract class PlanRemoteDataSource {
  Future<DashboardResponse> getDashboardData();
  Future<WeeklyPlanResponse> getWeeklyPlan(int groupId);
  Future<CreatePlanResponse> createMealPlan(CreatePlanRequest params);
}

abstract class PlanLocalDataSource {
  Future<void> cacheDashboardData(DashboardResponse dashboard);
  Future<void> cacheWeeklyPlan(WeeklyPlan weeklyPlan);
  Stream<DashboardEntity?> getDashboardStream();
  Stream<WeeklyDetailEntity?> getWeeklyPlanStream(int groupId);
}
