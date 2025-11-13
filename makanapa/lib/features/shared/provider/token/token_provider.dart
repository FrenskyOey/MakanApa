import 'package:makanapa/features/onboarding/provider/onboarding_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'token_state.dart';

part 'token_provider.g.dart';

@Riverpod(keepAlive: true)
class TokenNotifier extends _$TokenNotifier {
  @override
  TokenState build() {
    // Adjust this if your project exposes the repository under a different provider name.
    reloadToken();
    return const TokenState.initialState();
  }

  /// Reload access token from local DB/storage and update state.
  Future<TokenState> reloadToken() async {
    final loginRepo = await ref.read(loginRepositoryProvider.future);
    final token = await loginRepo.getAccessToken();
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
    final loginRepo = await ref.read(loginRepositoryProvider.future);
    final result = await loginRepo.performTokenRefresh();
    await result.fold(
      (error) async {
        // attempt to clean up server/local session, ignore result
        await loginRepo.logout();
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
    final loginRepo = await ref.read(loginRepositoryProvider.future);
    await loginRepo.logout();
    state = const TokenState.logoutState();
  }
}
