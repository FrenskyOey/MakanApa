import 'package:isar_community/isar.dart';
import 'package:makanapa/features/home/domain/models/dashboard.dart';
import 'package:makanapa/features/home/domain/models/weekly_plan.dart';

part 'weekly_detail_isar_model.g.dart';

@collection
class WeeklyDetailEntity {
  Id id = Isar.autoIncrement;

  late String content;

  /// Creates an empty [RecipeEntity] for Isar.
  WeeklyDetailEntity();

  factory WeeklyDetailEntity.fromEntity(Dashboard dashboard) {
    return WeeklyDetailEntity()..content = "";
  }

  // converting TemplateDTO object to Template entity
  WeeklyPlan toDomain() {
    throw UnimplementedError();
  }
}
