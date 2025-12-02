// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ingredients_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_IngredientsResponse _$IngredientsResponseFromJson(Map<String, dynamic> json) =>
    _IngredientsResponse(
      id: (json['id'] as num?)?.toInt() ?? 0,
      name: json['name'] as String? ?? '',
      types: json['bahantype'] as String? ?? '',
      unitType: json['unittype'] as String? ?? '',
      quantity: (json['qty'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$IngredientsResponseToJson(
  _IngredientsResponse instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'bahantype': instance.types,
  'unittype': instance.unitType,
  'qty': instance.quantity,
};
