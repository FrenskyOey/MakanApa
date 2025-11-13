import 'package:freezed_annotation/freezed_annotation.dart';
part 'token_state.freezed.dart';

@freezed
class TokenState with _$TokenState {
  const factory TokenState.initialState() = _InitialState;
  const factory TokenState.loginState(String token) = _LoginState;
  const factory TokenState.logoutState() = _LogoutState;
}
