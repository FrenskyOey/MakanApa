import 'package:isar_community/isar.dart';
import 'package:makanapa/features/profile/data/data_source/faq/faq_data_source.dart';
import 'package:makanapa/features/profile/data/models/entity/faq_isar_model.dart';
import 'package:makanapa/features/profile/domain/models/faq.dart';

class FaqLocalDs implements FaqLocalDataSource {
  final Isar isar;

  FaqLocalDs({required this.isar});

  @override
  Future<void> cacheFaqs(List<Faq> faqs) {
    final faqEntities = faqs.map((faq) {
      return FaqEntity.fromEntity(faq);
    }).toList();

    return isar.writeTxn(() async {
      // Use putAllByIndex to perform an upsert based on the 'dataId' index.
      await isar.faqEntitys.putAllByDataId(faqEntities);
    });
  }

  @override
  Stream<List<FaqEntity>> getFaqsEntity() {
    // Build a query that sorts the results by the 'dataId' field in ascending order.
    final query = isar.faqEntitys.where().sortByDataId();
    // Watch the query for changes and fire immediately with the current results.
    return query.watch(fireImmediately: true);
  }
}
