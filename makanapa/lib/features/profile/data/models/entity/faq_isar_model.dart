import 'package:isar_community/isar.dart';
import 'package:makanapa/features/profile/domain/models/faq.dart';

part 'faq_isar_model.g.dart';

@collection
class FaqEntity {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  late String dataId;

  late String title;
  late String content;

  /// Creates an empty [FaqEntity] for Isar.
  FaqEntity();

  /// Creates a [FaqEntity] from a [Faq] domain model.
  factory FaqEntity.fromEntity(Faq faq) {
    return FaqEntity()
      ..dataId = faq.id
      ..title = faq.question
      ..content = faq.answer;
  }

  /// Converts the [FaqEntity] to a [Faq] domain model.
  Faq toDomain() {
    return Faq(id: dataId, question: title, answer: content);
  }
}
