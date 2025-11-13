/*
import 'package:freezed_annotation/freezed_annotation.dart';

part 'template_response.freezed.dart';
part 'template_response.g.dart';

@freezed
abstract class TemplateResponse with _$TemplateResponse {
  const TemplateResponse._();

  const factory TemplateResponse({
    @Default('') String content
  }) = _TemplateResponse;

  // converting TemplateDTO object to Template entity
  Template toDomain() {
    return Template(content: content);
  }

  factory TemplateResponse.fromDomain(Template template) {
    return TemplateResponse(content: template.content);
  }

  factory TemplateResponse.fromJson(Map<String, dynamic> json) =>
      _$TemplateResponseFromJson(json);
}
*/
