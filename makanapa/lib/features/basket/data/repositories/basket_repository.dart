import 'package:dartz/dartz.dart';
import 'package:makanapa/features/basket/data/data_source/basket_data_source.dart';
import 'package:makanapa/features/basket/domain/models/basket_group.dart';
import 'package:makanapa/features/basket/domain/models/basket_option.dart';
import 'package:makanapa/features/basket/domain/repositories/basket_repository.dart';
import 'package:makanapa/features/recipe/domain/models/ingredient_enum.dart';

class BasketRepo implements BasketRepository {
  final BasketRemoteDataSource remoteDataSource;
  final BasketLocalDataSource localDataSource;

  BasketRepo({required this.remoteDataSource, required this.localDataSource});

  @override
  Stream<BasketGroup> getBasketData({
    required int groupId,
    required IngredientEnum type,
  }) {
    return localDataSource.getBasketStream(groupId: groupId, type: type).map((
      items,
    ) {
      return BasketGroup(
        type: type.description,
        data: items.map((e) => e.toDomain()).toList(),
      );
    });
  }

  @override
  Stream<BasketSummary> getIngredientOption() {
    return localDataSource.getIngredientsDashboard().map((event) {
      if (event == null) {
        return const BasketSummary(currentGroup: null, upcomingGroup: []);
      }
      return event.toDomain();
    });
  }

  @override
  Future<Either<String, void>> updateMark({
    required int groupId,
    required int ingredientId,
    required bool isMarked,
  }) async {
    try {
      await localDataSource.markIngredients(groupId, ingredientId, isMarked);
      return const Right(null);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, BasketSummary>> getIngredientsSummary() async {
    try {
      final response = await remoteDataSource.getIngredientMainData();
      await localDataSource.cacheIngredientMainData(response);
      return Right(response.toDomain());
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, void>> getIngridientData({required int groupId}) async {
    try {
      final response = await remoteDataSource.getIngredientByGroupId(groupId);
      await localDataSource.cacheIngredientGroupData(response);
      return const Right(null);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
