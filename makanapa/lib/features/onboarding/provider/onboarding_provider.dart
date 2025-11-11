//  Sample Depedency
/*
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'onboarding_provider.g.dart';

@riverpod
Future<TemplateRemoteDataSource> templateRemoteDataSource(Ref ref) async {
  final dio = await ref.watch(dioProvider.future);
  return TemplateRemoteDataSourceImpl(dio: dio);
}

@riverpod
Future<TemplateRepository> templateRepository(Ref ref) async {
  final remoteRepo = await ref.watch(templateRemoteDataSourceProvider.future);
  return TemplateRepositoryImp(remoteDataSource: remoteRepo);
}
*/
