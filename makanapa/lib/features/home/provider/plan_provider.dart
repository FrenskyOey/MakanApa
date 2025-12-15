import 'package:dio/dio.dart';
import 'package:isar_community/isar.dart';
import 'package:makanapa/features/home/data/data_source/local/plan_local_ds.dart';
import 'package:makanapa/features/home/data/data_source/plan_data_source.dart';
import 'package:makanapa/features/home/data/data_source/remote/plan_remote_ds.dart';
import 'package:makanapa/features/home/data/repositories/meal_plan_repo.dart';
import 'package:makanapa/features/home/domain/repositories/meal_plan_repository.dart';
import 'package:makanapa/features/shared/provider/master_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'plan_provider.g.dart';

@Riverpod(keepAlive: true)
PlanRemoteDataSource planRemoteDataSource(Ref ref) {
  final Dio client = ref.read(dioClientsProvider);
  return PlanRemoteDsImpl(dio: client);
}

@Riverpod(keepAlive: true)
PlanLocalDataSource planLocalDataSource(Ref ref) {
  final Isar isar = ref.read(isarClientsProvider);
  return PlanLocalDsImpl(isar: isar);
}

@Riverpod(keepAlive: true)
MealPlanRepository mealPlanRepository(Ref ref) {
  final PlanRemoteDataSource remoteDataSource = ref.read(
    planRemoteDataSourceProvider,
  );
  final PlanLocalDataSource localDataSource = ref.read(
    planLocalDataSourceProvider,
  );
  return MealPlanRepo(
    remoteDataSource: remoteDataSource,
    localDataSource: localDataSource,
  );
}
