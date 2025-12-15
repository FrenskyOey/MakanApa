// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_meal_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DailyMealResponse _$DailyMealResponseFromJson(Map<String, dynamic> json) =>
    _DailyMealResponse(
      date: json['date'] as String? ?? '',
      lunch: json['lunch'] == null
          ? null
          : RecipeResponse.fromJson(json['lunch'] as Map<String, dynamic>),
      dinner: json['dinner'] == null
          ? null
          : RecipeResponse.fromJson(json['dinner'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DailyMealResponseToJson(_DailyMealResponse instance) =>
    <String, dynamic>{
      'date': instance.date,
      'lunch': instance.lunch,
      'dinner': instance.dinner,
    };
