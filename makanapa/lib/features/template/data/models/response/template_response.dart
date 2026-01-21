/*
import 'package:freezed_annotation/freezed_annotation.dart';

part 'template_response.freezed.dart';
part 'template_response.g.dart';


@freezed
abstract class TemplateResponse with _$TemplateResponse {
  const TemplateResponse._();

  const factory TemplateResponse({
    @JsonKey(name: 'id', defaultValue: 0) required int id,
    @JsonKey(name: 'content', defaultValue: '') required String content
  }) = _TemplateResponse;

  Template toDomain() {
    return Template(
      id: id,
      content: content
    );
  }

  factory TemplateResponse.fromJson(Map<String, dynamic> json) =>
      _$TemplateResponseFromJson(json);
}
*/
