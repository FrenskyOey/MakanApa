//  Sample Depedency

import 'package:makanapa/features/onboarding/data/data_source/login/local/login_local_ds.dart';
import 'package:makanapa/features/onboarding/data/data_source/login/login_data_source.dart';
import 'package:makanapa/features/onboarding/data/data_source/login/remote/login_remote_ds.dart';
import 'package:makanapa/features/onboarding/data/data_source/user/local/user_local_ds.dart';
import 'package:makanapa/features/onboarding/data/data_source/user/remote/user_remote_ds.dart';
import 'package:makanapa/features/onboarding/data/data_source/user/user_data_source.dart';
import 'package:makanapa/features/onboarding/data/repositories/login_repo.dart';
import 'package:makanapa/features/onboarding/data/repositories/user_repo.dart';
import 'package:makanapa/features/onboarding/domain/repositories/login_repository.dart';
import 'package:makanapa/features/onboarding/domain/repositories/user_repository.dart';
import 'package:makanapa/features/shared/provider/global_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'onboarding_provider.g.dart';

@riverpod
Future<LoginRemoteDataSource> loginRemoteDataSource(Ref ref) async {
  final supabaseClient = ref.watch(supabaseClientProvider);
  return LoginRemoteDataSourceImpl(supabase: supabaseClient);
}

@riverpod
Future<LoginLocalDataSource> loginLocalDataSource(Ref ref) async {
  final sharedPref = await ref.watch(sharedPreferencesProvider.future);
  return LoginLocalDataSourceImpl(prefs: sharedPref);
}

@riverpod
Future<UserRemoteDataSource> userRemoteDataSource(Ref ref) async {
  final supabaseClient = ref.watch(supabaseClientProvider);
  return UserRemoteDataSourceImpl(supabase: supabaseClient);
}

@riverpod
Future<UserLocalDataSource> userLocalDataSource(Ref ref) async {
  final isar = await ref.watch(isarProvider.future);
  return UserLocalDataSourceImpl(isar: isar);
}

@Riverpod(keepAlive: true)
Future<LoginRepository> loginRepository(Ref ref) async {
  final remoteRepo = await ref.watch(loginRemoteDataSourceProvider.future);
  final localRepo = await ref.watch(loginLocalDataSourceProvider.future);
  final userRemoteRepo = await ref.watch(userRemoteDataSourceProvider.future);
  final userLocalRepo = await ref.watch(userLocalDataSourceProvider.future);
  return LoginRepositoryImp(remoteDataSource: remoteRepo, localDataSource: localRepo, userRemoteDataSource: userRemoteRepo, userLocalDataSource: userLocalRepo);
}

@Riverpod(keepAlive: true)
Future<UserRepository> userRepo(Ref ref) async {
  final remoteRepo = await ref.watch(userRemoteDataSourceProvider.future);
  final localRepo = await ref.watch(userLocalDataSourceProvider.future);
  final authLocalRepo = await ref.watch(loginLocalDataSourceProvider.future);
  return UserRepositoryImp(remoteDataSource: remoteRepo, localDataSource: localRepo, authLocalSource: authLocalRepo);
}

