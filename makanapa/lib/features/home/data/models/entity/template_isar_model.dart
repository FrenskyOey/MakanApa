/*
part 'template_isar_model.g.dart';

@collection
class TemplateIsarModel {
  Id id = Isar.autoIncrement;

  final String templateId;
  final String content;

  const TemplateIsarModel({
    required this.templateId,
    required this.content
  });

  factory TemplateIsarModel.fromEntity(Template template) {
    return TemplateIsarModel(
      templateId: template.chatId,
      content: template.content
    );
  }

    // converting TemplateDTO object to Template entity
  Template toDomain() {
    return Template(content: content);
  }


}
 */