// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_plan_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CreatePlanResponse _$CreatePlanResponseFromJson(Map<String, dynamic> json) =>
    _CreatePlanResponse(
      groupId: (json['group_id'] as num).toInt(),
      message: json['message'] as String,
    );

Map<String, dynamic> _$CreatePlanResponseToJson(_CreatePlanResponse instance) =>
    <String, dynamic>{
      'group_id': instance.groupId,
      'message': instance.message,
    };
