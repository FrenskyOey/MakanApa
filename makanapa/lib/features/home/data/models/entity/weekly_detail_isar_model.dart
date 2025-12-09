import 'package:isar_community/isar.dart';
import 'package:makanapa/features/home/data/models/entity/daily_meal_embed.dart';
import 'package:makanapa/features/home/domain/models/weekly_plan.dart';

part 'weekly_detail_isar_model.g.dart';

@collection
class WeeklyDetailEntity {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  late int groupId;
  late DateTime startDate;
  late DateTime endDate;
  late List<DailyMealEmbed> meals;

  WeeklyDetailEntity();

  factory WeeklyDetailEntity.fromEntity(WeeklyPlan entity) {
    return WeeklyDetailEntity()
      ..groupId = entity.groupId
      ..startDate = entity.startDate
      ..endDate = entity.endDate
      ..meals = entity.meals.map((e) => DailyMealEmbed.fromEntity(e)).toList();
  }

  WeeklyPlan toDomain() {
    return WeeklyPlan(
      groupId: groupId,
      startDate: startDate,
      endDate: endDate,
      meals: meals.map((e) => e.toDomain()).toList(),
    );
  }
}
