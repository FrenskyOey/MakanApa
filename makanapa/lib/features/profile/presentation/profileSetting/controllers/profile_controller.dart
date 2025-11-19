import 'dart:async';

import 'package:makanapa/core/handlers/log/log_helper.dart';
import 'package:makanapa/features/profile/presentation/profileSetting/controllers/state/profile_event_state.dart';
import 'package:makanapa/features/profile/presentation/profileSetting/controllers/state/profile_ui_state.dart';
import 'package:makanapa/features/profile/provider/profile_provider.dart';
import 'package:makanapa/features/shared/provider/token/token_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'profile_controller.g.dart';

@riverpod
class ProfileController extends _$ProfileController {
  StreamSubscription? _userSubscription;

  @override
  ProfileUIState build() {
    _initStream();
    _initType();

    // Register a callback to cancel the stream subscription when the provider is disposed.
    ref.onDispose(() {
      _userSubscription?.cancel();
    });

    return ProfileUIState();
  }

  void _initStream() async {
    final repo = await ref.read(profileRepositoryProvider.future);
    final userStream = repo.getUserProfileStream();
    _userSubscription = userStream.listen((user) {
      if (user == null) {
        return;
      }
      state = state.copyWith(userData: user);
    });
  }

  void _initType() async {
    final repo = await ref.read(profileRepositoryProvider.future);
    final userType = await repo.getUserType();
    state = state.copyWith(userType: userType);
  }

  void resetState() {
    state = state.copyWith(eventState: ProfileEventState.initial());
  }

  void openAboutUs() {
    state = state.copyWith(eventState: ProfileEventState.openAboutUs());
  }

  void openChangePass() {
    state = state.copyWith(eventState: ProfileEventState.openChangePassword());
  }

  void openEditProfile() async {
    if (state.userData == null) {
      return;
    }

    state = state.copyWith(
      eventState: ProfileEventState.openEditProfile(state.userData!),
    );
  }

  void logout() {
    ref.read(tokenProvider.notifier).signOut();
  }

  Future<void> reloadProfileData() async {
    state = state.copyWith(showLoading: true);
    await Future.delayed(Duration(seconds: 2));
    final repo = await ref.read(profileRepositoryProvider.future);
    final results = await repo.reloadUserProfile();
    results.fold(
      (l) => {LogHelper.debug("Errors : $l")},
      (r) => {
        // skip nothing to do
      },
    );
    state = state.copyWith(showLoading: false);
  }
}
