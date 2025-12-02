import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:isar_community/isar.dart';
import 'package:makanapa/features/recipe/data/data_source/local/recipe_local_ds.dart';
import 'package:makanapa/features/recipe/data/data_source/recipe_data_source.dart';
import 'package:makanapa/features/recipe/data/data_source/remote/recipe_remote_ds.dart';
import 'package:makanapa/features/recipe/data/repositories/recipe_repo.dart';
import 'package:makanapa/features/recipe/domain/models/page_request_state.dart';
import 'package:makanapa/features/recipe/domain/models/recipe_item.dart';
import 'package:makanapa/features/recipe/domain/repositories/recipe_repository.dart';
import 'package:makanapa/features/shared/provider/master_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'recipe_provider.g.dart';

//  Sample Depedency
@Riverpod(keepAlive: true)
RecipeRemoteDataSource recipeRemoteDataSource(Ref ref) {
  final Dio client = ref.read(dioClientsProvider);
  return RecipeRemoteDs(client: client);
}

@Riverpod(keepAlive: true)
RecipeLocalDataSource recipeLocalDataSource(Ref ref) {
  final Isar isar = ref.read(isarClientsProvider);
  return RecipeLocalDs(isar: isar);
}

@Riverpod(keepAlive: true)
RecipeRepository recipeRepository(Ref ref) {
  final RecipeRemoteDataSource remoteDataSource = ref.read(
    recipeRemoteDataSourceProvider,
  );
  final RecipeLocalDataSource localDataSource = ref.read(
    recipeLocalDataSourceProvider,
  );
  return RecipeRepoImpl(
    remoteDataSource: remoteDataSource,
    localDataSource: localDataSource,
  );
}

final recipePageRequestProvider = StateProvider.autoDispose<PageRequestState>(
  (ref) => PageRequestState(),
);

final recipeListStreamProvider = StreamProvider.autoDispose<List<RecipeItem>>((
  ref,
) {
  final repo = ref.read(recipeRepositoryProvider);

  // WATCH the limit!
  // Whenever 'recipePageLimitProvider' updates, this entire provider re-runs.
  // Riverpod handles canceling the old Isar stream and starting the new one.
  final request = ref.watch(recipePageRequestProvider);
  return repo.getReceiptStream(pageIndex: request.page, filter: request.filter);
});
