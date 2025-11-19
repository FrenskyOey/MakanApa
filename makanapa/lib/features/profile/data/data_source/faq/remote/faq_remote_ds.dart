import 'package:dio/dio.dart';
import 'package:makanapa/features/profile/data/data_source/faq/faq_data_source.dart';
import 'package:makanapa/features/profile/data/models/response/faq_response.dart';

class FaqRemoteDs implements FaqRemoteDataSource {
  final Dio client;

  FaqRemoteDs({required this.client});

  @override
  Future<List<FaqResponse>> getFaqsData() async {
    // TODO: implement checkPassword
    throw UnimplementedError();
  }
}
