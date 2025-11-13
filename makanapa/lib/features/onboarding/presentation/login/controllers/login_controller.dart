import 'package:makanapa/core/states/data_state.dart';
import 'package:makanapa/features/onboarding/domain/usecases/validator_usecase.dart';
import 'package:makanapa/features/onboarding/presentation/login/controllers/state/login_event_state.dart';
import 'package:makanapa/features/onboarding/presentation/login/controllers/state/login_ui_state.dart';
import 'package:makanapa/features/onboarding/provider/onboarding_provider.dart';
import 'package:makanapa/features/shared/provider/token/token_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login_controller.g.dart';

@riverpod
class LoginController extends _$LoginController {
  //final DataState<Template> _template = DataState.Initial();
  final _useCase = ValidatorUsecase();

  @override
  LoginUIState build() {
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

  Future<void> loginWithEmail(String email, String password) async {
    state = state.copyWith(loginState: const Loading());
    final repo = await ref.read(loginRepositoryProvider.future);
    final response = await repo.signInWithEmailAndPassword(email, password);

    state = response.fold(
      (l) {
        return state.copyWith(
          loginState: Error(l),
          eventState: LoginEventState.toastError(l),
        );
      },
      (r) {
        ref.read(tokenProvider.notifier).reloadToken();
        return state.copyWith(
          loginState: Success(r),
          eventState: LoginEventState.toHomePage(),
        );
      },
    );
  }
}
