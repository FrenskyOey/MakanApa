// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DashboardResponse _$DashboardResponseFromJson(Map<String, dynamic> json) =>
    _DashboardResponse(
      currentWeekPlan: json['current_week_plant'] == null
          ? null
          : WeeklyPlanResponse.fromJson(
              json['current_week_plant'] as Map<String, dynamic>,
            ),
      upcomingPlans:
          (json['upcoming_plan'] as List<dynamic>?)
              ?.map(
                (e) => UpcomingPlanResponse.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          [],
      availablePlans:
          (json['avaible_plan'] as List<dynamic>?)
              ?.map(
                (e) =>
                    AvailablePlanResponse.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          [],
    );

Map<String, dynamic> _$DashboardResponseToJson(_DashboardResponse instance) =>
    <String, dynamic>{
      'current_week_plant': instance.currentWeekPlan,
      'upcoming_plan': instance.upcomingPlans,
      'avaible_plan': instance.availablePlans,
    };

_UpcomingPlanResponse _$UpcomingPlanResponseFromJson(
  Map<String, dynamic> json,
) => _UpcomingPlanResponse(
  groupId: (json['group_id'] as num).toInt(),
  startDate: json['start_date'] as String,
);

Map<String, dynamic> _$UpcomingPlanResponseToJson(
  _UpcomingPlanResponse instance,
) => <String, dynamic>{
  'group_id': instance.groupId,
  'start_date': instance.startDate,
};

_AvailablePlanResponse _$AvailablePlanResponseFromJson(
  Map<String, dynamic> json,
) => _AvailablePlanResponse(startDate: json['start_date'] as String);

Map<String, dynamic> _$AvailablePlanResponseToJson(
  _AvailablePlanResponse instance,
) => <String, dynamic>{'start_date': instance.startDate};
