import 'package:dio/dio.dart';
import 'package:makanapa/features/profile/data/data_source/faq/faq_data_source.dart';
import 'package:makanapa/features/profile/data/models/response/faq_response.dart';

class FaqRemoteDs implements FaqRemoteDataSource {
  final Dio client;

  FaqRemoteDs({required this.client});

  @override
  Future<List<FaqResponse>> getFaqsData() async {
    try {
      final response = await client.get('/v1/faq_data');
      final Map<String, dynamic> rawData = response.data;
      final List<dynamic> rawList = rawData['data'];
      final List<FaqResponse> faqData = rawList
          .cast<Map<String, dynamic>>()
          .map(FaqResponse.fromJson)
          .toList();
      return faqData;
    } catch (e) {
      rethrow;
    }
  }
}
