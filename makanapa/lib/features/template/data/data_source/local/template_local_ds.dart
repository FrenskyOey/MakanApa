/*
import 'package:isar_community/isar.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'template_local_ds.g.dart';

class TemplateLocalDataSourceImpl implements TemplateLocalDataSource {
  final Isar isar;
  TemplateLocalDataSourceImpl({required this.isar});
  @override
   Future<TemplateEntity> getTemplate(); async {
    try {
      final isOpen = isar.isOpen;
      if (!isOpen) {
        return [];
      }
      final result = await isar.writeTxn(() async {
        return await isar.templateIsarModel.where().findAll();
      });
      return messages.get(0);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> saveTemplate(Template template) async {
    try {
      final isOpen = isar.isOpen;
      if (!isOpen) {
        return;
      }

      await isar.writeTxn(() async {
        await isar.templateIsarModel
            .put(TemplateIsarModel.fromEntity(template));
      });
    } catch (e) {
      rethrow;
    }
  }
}



 */