//  Sample Depedency

import 'package:dio/dio.dart';
import 'package:isar_community/isar.dart';
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
import 'package:makanapa/features/shared/provider/global_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'profile_provider.g.dart';

@riverpod
Future<ProfileRemoteDataSource> profileRemoteDataSource(Ref ref) async {
  final SupabaseClient supabase = ref.watch(supabaseClientProvider);
  return ProfileRemoteDs(supabase: supabase);
}

@riverpod
Future<ProfileLocalDataSource> profileLocalDataSource(Ref ref) async {
  final Isar isar = await ref.watch(isarProvider.future);
  final sharedPref = await ref.watch(sharedPreferencesProvider.future);
  return ProfileLocalDs(isar: isar, prefs: sharedPref);
}

@riverpod
Future<FaqRemoteDataSource> faqRemoteDataSource(Ref ref) async {
  final Dio client = await ref.watch(dioProvider.future);
  return FaqRemoteDs(client: client);
}

@riverpod
Future<FaqLocalDataSource> faqLocalDataSource(Ref ref) async {
  final Isar isar = await ref.watch(isarProvider.future);
  return FaqLocalDs(isar: isar);
}

@riverpod
Future<ProfileRepository> profileRepository(Ref ref) async {
  final ProfileRemoteDataSource remoteDataSource = await ref.watch(
    profileRemoteDataSourceProvider.future,
  );
  final ProfileLocalDataSource localDataSource = await ref.watch(
    profileLocalDataSourceProvider.future,
  );
  return ProfileRepo(
    remoteDataSource: remoteDataSource,
    localDataSource: localDataSource,
  );
}

@riverpod
Future<FaqRepository> faqRepository(Ref ref) async {
  final FaqRemoteDataSource remoteDataSource = await ref.watch(
    faqRemoteDataSourceProvider.future,
  );
  final FaqLocalDataSource localDataSource = await ref.watch(
    faqLocalDataSourceProvider.future,
  );
  return FaqRepo(
    remoteDataSource: remoteDataSource,
    localDataSource: localDataSource,
  );
}
