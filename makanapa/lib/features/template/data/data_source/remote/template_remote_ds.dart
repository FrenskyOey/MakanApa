/*
import 'package:dio/dio.dart';

class TemplateRemoteDS implements TemplateRemoteDataSource {
  final Dio dio;

  TemplateRemoteDataSourceImpl({required this.dio});
  // get list
  @override
  Future<List<TemplateResponse>> getTemplateList() async {
     final response = await dio.get('/api/xxxxxx');
      final rawData = response.data;
      // 3. Map each item in the list to a SoldierResponse object
      final TemplateResponse templates = rawData
          .cast<Map<String, dynamic>>() // Cast Item to Map<String, dynamic>
          .map(TemplateResponse.fromJson);  // Use the generated fromJson factory
      return templates;
  }

  // get object
   @override
  Future<TemplateResponse> getTemplateObject() async {
      final response = await dio.get('/api/xxxxxx/xxxxx');
      final rawData = response.data;
      return TemplateResponse.fromJson(rawData['data']);
  }
}

*/
