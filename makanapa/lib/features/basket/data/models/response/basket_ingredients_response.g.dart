// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'basket_ingredients_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BasketIngredientsResponse _$BasketIngredientsResponseFromJson(
  Map<String, dynamic> json,
) => _BasketIngredientsResponse(
  vegetables:
      (json['veg'] as List<dynamic>?)
          ?.map((e) => BasketItemResponse.fromJson(e as Map<String, dynamic>))
          .toList() ??
      [],
  meats:
      (json['mea'] as List<dynamic>?)
          ?.map((e) => BasketItemResponse.fromJson(e as Map<String, dynamic>))
          .toList() ??
      [],
  others:
      (json['oth'] as List<dynamic>?)
          ?.map((e) => BasketItemResponse.fromJson(e as Map<String, dynamic>))
          .toList() ??
      [],
);

Map<String, dynamic> _$BasketIngredientsResponseToJson(
  _BasketIngredientsResponse instance,
) => <String, dynamic>{
  'veg': instance.vegetables,
  'mea': instance.meats,
  'oth': instance.others,
};
