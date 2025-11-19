import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:makanapa/features/profile/domain/models/faq.dart';

part 'faq_response.freezed.dart';
part 'faq_response.g.dart';

@freezed
abstract class FaqResponse with _$FaqResponse {
  const FaqResponse._();

  const factory FaqResponse({
    @JsonKey(name: 'id', defaultValue: '') required String id,
    @JsonKey(name: 'title', defaultValue: '') required String title,
    @JsonKey(name: 'content', defaultValue: '') required String content,
  }) = _FaqResponse;

  /// Converts the [FaqResponse] DTO to a [Faq] domain entity.
  Faq toDomain() {
    return Faq(id: id, question: title, answer: content);
  }

  factory FaqResponse.fromJson(Map<String, dynamic> json) =>
      _$FaqResponseFromJson(json);
}
