// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'basket_summary_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BasketSummaryResponse _$BasketSummaryResponseFromJson(
  Map<String, dynamic> json,
) => _BasketSummaryResponse(
  groupId: (json['group_id'] as num).toInt(),
  startDate: json['start_date'] as String,
  ingredients: BasketIngredientsResponse.fromJson(
    json['bahan'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$BasketSummaryResponseToJson(
  _BasketSummaryResponse instance,
) => <String, dynamic>{
  'group_id': instance.groupId,
  'start_date': instance.startDate,
  'bahan': instance.ingredients,
};
