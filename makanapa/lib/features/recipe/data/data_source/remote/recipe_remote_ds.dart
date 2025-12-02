import 'package:dio/dio.dart';
import 'package:makanapa/features/recipe/data/data_source/recipe_data_source.dart';
import 'package:makanapa/features/recipe/data/models/response/recipe_detail_response.dart';
import 'package:makanapa/features/recipe/data/models/response/recipe_list_response.dart';
import 'package:makanapa/features/recipe/data/models/response/recipe_response.dart';

class RecipeRemoteDs implements RecipeRemoteDataSource {
  final Dio client;

  RecipeRemoteDs({required this.client});

  @override
  Future<RecipeListResponse> getRecipeData(
    String filterHash,
    int cursorId,
  ) async {
    try {
      final response = await client.post(
        '/v1/resep_list',
        data: {'cursor_id': cursorId, 'classType': filterHash},
      );
      final Map<String, dynamic> rawData = response.data;
      final dynamic data = rawData['data'];
      final RecipeListResponse results = data.map(RecipeListResponse.fromJson);
      return results;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<RecipeDetailResponse> fetchRecipeDetail(int resepId) async {
    try {
      final response = await client.post(
        '/v1/fetch-resep-detail',
        data: {'resep_id': resepId},
      );
      final Map<String, dynamic> rawData = response.data;
      final dynamic data = rawData['data'];
      final RecipeDetailResponse results = data.map(
        RecipeDetailResponse.fromJson,
      );
      return results;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<RecipeResponse>> searchRecipes(String query) async {
    try {
      final response = await client.post(
        '/v1/search-resep',
        data: {'resep_query': query},
      );
      final Map<String, dynamic> rawData = response.data;
      final List<dynamic> rawList = rawData['data'];
      final List<RecipeResponse> searchData = rawList
          .cast<Map<String, dynamic>>()
          .map(RecipeResponse.fromJson)
          .toList();
      return searchData;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<String> bookMarkRecipe(int recipeId, bool state) {
    throw UnimplementedError();
  }
}
