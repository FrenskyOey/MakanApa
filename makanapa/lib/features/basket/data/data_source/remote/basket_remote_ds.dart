import 'package:dio/dio.dart';
import 'package:makanapa/features/basket/data/data_source/basket_data_source.dart';
import 'package:makanapa/features/basket/data/models/response/basket_dashboard_response.dart';
import 'package:makanapa/features/basket/data/models/response/basket_summary_response.dart';

class BasketRemoteDs implements BasketRemoteDataSource {
  final Dio dio;

  BasketRemoteDs({required this.dio});
  @override
  Future<BasketSummaryResponse> getIngredientByGroupId(int groupId) async {
    final response = await dio.post(
      '/v1/ingredients-summary',
      data: {'group_id': groupId},
    );
    return BasketSummaryResponse.fromJson(response.data['data']);
  }

  @override
  Future<BasketDashboardResponse> getIngredientMainData() async {
    final response = await dio.get('/v1/ingredients-dashboard');
    return BasketDashboardResponse.fromJson(response.data['data']);
  }
}
