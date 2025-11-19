import 'package:makanapa/features/onboarding/domain/models/user.dart';
import 'package:makanapa/features/profile/presentation/profileSetting/controllers/state/profile_event_state.dart';

class ProfileUIState {
  final UserData? userData;
  final String userType;
  final ProfileEventState eventState;
  final bool showLoading;

  const ProfileUIState({
    this.userData,
    this.userType = 'email',
    this.eventState = const ProfileEventState.initial(),
    this.showLoading = false,
  });

  ProfileUIState copyWith({
    bool? hideLoading,
    String? userType,
    UserData? userData,
    ProfileEventState? eventState,
    bool? showLoading,
  }) {
    return ProfileUIState(
      userType: userType ?? this.userType,
      userData: userData ?? this.userData,
      eventState: eventState ?? this.eventState,
      showLoading: showLoading ?? this.showLoading,
    );
  }
}
