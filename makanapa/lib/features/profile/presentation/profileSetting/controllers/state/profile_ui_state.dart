import 'package:makanapa/features/onboarding/domain/models/user.dart';

class ProfileUIState {
  final UserData? userData;
  final String userType;
  final bool showLoading;

  const ProfileUIState({
    this.userData,
    this.userType = 'email',
    this.showLoading = false,
  });

  ProfileUIState copyWith({
    bool? hideLoading,
    String? userType,
    UserData? userData,
    bool? showLoading,
  }) {
    return ProfileUIState(
      userType: userType ?? this.userType,
      userData: userData ?? this.userData,
      showLoading: showLoading ?? this.showLoading,
    );
  }
}
