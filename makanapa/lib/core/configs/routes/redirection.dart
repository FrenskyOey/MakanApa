part of 'router.dart';

FutureOr<String?> handleRedirect(
  BuildContext context,
  GoRouterState state,
  Ref ref,
) async {
  ScaffoldMessenger.of(context).hideCurrentSnackBar();
  final publicRoutes = {
    RouteNames.splash,
    RouteNames.intro,
    RouteNames.login,
    RouteNames.signUp,
  };

  // Bypass authentication check for public routes.
  if (publicRoutes.contains(state.matchedLocation)) {
    return null;
  }

  final isAuthenticated = await _isAuthenticated(ref);
  if (!isAuthenticated) {
    return RouteNames.intro;
  }

  return null;
}

Future<bool> _isAuthenticated(Ref ref) async {
  final tokenState = ref
      .read(tokenProvider)
      .maybeWhen(loginState: (token) => true, orElse: () => false);
  return tokenState;
}
