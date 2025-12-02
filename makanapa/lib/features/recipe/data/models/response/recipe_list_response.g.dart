// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RecipeListResponse _$RecipeListResponseFromJson(Map<String, dynamic> json) =>
    _RecipeListResponse(
      items:
          (json['resep_list'] as List<dynamic>?)
              ?.map((e) => RecipeResponse.fromJson(e as Map<String, dynamic>))
              .toList() ??
          List.empty(),
      nextCursors: (json['next_cursor'] as num?)?.toInt() ?? 0,
      limits: (json['limit'] as num?)?.toInt() ?? 25,
      dataCounters: (json['next_data_counter'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$RecipeListResponseToJson(_RecipeListResponse instance) =>
    <String, dynamic>{
      'resep_list': instance.items,
      'next_cursor': instance.nextCursors,
      'limit': instance.limits,
      'next_data_counter': instance.dataCounters,
    };
