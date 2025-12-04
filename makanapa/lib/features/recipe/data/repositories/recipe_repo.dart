import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:makanapa/core/handlers/error/error_handler.dart';
import 'package:makanapa/features/recipe/data/data_source/recipe_data_source.dart';
import 'package:makanapa/features/recipe/domain/models/recipe_detail.dart';
import 'package:makanapa/features/recipe/domain/models/recipe_item.dart';
import 'package:makanapa/features/recipe/domain/models/recipe_page.dart';
import 'package:makanapa/features/recipe/domain/repositories/recipe_repository.dart';

class RecipeRepoImpl implements RecipeRepository {
  final RecipeRemoteDataSource remoteDataSource;
  final RecipeLocalDataSource localDataSource;

  final _searchStreamController =
      StreamController<List<RecipeItem>>.broadcast();

  RecipeRepoImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<Either<String, RecipePage>> getReceiptPage({
    required int pageIndex,
    String? filter,
  }) async {
    try {
      final indexData = await localDataSource.getRecipeIndexEntity(
        filter,
        pageIndex - 1,
      );
      final data = await remoteDataSource.getRecipeData(
        filter,
        indexData?.nextCursor,
      );
      final domainData = data.toDomain();
      await localDataSource.cacheRecipeList(filter, pageIndex, domainData);
      return Right(domainData);
    } catch (e, stackTrace) {
      final message = handleError(e, stackTrace);
      return Left(message);
    }
  }

  @override
  Future<RecipePage?> getLocalReceiptPage({
    required int pageIndex,
    String? filter,
  }) async {
    final indexData = await localDataSource.getRecipeIndexEntity(
      filter,
      pageIndex,
    );

    if (indexData == null) return null;

    final receiptId = indexData.recipeIds;
    final data = await localDataSource.getReceiptByReceiptId(receiptId);
    final domainData = data.map((e) => e.toDomain()).toList();

    return RecipePage(
      data: domainData,
      nextCursor: indexData.nextCursor ?? 0,
      limit: 25,
      dataCounter: indexData.dataCounter ?? 0,
    );
  }

  @override
  Stream<List<RecipeItem>> getReceiptStream({
    required int pageIndex,
    String? filter,
  }) {
    return localDataSource.getCachedRecipes(filter, pageIndex).asyncMap((
      indexEntity,
    ) async {
      // Fetch actual objects logic
      final allIds = indexEntity.expand((i) => i.recipeIds).toList();
      final pageData = await localDataSource.getReceiptByReceiptId(allIds);
      return pageData.map((data) {
        return data.toDomain();
      }).toList();
    });
  }

  @override
  Future<Either<String, void>> getRecipeDetail({required int recipeId}) async {
    try {
      final data = await remoteDataSource.fetchRecipeDetail(recipeId);
      final domainData = data.toDomain();
      await localDataSource.cacheRecipeDetail(recipeId, domainData);
      return Right(null);
    } catch (e, stackTrace) {
      final message = handleError(e, stackTrace);
      return Left(message);
    }
  }

  @override
  Stream<RecipeDetail?> getRecipeDetailStream({required int recipeId}) {
    return localDataSource.getCachedRecipeDetail(recipeId).map((data) {
      return data?.toDomain();
    });
  }

  @override
  Stream<List<RecipeItem>> getSearchStream() {
    return _searchStreamController.stream;
  }

  @override
  Future<Either<String, List<RecipeItem>>> searchRecipes({
    required String query,
  }) async {
    try {
      final cacheData = await localDataSource.getCachedSearchResults(query);
      _searchStreamController.add(cacheData.map((e) => e.toDomain()).toList());
      final data = await remoteDataSource.searchRecipes(query);
      final domainData = data.map((element) => element.toDomain()).toList();
      _searchStreamController.add(domainData);
      await localDataSource.cacheRecipeItemList(domainData);
      return Right(domainData);
    } catch (e, stackTrace) {
      final message = handleError(e, stackTrace);
      return Left(message);
    }
  }

  @override
  Future<Either<String, void>> bookmarkRecipe({required int recipeId}) async {
    try {
      final data = await remoteDataSource.bookMarkRecipe(recipeId);
      final localEntity = await localDataSource.getReceiptDetail(recipeId);
      if (localEntity != null) {
        localEntity.recipe.isBookmarked = data == 'bookmarked';
        await localDataSource.cacheRecipeDetail(
          recipeId,
          localEntity.toDomain(),
        );
      }
      return Right(null);
    } catch (e, stackTrace) {
      final message = handleError(e, stackTrace);
      return Left(message);
    }
  }
}
