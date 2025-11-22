import 'dart:async';

import 'package:makanapa/features/onboarding/domain/models/user.dart';
import 'package:makanapa/features/onboarding/domain/repositories/user_repository.dart';
import 'package:makanapa/features/onboarding/domain/usecases/validator_usecase.dart';
import 'package:makanapa/features/onboarding/provider/onboarding_provider.dart';
import 'package:makanapa/features/profile/domain/repositories/profile_repository.dart';
import 'package:makanapa/features/profile/presentation/profileEdit/controllers/state/profile_edit_event_state.dart';
import 'package:makanapa/features/profile/presentation/profileEdit/controllers/state/profile_edit_ui_state.dart';
import 'package:makanapa/features/profile/provider/profile_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'profile_edit_controller.g.dart';

@riverpod
class ProfileEditController extends _$ProfileEditController {
  final _useCase = ValidatorUsecase();
  late ProfileRepository _repo;
  late UserRepository _userRepo;

  final _eventController = StreamController<ProfileEditEventState>.broadcast();
  Stream<ProfileEditEventState> get events => _eventController.stream;

  @override
  ProfileEditUIState build() {
    _repo = ref.read(profileRepositoryProvider);
    _userRepo = ref.read(userRepoProvider);

    ref.onDispose(() {
      _eventController.close();
    });

    return ProfileEditUIState();
  }

  void openGallery() {
    _eventController.add(ProfileEditEventState.openGallery());
  }

  String isUserNameValid(String input) {
    final errors = _useCase.validateUserName(input) ?? "";
    state = state.copyWith(name: input, errorName: errors);
    return errors;
  }

  String isPhoneNumberValid(String input) {
    final errors = _useCase.validatePhoneNumber(input) ?? "";
    state = state.copyWith(phoneNumber: input, errorPhone: errors);
    return errors;
  }

  void loadUserData(UserData user) {
    // do something here
    state = state.copyWith(
      name: user.name,
      phoneNumber: user.phone,
      avatarFiles: user.avatar,
    );
  }

  Future<void> _updateProfile(UserData user) async {
    final response = await _repo.updateUserProfile(user);

    response.fold(
      (l) {
        _eventController.add(ProfileEditEventState.toastError(l));
      },
      (r) {
        _eventController.add(ProfileEditEventState.successUpdate(user));
      },
    );

    state.copyWith(showProgress: false);
  }

  Future<void> uploadPicture(String? filePath) async {
    if (filePath == null) {
      _eventController.add(
        ProfileEditEventState.toastError("Tidak ada gambar yang dipilih"),
      );
      return;
    }

    state = state.copyWith(showProgress: true);
    await Future.delayed(const Duration(seconds: 2));

    final response = await _repo.updateUserAvatar(filePath);

    state = response.fold(
      (l) {
        _eventController.add(ProfileEditEventState.toastError(l));
        return state.copyWith(showProgress: false);
      },
      (r) {
        return state.copyWith(showProgress: false, avatarFiles: r);
      },
    );
  }

  Future<void> changeProfile() async {
    state = state.copyWith(showProgress: true);
    await Future.delayed(const Duration(seconds: 2));
    final currentProfile = await _userRepo.getCurrentUser();

    currentProfile.fold(
      (l) {
        _eventController.add(ProfileEditEventState.toastError(l));
        state = state.copyWith(showProgress: false);
      },
      (r) {
        final request = r.copyWith(
          name: state.name,
          phone: state.phoneNumber,
          avatar: state.avatarFiles,
        );
        _updateProfile(request);
      },
    );
  }
}
