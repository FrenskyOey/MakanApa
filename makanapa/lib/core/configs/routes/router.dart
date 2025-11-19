import 'dart:async';

import 'package:chucker_flutter/chucker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:makanapa/core/configs/routes/route_names.dart';
import 'package:makanapa/features/basket/presentation/screens/basket_screen.dart';
import 'package:makanapa/features/home/presentation/screens/home_screen.dart';
import 'package:makanapa/features/main_screen.dart';
import 'package:makanapa/features/not_found_screen.dart';
import 'package:makanapa/features/onboarding/presentation/intro/screen/intro_screen.dart';
import 'package:makanapa/features/onboarding/presentation/login/screens/login_screen.dart';
import 'package:makanapa/features/onboarding/presentation/signup/screens/signup_screen.dart';
import 'package:makanapa/features/profile/presentation/profileSetting/screens/profile_screen.dart';
import 'package:makanapa/features/receipt/presentation/screens/receipt_screen.dart';
import 'package:makanapa/features/shared/provider/token/token_provider.dart';
import 'package:makanapa/features/shared/provider/token/token_state.dart';
import 'package:makanapa/features/splash_screen.dart';

part 'redirection.dart';
part 'refresh_listener.dart';

final routeProvider = Provider((ref) {
  return GoRouter(
    observers: [ChuckerFlutter.navigatorObserver],
    initialLocation: "/splash-screen",
    errorBuilder: (context, state) {
      return NotFoundScreen();
    },
    redirect: (context, state) {
      final redirect = handleRedirect(context, state, ref);
      return redirect;
    },
    refreshListenable: _refreshListener(ref),
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        name: RouteNames.splash,
        path: "/splash-screen",
        builder: (context, state) {
          return const SplashScreen();
        },
      ),
      GoRoute(
        name: RouteNames.intro,
        path: "/intro",
        builder: (context, state) {
          return const IntroScreen();
        },
      ),
      GoRoute(
        name: RouteNames.login,
        path: "/login",
        builder: (context, state) {
          return const LoginScreen();
        },
      ),
      GoRoute(
        name: RouteNames.signUp,
        path: "/signup",
        builder: (context, state) {
          return const SignupScreen();
        },
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return MainScreen(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                name: RouteNames.home,
                path: "/home",
                builder: (context, state) => const HomeScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                name: RouteNames.receipt,
                path: "/receipt",
                builder: (context, state) => const ReceiptScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                name: RouteNames.basket,
                path: "/basket",
                builder: (context, state) => const BasketScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                name: RouteNames.profile,
                path: "/profile",
                builder: (context, state) => const ProfileScreen(),
              ),
            ],
          ),
        ],
      ),
    ],
  );
});
