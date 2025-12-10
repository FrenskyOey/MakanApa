import 'package:isar_community/isar.dart';
import 'package:makanapa/features/home/data/data_source/plan_data_source.dart';
import 'package:makanapa/features/home/data/models/entity/dashboard_isar_model.dart';
import 'package:makanapa/features/home/data/models/entity/weekly_detail_isar_model.dart';
import 'package:makanapa/features/home/data/models/response/dashboard/dashboard_response.dart';
import 'package:makanapa/features/home/domain/models/weekly_plan.dart';

class PlanLocalDsImpl implements PlanLocalDataSource {
  final Isar isar;

  PlanLocalDsImpl({required this.isar});

  @override
  Future<void> cacheDashboardData(DashboardResponse dashboard) async {
    final entity = DashboardEntity.fromResponse(dashboard);
    await isar.writeTxn(() async => await isar.dashboardEntitys.put(entity));
  }

  @override
  Stream<DashboardEntity?> getDashboardStream() {
    // Watch the single dashboard object with ID 1 for changes.
    return isar.dashboardEntitys.watchObject(1, fireImmediately: true);
  }

  @override
  Future<void> cacheWeeklyPlan(WeeklyPlan weeklyPlan) async {
    final entity = WeeklyDetailEntity.fromEntity(weeklyPlan);
    // Using `put` will upsert the record based on the unique `groupId` index.
    await isar.writeTxn(() async => await isar.weeklyDetailEntitys.put(entity));
  }

  @override
  Stream<WeeklyDetailEntity?> getWeeklyPlanStream(int groupId) {
    return isar.weeklyDetailEntitys
        .filter()
        .groupIdEqualTo(groupId)
        .watch(fireImmediately: true)
        .map((data) => data.isNotEmpty ? data.first : null);
  }
}
