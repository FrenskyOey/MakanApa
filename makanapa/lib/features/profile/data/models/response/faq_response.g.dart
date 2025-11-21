// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'faq_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FaqResponse _$FaqResponseFromJson(Map<String, dynamic> json) => _FaqResponse(
  id: (json['id'] as num?)?.toInt() ?? 0,
  title: json['question'] as String? ?? '',
  content: json['answer'] as String? ?? '',
);

Map<String, dynamic> _$FaqResponseToJson(_FaqResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'question': instance.title,
      'answer': instance.content,
    };
