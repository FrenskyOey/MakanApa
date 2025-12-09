import 'package:dio/dio.dart';
import 'package:makanapa/features/home/data/data_source/plan_data_source.dart';
import 'package:makanapa/features/home/data/models/response/create_plan_response.dart';
import 'package:makanapa/features/home/data/models/response/dashboard/dashboard_response.dart';
import 'package:makanapa/features/home/data/models/response/dashboard/weekly_plan_response.dart';
import 'package:makanapa/features/home/domain/models/create_plan_request.dart';

class PlanRemoteDsImpl implements PlanRemoteDataSource {
  final Dio dio;

  PlanRemoteDsImpl({required this.dio});

  @override
  Future<CreatePlanResponse> createMealPlan(CreatePlanRequest params) {
    throw UnimplementedError();
  }

  @override
  Future<DashboardResponse> getDashboardData() {
    throw UnimplementedError();
  }

  @override
  Future<WeeklyPlanResponse> getWeeklyPlan(int groupId) {
    throw UnimplementedError();
  }
}
