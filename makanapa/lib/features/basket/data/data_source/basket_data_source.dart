import 'package:makanapa/features/basket/data/models/entity/basket_group_isar_model.dart';
import 'package:makanapa/features/basket/data/models/entity/basket_item_isar_model.dart';
import 'package:makanapa/features/basket/data/models/response/basket_dashboard_response.dart';
import 'package:makanapa/features/basket/data/models/response/basket_summary_response.dart';
import 'package:makanapa/features/recipe/domain/models/ingredient_enum.dart';

abstract class BasketRemoteDataSource {
  Future<BasketDashboardResponse> getIngredientMainData();
  Future<BasketSummaryResponse> getIngredientByGroupId(int groupId);
}

abstract class BasketLocalDataSource {
  Future<void> cacheIngredientMainData(BasketDashboardResponse response);
  Future<void> cacheIngredientGroupData(BasketSummaryResponse response);
  Stream<BasketItemEntity?> getBasketStream({
    required int groupId,
    IngredientEnum? type,
  });
  Stream<BasketGroupEntity?> getIngredientsDashboard();
  Future<void> markIngredients(int groupId, int ingredientId, bool isMarked);
}
