import 'package:makanapa/core/handlers/log/log_helper.dart';
import 'package:makanapa/features/shared/token/domain/token_repository.dart';
import 'package:makanapa/features/shared/token/provider/token_repo_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'token_state.dart';

part 'token_provider.g.dart';

@Riverpod(keepAlive: true)
class TokenNotifier extends _$TokenNotifier {
  late TokenRepository _repository;

  @override
  TokenState build() {
    _repository = ref.read(tokenRepositoryProvider);
    initStream();
    // Set the initial state based on the token available at startup.
    final initialToken = _repository.getAccessToken();
    return initialToken == null
        ? const TokenState.logoutState()
        : TokenState.loginState(initialToken);
  }

  Future<void> initStream() async {
    final tokenStreams = _repository.onTokenChanged();
    tokenStreams.listen((tokenData) {
      if (tokenData == null) {
        LogHelper.debug("LOGOUT FROM STREAM");
        state = const TokenState.logoutState();
      } else {
        LogHelper.debug("TOKEN CHANGE FROM STREAM");
        state = TokenState.loginState(tokenData);
      }
    });
  }

  /// Reload access token from local DB/storage and update state.
  TokenState reloadToken() {
    final token = _repository.getAccessToken();
    if (token == null) {
      state = const TokenState.logoutState();
    } else {
      state = TokenState.loginState(token);
    }
    return state;
  }

  /// Refresh token via remote endpoint. On success update LoginState with new token.
  /// On error, attempt logout and set LogoutState.
  Future<String?> refreshToken() async {
    final result = await _repository.performTokenRefresh();
    await result.fold(
      (error) async {
        // attempt to clean up server/local session, ignore result
        await _repository.logout();
        state = const TokenState.logoutState();
      },
      (newToken) async {
        state = TokenState.loginState(newToken);
        return newToken;
      },
    );
    return null;
  }

  /// Sign out: call logout on repository and set LogoutState.
  Future<void> signOut() async {
    await _repository.logout();
    state = const TokenState.logoutState();
  }
}
