import 'package:isar_community/isar.dart';
import 'package:makanapa/features/home/data/data_source/plan_data_source.dart';
import 'package:makanapa/features/home/data/models/entity/dashboard_isar_model.dart';
import 'package:makanapa/features/home/data/models/entity/weekly_detail_isar_model.dart';
import 'package:makanapa/features/home/domain/models/dashboard.dart';
import 'package:makanapa/features/home/domain/models/weekly_plan.dart';

class PlanLocalDsImpl implements PlanLocalDataSource {
  final Isar isar;

  PlanLocalDsImpl({required this.isar});

  @override
  Future<void> cacheDashboardData(Dashboard dashboard) async {
    throw UnimplementedError();
  }

  @override
  Future<void> cacheWeeklyPlan(WeeklyPlan weeklyPlan) async {
    throw UnimplementedError();
  }

  @override
  Stream<DashboardEntity?> getDashboardStream() {
    throw UnimplementedError();
  }

  @override
  Stream<WeeklyDetailEntity?> getWeeklyPlanStream(int groupId) {
    throw UnimplementedError();
  }
}
