import 'package:makanapa/features/onboarding/domain/models/user.dart';
import 'package:makanapa/features/profile/presentation/profileSetting/controllers/state/profile_event_state.dart';

class ProfileUIState {
  final UserData? userData;
  final ProfileEventState eventState;
  final bool showLoading;

  const ProfileUIState({
    this.userData,
    this.eventState = const ProfileEventState.initial(),
    this.showLoading = false,
  });

  ProfileUIState copyWith({
    bool? hideLoading,
    UserData? userData,
    ProfileEventState? eventState,
    bool? showLoading,
  }) {
    return ProfileUIState(
      userData: userData ?? this.userData,
      eventState: eventState ?? this.eventState,
      showLoading: showLoading ?? this.showLoading,
    );
  }
}
