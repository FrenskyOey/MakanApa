import 'package:isar_community/isar.dart';
import 'package:makanapa/features/basket/data/data_source/basket_data_source.dart';
import 'package:makanapa/features/basket/data/models/entity/basket_group_isar_model.dart';
import 'package:makanapa/features/basket/data/models/entity/basket_item_isar_model.dart';
import 'package:makanapa/features/basket/data/models/response/basket_dashboard_response.dart';
import 'package:makanapa/features/basket/data/models/response/basket_summary_response.dart';
import 'package:makanapa/features/recipe/domain/models/ingredient_enum.dart';

class BasketLocalDs implements BasketLocalDataSource {
  final Isar isar;

  BasketLocalDs({required this.isar});

  @override
  Future<void> cacheIngredientGroupData(BasketSummaryResponse response) {
    throw UnimplementedError();
  }

  @override
  Future<void> cacheIngredientMainData(BasketDashboardResponse response) {
    throw UnimplementedError();
  }

  @override
  Stream<BasketItemEntity?> getBasketStream({
    required int groupId,
    IngredientEnum? type,
  }) {
    throw UnimplementedError();
  }

  @override
  Stream<BasketGroupEntity?> getIngredientsDashboard() {
    throw UnimplementedError();
  }

  @override
  Future<void> markIngredients(int groupId, int ingredientId, bool isMarked) {
    throw UnimplementedError();
  }
}
