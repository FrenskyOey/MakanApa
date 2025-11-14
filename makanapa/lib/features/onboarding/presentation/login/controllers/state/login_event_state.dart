import 'package:freezed_annotation/freezed_annotation.dart';
part 'login_event_state.freezed.dart';

@freezed
class LoginEventState with _$LoginEventState {
  // handling toast Event
  const factory LoginEventState.initial() = _Initial;
  const factory LoginEventState.showLoading() = _ShowLoading;
  const factory LoginEventState.toastError(String messgae) = _ToastError;
  const factory LoginEventState.toHomePage() = _ToHomePage;
  const factory LoginEventState.toSignUpPage() = _ToSignUpPage;
}
