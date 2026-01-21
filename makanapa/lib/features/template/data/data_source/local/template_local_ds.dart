/*
import 'package:isar_community/isar.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'template_local_ds.g.dart';

class TemplateLocalDS implements TemplateLocalDataSource {
  final Isar isar;
  TemplateLocalDataSourceImpl({required this.isar});

  @override
   Future<List<TemplateEntity>> getTemplate() async {
    final result = await isar
    .templateIsarModel
    .where()
    .sortByDataId()
    //.limit(10)
    .findAll();
    return result;
  }

  @override
  Future<void> saveTemplate(Template template) async {
    isar.writeTxn(() async {
      await isar.templateIsarModel.put(TemplateIsarModel.fromEntity(template));
    });
  }

  @override
  Future<void> saveTemplate(List<Template> templates) {
    final templateEntity = faqs.map((template) {
      return TemplateIsarModel.fromEntity(template);
    }).toList();

    return isar.writeTxn(() async {
      // Use putAllByIndex to perform an upsert based on the 'dataId' index.
      await isar.templateIsarModel.putAllByDataId(templateEntity);
    });
  }
}



 */
