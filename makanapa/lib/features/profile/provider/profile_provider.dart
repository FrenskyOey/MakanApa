//  Sample Depedency

import 'package:dio/dio.dart';
import 'package:isar_community/isar.dart';
import 'package:makanapa/features/onboarding/data/data_source/user/user_data_source.dart';
import 'package:makanapa/features/onboarding/provider/onboarding_provider.dart';
import 'package:makanapa/features/profile/data/data_source/faq/faq_data_source.dart';
import 'package:makanapa/features/profile/data/data_source/faq/local/faq_local_ds.dart';
import 'package:makanapa/features/profile/data/data_source/faq/remote/faq_remote_ds.dart';
import 'package:makanapa/features/profile/data/data_source/profile/local/profile_local_ds.dart';
import 'package:makanapa/features/profile/data/data_source/profile/profile_data_source.dart';
import 'package:makanapa/features/profile/data/data_source/profile/remote/profile_remote_ds.dart';
import 'package:makanapa/features/profile/data/repositories/faq_repo.dart';
import 'package:makanapa/features/profile/data/repositories/profile_repo.dart';
import 'package:makanapa/features/profile/domain/repositories/faq_repository.dart';
import 'package:makanapa/features/profile/domain/repositories/profile_repository.dart';
import 'package:makanapa/features/shared/provider/master_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'profile_provider.g.dart';

@Riverpod(keepAlive: true)
ProfileRemoteDataSource profileRemoteDataSource(Ref ref) {
  final SupabaseClient supabase = ref.read(supabaseClientsProvider);
  return ProfileRemoteDs(supabase: supabase);
}

@Riverpod(keepAlive: true)
ProfileLocalDataSource profileLocalDataSource(Ref ref) {
  final Isar isar = ref.read(isarClientsProvider);
  final sharedPref = ref.read(sharedPreferenceClientsProvider);
  return ProfileLocalDs(isar: isar, prefs: sharedPref);
}

@Riverpod(keepAlive: true)
FaqRemoteDataSource faqRemoteDataSource(Ref ref) {
  final Dio client = ref.read(dioClientsProvider);
  return FaqRemoteDs(client: client);
}

@Riverpod(keepAlive: true)
FaqLocalDataSource faqLocalDataSource(Ref ref) {
  final Isar isar = ref.read(isarClientsProvider);
  return FaqLocalDs(isar: isar);
}

@Riverpod(keepAlive: true)
ProfileRepository profileRepository(Ref ref) {
  final ProfileRemoteDataSource remoteDataSource = ref.read(
    profileRemoteDataSourceProvider,
  );
  final ProfileLocalDataSource localDataSource = ref.read(
    profileLocalDataSourceProvider,
  );

  final UserLocalDataSource userLocalDataSource = ref.read(
    userLocalDataSourceProvider,
  );
  final UserRemoteDataSource userRemoteDataSource = ref.read(
    userRemoteDataSourceProvider,
  );

  return ProfileRepo(
    remoteDataSource: remoteDataSource,
    localDataSource: localDataSource,
    userLocalDataSource: userLocalDataSource,
    userRemoteDataSource: userRemoteDataSource,
  );
}

@Riverpod(keepAlive: true)
FaqRepository faqRepository(Ref ref) {
  final FaqRemoteDataSource remoteDataSource = ref.read(
    faqRemoteDataSourceProvider,
  );
  final FaqLocalDataSource localDataSource = ref.read(
    faqLocalDataSourceProvider,
  );
  return FaqRepo(
    remoteDataSource: remoteDataSource,
    localDataSource: localDataSource,
  );
}
