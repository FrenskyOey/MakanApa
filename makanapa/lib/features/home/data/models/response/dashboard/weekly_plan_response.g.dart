// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weekly_plan_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WeeklyPlanResponse _$WeeklyPlanResponseFromJson(Map<String, dynamic> json) =>
    _WeeklyPlanResponse(
      groupId: (json['group_id'] as num?)?.toInt() ?? 0,
      startDate: json['start_date'] as String? ?? '',
      endDate: json['end_date'] as String? ?? '',
      mealPlan:
          (json['meal_plan'] as List<dynamic>?)
              ?.map(
                (e) => DailyMealResponse.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          [],
    );

Map<String, dynamic> _$WeeklyPlanResponseToJson(_WeeklyPlanResponse instance) =>
    <String, dynamic>{
      'group_id': instance.groupId,
      'start_date': instance.startDate,
      'end_date': instance.endDate,
      'meal_plan': instance.mealPlan,
    };
