import 'package:dio/dio.dart';
import 'package:makanapa/features/basket/data/data_source/basket_data_source.dart';
import 'package:makanapa/features/basket/data/models/response/basket_dashboard_response.dart';
import 'package:makanapa/features/basket/data/models/response/basket_summary_response.dart';

class BasketRemoteDs implements BasketRemoteDataSource {
  final Dio dio;

  BasketRemoteDs({required this.dio});

  @override
  Future<BasketSummaryResponse> getIngredientByGroupId(int groupId) {
    throw UnimplementedError();
  }

  @override
  Future<BasketDashboardResponse> getIngredientMainData() {
    throw UnimplementedError();
  }
}
