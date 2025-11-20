import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:makanapa/features/onboarding/domain/models/user.dart';
part 'profile_edit_event_state.freezed.dart';

@freezed
class ProfileEditEventState with _$ProfileEditEventState {
  // handling toast Event
  const factory ProfileEditEventState.initial() = _Initial;
  const factory ProfileEditEventState.toastError(String messgae) = _ToastError;
  const factory ProfileEditEventState.successUpdate(UserData user) =
      _SuccessUpdate;

  // handling open detail page
  const factory ProfileEditEventState.openGallery() = _OpenGallery;
}
