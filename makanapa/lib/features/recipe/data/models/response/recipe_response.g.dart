// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RecipeResponse _$RecipeResponseFromJson(Map<String, dynamic> json) =>
    _RecipeResponse(
      id: (json['id'] as num?)?.toInt() ?? 0,
      name: json['name'] as String? ?? '',
      enName: json['en_name'] as String? ?? '',
      resepType: json['reseptype'] as String? ?? '',
      classType: json['classtype'] as String? ?? '',
      picture: json['picture'] as String? ?? '',
      isBookmark: json['is_bookmarked'] as bool? ?? false,
      urlLinks: json['steps_link'] as String?,
    );

Map<String, dynamic> _$RecipeResponseToJson(_RecipeResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'en_name': instance.enName,
      'reseptype': instance.resepType,
      'classtype': instance.classType,
      'picture': instance.picture,
      'is_bookmarked': instance.isBookmark,
      'steps_link': instance.urlLinks,
    };
