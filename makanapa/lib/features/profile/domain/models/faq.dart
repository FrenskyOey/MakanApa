import 'package:freezed_annotation/freezed_annotation.dart';

part 'faq.freezed.dart';

@freezed
abstract class Faq with _$Faq {
  const factory Faq({
    @Default("") String id,
    @Default("") String question,
    @Default("") String answer,
  }) = _Faq;
}
