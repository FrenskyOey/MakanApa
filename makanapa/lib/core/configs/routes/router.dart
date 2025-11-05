import 'dart:async';

import 'package:chucker_flutter/chucker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:makanapa/core/configs/routes/route_names.dart';
import 'package:makanapa/features/not_found_screen.dart';
import 'package:makanapa/features/splash_screen.dart';

part 'redirection.dart';

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
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        name: RouteNames.splash,
        path: "/splash-screen",
        builder: (context, state) {
          return const SplashScreen();
        },
      ),
    ],
  );
});
