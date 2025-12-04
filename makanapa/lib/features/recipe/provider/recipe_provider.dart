import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar_community/isar.dart';
import 'package:makanapa/features/recipe/data/data_source/local/recipe_local_ds.dart';
import 'package:makanapa/features/recipe/data/data_source/recipe_data_source.dart';
import 'package:makanapa/features/recipe/data/data_source/remote/recipe_remote_ds.dart';
import 'package:makanapa/features/recipe/data/repositories/recipe_repo.dart';
import 'package:makanapa/features/recipe/domain/repositories/recipe_repository.dart';
import 'package:makanapa/features/recipe/presentation/detail/controllers/detail_bloc_controller.dart';
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

// provide bloc controller using riverpod
final detailBlocProvider = Provider.autoDispose<DetailBloc>((ref) {
  final repository = ref.watch(recipeRepositoryProvider);
  final bloc = DetailBloc(repository: repository);
  ref.onDispose(() => bloc.close());
  return bloc;
});
