import 'package:isar_community/isar.dart';
import 'package:makanapa/features/profile/data/data_source/faq/faq_data_source.dart';
import 'package:makanapa/features/profile/data/models/entity/faq_isar_model.dart';
import 'package:makanapa/features/profile/domain/models/faq.dart';

class FaqLocalDs implements FaqLocalDataSource {
  final Isar isar;

  FaqLocalDs({required this.isar});

  @override
  Future<void> cacheFaqs(List<Faq> faqs) {
    // TODO: implement cacheFaqs
    throw UnimplementedError();
  }

  @override
  Stream<List<FaqEntity>> getFaqsEntity() {
    // TODO: implement getFaqsEntity
    throw UnimplementedError();
  }
}
