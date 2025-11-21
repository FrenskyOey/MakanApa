import 'package:freezed_annotation/freezed_annotation.dart';
part 'faq_event_state.freezed.dart';

@freezed
class FaqEventState with _$FaqEventState {
  // handling toast Event
  const factory FaqEventState.initial() = _Intial;
  const factory FaqEventState.toastError(String messgae) = _ToastError;
  const factory FaqEventState.showLoading() = _ShowLoading;
}
