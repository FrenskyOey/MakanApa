//  Sample Depedency
/*
import 'package:dio/dio.dart';
import 'package:isar_community/isar.dart';
import 'package:makanapa/features/shared/provider/master_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'template_provider.g.dart';

@Riverpod(keepAlive: true)
TemplateRemoteDataSource templateRemoteDataSource(Ref ref) {
  final Dio client = ref.read(dioClientsProvider);
  return TemplateRemoteDS(dio: client);
}

@Riverpod(keepAlive: true)
TemplateLocalDataSource templateLocalDataSource(Ref ref) {
  final Isar isar = ref.read(isarClientsProvider);
  return TemplateLocalDS(isar: isar);
}

@Riverpod(keepAlive: true)
TemplateRepository templateRepository(Ref ref) {
  final TemplateRemoteDataSource remoteDataSource = ref.read(
    templateRemoteDataSourceProvider,
  );
  final TemplateLocalDataSource localDataSource = ref.read(
    templateLocalDataSourceProvider,
  );
  return Template(
    remoteDataSource: remoteDataSource,
    localDataSource: localDataSource,
  );
}
*/
