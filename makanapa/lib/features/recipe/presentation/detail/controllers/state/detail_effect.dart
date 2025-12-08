import 'package:freezed_annotation/freezed_annotation.dart';
part 'detail_effect.freezed.dart';

@freezed
class DetailEffect with _$DetailEffect {
  const factory DetailEffect.toastError(String messgae) = _ToastError;
  const factory DetailEffect.toastSuccess(String messgae) = _ToastSuccess;
  const factory DetailEffect.openUrlLink(String url) = _OpenUrlLink;
}
