// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'faq_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FaqResponse _$FaqResponseFromJson(Map<String, dynamic> json) => _FaqResponse(
  id: json['id'] as String? ?? '',
  title: json['title'] as String? ?? '',
  content: json['content'] as String? ?? '',
);

Map<String, dynamic> _$FaqResponseToJson(_FaqResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'content': instance.content,
    };
