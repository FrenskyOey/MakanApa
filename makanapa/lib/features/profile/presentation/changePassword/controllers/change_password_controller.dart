import 'package:makanapa/features/onboarding/domain/usecases/validator_usecase.dart';
import 'package:makanapa/features/profile/presentation/changePassword/controllers/state/change_password_event_state.dart';
import 'package:makanapa/features/profile/presentation/changePassword/controllers/state/change_password_ui_state.dart';
import 'package:makanapa/features/profile/provider/profile_provider.dart';
import 'package:makanapa/features/shared/provider/token/token_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'change_password_controller.g.dart';

@riverpod
class ChangePasswordController extends _$ChangePasswordController {
  //final DataState<Template> _template = DataState.Initial();
  final _useCase = ValidatorUsecase();

  @override
  ChangePasswordUIState build() {
    return ChangePasswordUIState();
  }

  String isInpuOldtPasswordValid(String input) {
    final errors = _useCase.validatePassword(input) ?? "";

    String newPasswordError = state.errorNewPassword;
    if (input == state.newPassword) {
      newPasswordError = "Password baru tidak boleh sama dengan yang lama.";
    }

    state = state.copyWith(
      oldPassword: input,
      errorPassword: errors,
      errorNewPassword: newPasswordError,
    );

    return errors;
  }

  String isInputPasswordValid(String input) {
    String passwordErrors = _useCase.validatePassword(input) ?? "";
    // Re-validate the confirm password if it's not empty
    if (input == state.oldPassword) {
      passwordErrors = "Password baru tidak boleh sama dengan yang lama.";
    }

    String confirmPasswordError = state.errorConfirmPassword;
    if (state.confirmPassword.isNotEmpty) {
      if (input != state.confirmPassword) {
        confirmPasswordError = "Password tidak cocok.";
      } else {
        confirmPasswordError = ""; // Passwords now match, clear the error
      }
    }

    state = state.copyWith(
      newPassword: input,
      errorNewPassword: passwordErrors,
      errorConfirmPassword: confirmPasswordError,
    );
    return passwordErrors;
  }

  String isConfirmPasswordValid(String input) {
    String error = ""; // Start with no error
    if (input.isEmpty) {
      error = "Konfirmasi Password tidak boleh kosong.";
    } else if (input != state.newPassword) {
      error =
          "Password tidak cocok."; // Check against the current password in the state
    }
    state = state.copyWith(confirmPassword: input, errorConfirmPassword: error);
    return error;
  }

  void resetEventState() {
    state = state.copyWith(eventState: ChangePasswordEventState.initial());
  }

  Future<void> logout() async {
    ref.read(tokenProvider.notifier).signOut();
  }

  Future<void> changePassword() async {
    state = state.copyWith(showProcessLoading: true);
    await Future.delayed(const Duration(seconds: 2));
    final repo = await ref.read(profileRepositoryProvider.future);
    final response = await repo.changePassword(
      state.oldPassword,
      state.newPassword,
    );
    state = response.fold(
      (l) {
        return state.copyWith(
          showProcessLoading: false,
          eventState: ChangePasswordEventState.toastError(l),
        );
      },
      (r) {
        return state.copyWith(
          showProcessLoading: false,
          eventState: ChangePasswordEventState.showLogoutDialog(),
        );
      },
    );
  }
}
