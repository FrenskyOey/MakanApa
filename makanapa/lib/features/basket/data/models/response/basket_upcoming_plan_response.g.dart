// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'basket_upcoming_plan_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BasketUpcomingPlanResponse _$BasketUpcomingPlanResponseFromJson(
  Map<String, dynamic> json,
) => _BasketUpcomingPlanResponse(
  groupId: (json['group_id'] as num).toInt(),
  startDate: json['start_date'] as String,
);

Map<String, dynamic> _$BasketUpcomingPlanResponseToJson(
  _BasketUpcomingPlanResponse instance,
) => <String, dynamic>{
  'group_id': instance.groupId,
  'start_date': instance.startDate,
};
