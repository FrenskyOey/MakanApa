import 'package:dio/dio.dart';
import 'package:isar_community/isar.dart';
import 'package:makanapa/features/basket/data/data_source/basket_data_source.dart';
import 'package:makanapa/features/basket/data/data_source/local/basket_local_ds.dart';
import 'package:makanapa/features/basket/data/data_source/remote/basket_remote_ds.dart';
import 'package:makanapa/features/basket/data/repositories/basket_repository.dart';
import 'package:makanapa/features/basket/domain/repositories/basket_repository.dart';
import 'package:makanapa/features/shared/provider/master_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'basket_provider.g.dart';

@Riverpod(keepAlive: true)
BasketRemoteDataSource basketRemoteDataSource(Ref ref) {
  final Dio client = ref.read(dioClientsProvider);
  return BasketRemoteDs(dio: client);
}

@Riverpod(keepAlive: true)
BasketLocalDataSource basketLocalDataSource(Ref ref) {
  final Isar isar = ref.read(isarClientsProvider);
  return BasketLocalDs(isar: isar);
}

@Riverpod(keepAlive: true)
BasketRepository basketRepository(Ref ref) {
  final BasketRemoteDataSource remoteDataSource = ref.read(
    basketRemoteDataSourceProvider,
  );

  final BasketLocalDataSource localDataSource = ref.read(
    basketLocalDataSourceProvider,
  );

  return BasketRepo(
    remoteDataSource: remoteDataSource,
    localDataSource: localDataSource,
  );
}
