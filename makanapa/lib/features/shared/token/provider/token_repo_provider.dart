import 'package:makanapa/features/onboarding/provider/onboarding_provider.dart';
import 'package:makanapa/features/shared/provider/master_provider.dart';
import 'package:makanapa/features/shared/token/data/data_source/local/token_local_ds.dart';
import 'package:makanapa/features/shared/token/data/data_source/remote/token_remote_ds.dart';
import 'package:makanapa/features/shared/token/data/data_source/token_data_source.dart';
import 'package:makanapa/features/shared/token/data/token_repo.dart';
import 'package:makanapa/features/shared/token/domain/token_repository.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'token_repo_provider.g.dart';

@riverpod
TokenRemoteDataSource tokenRemoteDataSource(Ref ref) {
  final supabaseClient = ref.read(supabaseClientsProvider);
  return TokenRemoteDataSourceImpl(supabase: supabaseClient);
}

@riverpod
TokenLocalDataSource tokenLocalDataSource(Ref ref) {
  final supabaseClient = ref.read(supabaseClientsProvider);
  final sharedPref = ref.read(sharedPreferenceClientsProvider);
  return TokenLocaDataSourceImpl(supabase: supabaseClient, prefs: sharedPref);
}

@Riverpod(keepAlive: true)
TokenRepository tokenRepository(Ref ref) {
  final remoteRepo = ref.read(tokenRemoteDataSourceProvider);
  final localRepo = ref.read(tokenLocalDataSourceProvider);
  final userLocalRepo = ref.read(userLocalDataSourceProvider);

  return TokenRepositoryImp(
    remoteDataSource: remoteRepo,
    localDataSource: localRepo,
    userLocalDataSource: userLocalRepo,
  );
}
