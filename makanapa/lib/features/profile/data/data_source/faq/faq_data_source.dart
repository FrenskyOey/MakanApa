import 'package:makanapa/features/profile/data/models/entity/faq_isar_model.dart';
import 'package:makanapa/features/profile/data/models/response/faq_response.dart';
import 'package:makanapa/features/profile/domain/models/faq.dart';

abstract class FaqRemoteDataSource {
  Future<List<FaqResponse>> getFaqsData();
}

abstract class FaqLocalDataSource {
  // Retrieves the cached list of FAQs from Isar.
  Stream<List<FaqEntity>> getFaqsEntity();

  // Caches the list of FAQs in Isar.
  Future<void> cacheFaqs(List<Faq> faqs);
}
