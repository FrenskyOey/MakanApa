import 'package:freezed_annotation/freezed_annotation.dart';
part 'signup_event_state.freezed.dart';

@freezed
class SignUpEventState with _$SignUpEventState {
  // handling toast Event
  const factory SignUpEventState.initial() = _Initial;
  const factory SignUpEventState.showLoading() = _ShowLoading;
  const factory SignUpEventState.toastError(String messgae) = _ToastError;
  const factory SignUpEventState.toHomePage() = _ToHomePage;
  const factory SignUpEventState.backPress() = _BackPress;
}
