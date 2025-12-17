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
    IngredientEnum? type,
  }) {
    throw UnimplementedError();
  }

  @override
  Stream<BasketSummary> getIngredientOption() {
    throw UnimplementedError();
  }

  @override
  Future<Either<String, BasketSummary>> getIngredientsSummary() {
    throw UnimplementedError();
  }

  @override
  Future<Either<String, void>> getIngridientData({required int groupId}) {
    throw UnimplementedError();
  }

  @override
  Future<Either<String, void>> updateMark({
    required int groupId,
    required int ingredientId,
    required bool isMarked,
  }) {
    throw UnimplementedError();
  }
}
