import 'package:makanapa/features/onboarding/domain/models/signup_request.dart';
import 'package:makanapa/features/onboarding/domain/repositories/login_repository.dart';
import 'package:makanapa/features/onboarding/domain/usecases/validator_usecase.dart';
import 'package:makanapa/features/onboarding/presentation/signup/controllers/state/signup_event_state.dart';
import 'package:makanapa/features/onboarding/presentation/signup/controllers/state/signup_ui_state.dart';
import 'package:makanapa/features/onboarding/provider/onboarding_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'signup_controller.g.dart';

@riverpod
class SignUpController extends _$SignUpController {
  //final DataState<Template> _template = DataState.Initial();
  final _useCase = ValidatorUsecase();
  late LoginRepository _repo;

  @override
  SignupUiState build() {
    _repo = ref.read(loginRepositoryProvider);
    return SignupUiState();
  }

  String isInputEmailValid(String input) {
    final errors = _useCase.validateEmail(input) ?? "";
    state = state.copyWith(email: input, errorEmail: errors);
    return errors;
  }

  String isInputPasswordValid(String input) {
    final passwordErrors = _useCase.validatePassword(input) ?? "";

    // Re-validate the confirm password if it's not empty
    String confirmPasswordError = state.errorConfirmPassword;
    if (state.confirmPassword.isNotEmpty) {
      if (input != state.confirmPassword) {
        confirmPasswordError = "Kata sandi tidak cocok.";
      } else {
        confirmPasswordError = ""; // Passwords now match, clear the error
      }
    }

    state = state.copyWith(
      password: input,
      errorPassword: passwordErrors,
      errorConfirmPassword: confirmPasswordError,
    );
    return passwordErrors;
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

  String isConfirmPasswordValid(String input) {
    String error = ""; // Start with no error
    if (input.isEmpty) {
      error = "Konfirmasi kata sandi tidak boleh kosong.";
    } else if (input != state.password) {
      error =
          "Kata sandi tidak cocok."; // Check against the current password in the state
    }
    state = state.copyWith(confirmPassword: input, errorConfirmPassword: error);
    return error;
  }

  void resetEventState() {
    state = state.copyWith(eventState: SignUpEventState.initial());
  }

  Future<void> signUpWithEmail() async {
    final SignupRequest request = SignupRequest(
      email: state.email,
      password: state.password,
      userName: state.name,
      phone: state.phoneNumber,
    );

    state = state.copyWith(eventState: SignUpEventState.showLoading());
    await Future.delayed(Duration(seconds: 2));
    final response = await _repo.signUpWithEmailAndPassword(request);

    state = response.fold(
      (l) {
        return state.copyWith(eventState: SignUpEventState.toastError(l));
      },
      (r) {
        return state.copyWith(eventState: SignUpEventState.toHomePage());
      },
    );
  }
}
