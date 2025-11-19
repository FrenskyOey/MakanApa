import 'package:freezed_annotation/freezed_annotation.dart';
part 'change_password_event_state.freezed.dart';

@freezed
class ChangePasswordEventState with _$ChangePasswordEventState {
  // handling toast Event
  const factory ChangePasswordEventState.initial() = _Intial;
  const factory ChangePasswordEventState.toastError(String message) =
      _ToastError;
  const factory ChangePasswordEventState.showLogoutDialog() = _ShowLogoutDialog;
}
