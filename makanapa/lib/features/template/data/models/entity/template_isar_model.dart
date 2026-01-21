/*
import 'package:isar_community/isar.dart';

part 'template_isar_model.g.dart';

@collection
class TemplateIsarModel {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  late int templateId;
  late String content;

  /// Creates an empty [RecipeEntity] for Isar.
  TemplateIsarModel();

  factory TemplateIsarModel.fromEntity(Template template) {
    return TemplateIsarModel()
      ..templateId = template.id
      ..content = template.content;
  }

  // converting TemplateDTO object to Template entity
  Template toDomain() {
    return Template(
      id:templateId,
      content: content
    );
  }
}
 */
