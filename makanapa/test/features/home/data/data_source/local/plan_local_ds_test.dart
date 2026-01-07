import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:isar_community/isar.dart';
import 'package:makanapa/features/home/data/data_source/local/plan_local_ds.dart';
import 'package:makanapa/features/home/data/models/entity/dashboard_isar_model.dart';
import 'package:makanapa/features/home/data/models/entity/weekly_detail_isar_model.dart';
import 'package:makanapa/features/home/data/models/response/dashboard/dashboard_response.dart';
import 'package:makanapa/features/home/domain/models/weekly_plan.dart';

void main() {
  late Isar isar;
  late PlanLocalDsImpl dataSource;
  late Directory tempDir;

  setUp(() async {
    tempDir = await Directory.systemTemp.createTemp('');
    // Initialize Isar core libraries for the test environment.
    await Isar.initializeIsarCore(download: true);

    // Open Isar with the required schemas.
    // Note: We assume DashboardEntitySchema and WeeklyDetailEntitySchema are available
    // via the model imports.
    isar = await Isar.open(
      [DashboardEntitySchema, WeeklyDetailEntitySchema],
      directory: tempDir.path,
      name: 'test_plan_${DateTime.now().millisecondsSinceEpoch}',
    );

    dataSource = PlanLocalDsImpl(isar: isar);
  });

  tearDown(() async {
    // Close and delete the database after each test.
    await isar.close(deleteFromDisk: true);

    if (await tempDir.exists()) {
      await tempDir.delete(recursive: true);
    }
  });

  group('PlanLocalDataSource', () {
    test('cacheDashboardData saves data to Isar', () async {
      // Arrange
      const dashboardResponse = DashboardResponse(
        upcomingPlans: [],
        availablePlans: [],
      );

      // Act
      await dataSource.cacheDashboardData(dashboardResponse);

      // Assert
      // Verify the data exists in the DB. Assuming ID 1 is used as per implementation.
      final saved = await isar.dashboardEntitys.get(1);
      expect(saved, isNotNull);
    });

    test('getDashboardStream emits data when available', () async {
      // Arrange
      const dashboardResponse = DashboardResponse(
        upcomingPlans: [],
        availablePlans: [],
      );
      // Pre-populate the database
      await dataSource.cacheDashboardData(dashboardResponse);

      // Act
      final stream = dataSource.getDashboardStream();

      // Assert
      expect(stream, emits(isNotNull));
    });

    test('cacheWeeklyPlan saves data to Isar', () async {
      // Arrange
      final weeklyPlan = WeeklyPlan(
        groupId: 123,
        startDate: DateTime.now(),
        endDate: DateTime.now(),
        meals: [],
      );

      // Act
      await dataSource.cacheWeeklyPlan(weeklyPlan);

      // Assert
      final saved = await isar.weeklyDetailEntitys
          .filter()
          .groupIdEqualTo(123)
          .findFirst();
      expect(saved, isNotNull);
      expect(saved?.groupId, 123);
    });

    test('getWeeklyPlanStream emits data for specific group', () async {
      // Arrange
      final weeklyPlan = WeeklyPlan(
        groupId: 123,
        startDate: DateTime.now(),
        endDate: DateTime.now(),
        meals: [],
      );
      await dataSource.cacheWeeklyPlan(weeklyPlan);

      // Act
      final stream = dataSource.getWeeklyPlanStream(123);

      // Assert
      expect(stream, emits(isNotNull));
    });
  });
}
