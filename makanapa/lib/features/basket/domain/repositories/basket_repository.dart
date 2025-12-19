import 'package:dartz/dartz.dart';
import 'package:makanapa/features/basket/domain/models/basket_group.dart';
import 'package:makanapa/features/basket/domain/models/basket_option.dart';
import 'package:makanapa/features/recipe/domain/models/ingredient_enum.dart';

abstract class BasketRepository {
  Future<Either<String, BasketSummary>> getIngredientsSummary();

  Stream<BasketSummary> getIngredientOption();

  Stream<BasketGroup> getBasketData({
    required int groupId,
    required IngredientEnum type,
  });

  Future<Either<String, void>> getIngridientData({required int groupId});

  Future<Either<String, void>> updateMark({
    required int groupId,
    required int ingredientId,
    required bool isMarked,
  });
}
