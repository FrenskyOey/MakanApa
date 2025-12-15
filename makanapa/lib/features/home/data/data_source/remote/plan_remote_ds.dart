import 'package:dio/dio.dart';
import 'package:intl/intl.dart';
import 'package:makanapa/features/home/data/data_source/plan_data_source.dart';
import 'package:makanapa/features/home/data/models/response/create_plan_response.dart';
import 'package:makanapa/features/home/data/models/response/dashboard/dashboard_response.dart';
import 'package:makanapa/features/home/data/models/response/dashboard/weekly_plan_response.dart';
import 'package:makanapa/features/home/domain/models/create_plan_request.dart';

class PlanRemoteDsImpl implements PlanRemoteDataSource {
  final Dio dio;

  PlanRemoteDsImpl({required this.dio});

  @override
  Future<CreatePlanResponse> createMealPlan(CreatePlanRequest params) async {
    final dateFormat = DateFormat('dd-MM-yyyy');
    final body = {
      'start_date': dateFormat.format(params.startDate),
      'end_date': dateFormat.format(params.endDate),
      'plan': params.dailyInputs.map((input) {
        final dailyPlan = <String, dynamic>{
          'date': dateFormat.format(input.date),
        };
        if (input.lunchId != null) {
          dailyPlan['lunch'] = input.lunchId;
        }
        if (input.dinnerId != null) {
          dailyPlan['dinner'] = input.dinnerId;
        }
        return dailyPlan;
      }).toList(),
    };

    final response = await dio.post('/v1/create_plan', data: body);

    return CreatePlanResponse.fromJson(response.data['data']);
  }

  @override
  Future<DashboardResponse> getDashboardData() async {
    final response = await dio.get('/v1/home_page');
    return DashboardResponse.fromJson(response.data['data']);
  }

  @override
  Future<WeeklyPlanResponse> getWeeklyPlan(int groupId) async {
    final response = await dio.post(
      '/v1/plan_detail',
      data: {'group_id': groupId},
    );
    return WeeklyPlanResponse.fromJson(response.data['data']);
  }
}
