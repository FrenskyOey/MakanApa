// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bookmark_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BookmarkResponse _$BookmarkResponseFromJson(Map<String, dynamic> json) =>
    _BookmarkResponse(
      id: (json['recipe_id'] as num?)?.toInt() ?? 0,
      isBookmark: json['is_bookmarked'] as bool? ?? false,
      action: json['action_type'] as String? ?? '',
    );

Map<String, dynamic> _$BookmarkResponseToJson(_BookmarkResponse instance) =>
    <String, dynamic>{
      'recipe_id': instance.id,
      'is_bookmarked': instance.isBookmark,
      'action_type': instance.action,
    };
