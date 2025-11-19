import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:makanapa/features/onboarding/domain/models/user.dart';
part 'profile_event_state.freezed.dart';

@freezed
class ProfileEventState with _$ProfileEventState {
  // handling toast Event
  const factory ProfileEventState.initial() = _Initial;
  const factory ProfileEventState.openEditProfile(UserData data) =
      _OpenEditProfile;
  const factory ProfileEventState.openChangePassword() = _OpenChangePassword;
  const factory ProfileEventState.openAboutUs() = _OpenAboutUs;
  const factory ProfileEventState.logout() = _LogOut;
}
