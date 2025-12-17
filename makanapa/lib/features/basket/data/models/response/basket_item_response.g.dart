// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'basket_item_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BasketItemResponse _$BasketItemResponseFromJson(Map<String, dynamic> json) =>
    _BasketItemResponse(
      id: (json['id'] as num?)?.toInt() ?? 0,
      name: json['name'] as String? ?? '',
      unit: json['unit'] as String? ?? '',
      quantity: json['quantity'] as num? ?? 0,
    );

Map<String, dynamic> _$BasketItemResponseToJson(_BasketItemResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'unit': instance.unit,
      'quantity': instance.quantity,
    };
