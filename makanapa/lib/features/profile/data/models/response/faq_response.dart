import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:makanapa/features/profile/domain/models/faq.dart';

part 'faq_response.freezed.dart';
part 'faq_response.g.dart';

@freezed
abstract class FaqResponse with _$FaqResponse {
  const FaqResponse._();

  const factory FaqResponse({
    @JsonKey(name: 'id', defaultValue: 0) required int id,
    @JsonKey(name: 'question', defaultValue: '') required String title,
    @JsonKey(name: 'answer', defaultValue: '') required String content,
  }) = _FaqResponse;

  Faq toDomain() {
    return Faq(id: id.toString(), question: title, answer: content);
  }

  factory FaqResponse.fromJson(Map<String, dynamic> json) =>
      _$FaqResponseFromJson(json);
}
