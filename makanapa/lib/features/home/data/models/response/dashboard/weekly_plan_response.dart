import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:makanapa/features/home/data/models/response/dashboard/daily_meal_response.dart';
import 'package:makanapa/features/home/domain/models/weekly_plan.dart';

part 'weekly_plan_response.freezed.dart';
part 'weekly_plan_response.g.dart';

@freezed
abstract class WeeklyPlanResponse with _$WeeklyPlanResponse {
  const factory WeeklyPlanResponse({
    @JsonKey(name: 'group_id') required int groupId,
    @JsonKey(name: 'start_date') required String startDate,
    @JsonKey(name: 'end_date') required String endDate,
    @JsonKey(name: 'meal_plan', defaultValue: [])
    required List<DailyMealResponse> mealPlan,
  }) = _WeeklyPlanResponse;

  WeeklyPlan toDomain() {
    return WeeklyPlan(
      groupId: groupId,
      startDate: parseDate(startDate),
      endDate: parseDate(endDate),
      meals: mealPlan.map((e) => e.toDomain()).toList(),
    );
  }

  factory WeeklyPlanResponse.fromJson(Map<String, dynamic> json) =>
      _$WeeklyPlanResponseFromJson(json);
}
