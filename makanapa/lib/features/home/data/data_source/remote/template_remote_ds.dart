/*

import 'package:dio/dio.dart';

class TemplateRemoteDataSourceImpl implements TemplateRemoteDataSource {
  final Dio dio;

  TemplateRemoteDataSourceImpl({required this.dio});
  @override
  Future<TemplateResponse> getTemplate() async {
     try {
      final response = await dio.get('/api/xxxxxx');
      final rawData = response.data;
      // 3. Map each item in the list to a SoldierResponse object
      final TemplateResponse templates = rawData
          .cast<Map<String, dynamic>>() // Castitem to Map<String, dynamic>
          .map(TemplateResponse.fromJson);  // Use the generated fromJson factory
      return templates;
     }catch (e) {
      rethrow;
    }
  }
}

 */
