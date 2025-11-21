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
import 'package:makanapa/features/shared/provider/master_provider.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'onboarding_provider.g.dart';

@riverpod
LoginRemoteDataSource loginRemoteDataSource(Ref ref) {
  final supabaseClient = ref.read(supabaseClientsProvider);
  return LoginRemoteDataSourceImpl(supabase: supabaseClient);
}

@riverpod
LoginLocalDataSource loginLocalDataSource(Ref ref) {
  final sharedPref = ref.read(sharedPreferenceClientsProvider);
  return LoginLocalDataSourceImpl(prefs: sharedPref);
}

@riverpod
UserRemoteDataSource userRemoteDataSource(Ref ref) {
  final supabaseClient = ref.read(supabaseClientsProvider);
  return UserRemoteDataSourceImpl(supabase: supabaseClient);
}

@riverpod
UserLocalDataSource userLocalDataSource(Ref ref) {
  final isar = ref.read(isarClientsProvider);
  final prefs = ref.read(sharedPreferenceClientsProvider);
  return UserLocalDataSourceImpl(isar: isar, prefs: prefs);
}

@Riverpod(keepAlive: true)
LoginRepository loginRepository(Ref ref) {
  final remoteRepo = ref.read(loginRemoteDataSourceProvider);
  final localRepo = ref.read(loginLocalDataSourceProvider);
  final userRemoteRepo = ref.read(userRemoteDataSourceProvider);
  final userLocalRepo = ref.read(userLocalDataSourceProvider);
  return LoginRepositoryImp(
    remoteDataSource: remoteRepo,
    localDataSource: localRepo,
    userRemoteDataSource: userRemoteRepo,
    userLocalDataSource: userLocalRepo,
  );
}

@Riverpod(keepAlive: true)
UserRepository userRepo(Ref ref) {
  final remoteRepo = ref.read(userRemoteDataSourceProvider);
  final localRepo = ref.read(userLocalDataSourceProvider);
  final authLocalRepo = ref.read(loginLocalDataSourceProvider);
  return UserRepositoryImp(
    remoteDataSource: remoteRepo,
    localDataSource: localRepo,
    authLocalSource: authLocalRepo,
  );
}
