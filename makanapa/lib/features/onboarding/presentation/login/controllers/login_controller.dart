import 'package:makanapa/features/onboarding/domain/models/google_sign_in_request.dart';
import 'package:makanapa/features/onboarding/domain/repositories/login_repository.dart';
import 'package:makanapa/features/onboarding/domain/usecases/validator_usecase.dart';
import 'package:makanapa/features/onboarding/presentation/login/controllers/state/login_event_state.dart';
import 'package:makanapa/features/onboarding/presentation/login/controllers/state/login_ui_state.dart';
import 'package:makanapa/features/onboarding/provider/onboarding_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login_controller.g.dart';

@riverpod
class LoginController extends _$LoginController {
  final _useCase = ValidatorUsecase();
  late LoginRepository _repo;

  @override
  LoginUIState build() {
    _repo = ref.read(loginRepositoryProvider);
    return LoginUIState();
  }

  String isInputEmailValid(String input) {
    final errors = _useCase.validateEmail(input) ?? "";
    state = state.copyWith(email: input, errorEmail: errors);
    return errors;
  }

  String isInputPasswordValid(String input) {
    final errors = _useCase.validatePassword(input) ?? "";
    state = state.copyWith(password: input, errorPassword: errors);
    return errors;
  }

  void openSignUp() {
    state = state.copyWith(eventState: LoginEventState.toSignUpPage());
  }

  void resetEventState() {
    state = state.copyWith(eventState: LoginEventState.initial());
  }

  Future<void> loginWithEmail(String email, String password) async {
    state = state.copyWith(eventState: LoginEventState.showLoading());
    await Future.delayed(const Duration(seconds: 2));
    final response = await _repo.signInWithEmailAndPassword(email, password);

    state = response.fold(
      (l) {
        return state.copyWith(eventState: LoginEventState.toastError(l));
      },
      (r) {
        return state.copyWith(eventState: LoginEventState.toHomePage());
      },
    );
  }

  Future<void> loginWithGoogle(GoogleSignInRequest request) async {
    state = state.copyWith(eventState: LoginEventState.showLoading());
    await Future.delayed(const Duration(seconds: 2));
    final response = await _repo.signInWithGoogle(request);
    state = response.fold(
      (l) {
        return state.copyWith(eventState: LoginEventState.toastError(l));
      },
      (r) {
        return state.copyWith(eventState: LoginEventState.toHomePage());
      },
    );
  }
}
