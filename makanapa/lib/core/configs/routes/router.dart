import 'dart:async';

import 'package:chucker_flutter/chucker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:makanapa/core/configs/routes/route_names.dart';
import 'package:makanapa/features/basket/presentation/screens/basket_screen.dart';
import 'package:makanapa/features/home/presentation/create/screens/create_screen.dart';
import 'package:makanapa/features/home/presentation/home/screens/home_screen.dart';
import 'package:makanapa/features/main_screen.dart';
import 'package:makanapa/features/not_found_screen.dart';
import 'package:makanapa/features/onboarding/domain/models/user.dart';
import 'package:makanapa/features/onboarding/presentation/intro/screen/intro_screen.dart';
import 'package:makanapa/features/onboarding/presentation/login/screens/login_screen.dart';
import 'package:makanapa/features/onboarding/presentation/signup/screens/signup_screen.dart';
import 'package:makanapa/features/profile/presentation/changePassword/screens/change_password_screen.dart';
import 'package:makanapa/features/profile/presentation/faq/screens/faq_screen.dart';
import 'package:makanapa/features/profile/presentation/profileEdit/screens/profile_edit_screen.dart';
import 'package:makanapa/features/profile/presentation/profileSetting/screens/profile_screen.dart';
import 'package:makanapa/features/recipe/domain/models/recipe_item.dart';
import 'package:makanapa/features/recipe/presentation/detail/screens/recipe_detail_provider_screen.dart';
import 'package:makanapa/features/recipe/presentation/list/screens/recipe_provider_screen.dart';
import 'package:makanapa/features/recipe/presentation/search/screens/search_provider_screen.dart';
import 'package:makanapa/features/shared/token/provider/token_provider.dart';
import 'package:makanapa/features/shared/token/provider/token_state.dart';
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
                path: "/recipe",
                builder: (context, state) => const RecipeProviderScreen(),
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
      GoRoute(
        name: RouteNames.changePassword,
        path: "/change-password",
        builder: (context, state) {
          return const ChangePasswordScreen();
        },
      ),
      GoRoute(
        name: RouteNames.profileEdit,
        path: '/profile-edit',
        builder: (BuildContext context, GoRouterState state) {
          final userData = state.extra as UserData;
          return ProfileEditScreen(userData: userData);
        },
      ),
      GoRoute(
        name: RouteNames.faq,
        path: '/faq',
        builder: (BuildContext context, GoRouterState state) {
          return FaqScreen();
        },
      ),
      GoRoute(
        name: RouteNames.recipeDetailRecipe,
        path: '/recipe/recipe-detail',
        builder: (BuildContext context, GoRouterState state) {
          final item = state.extra as RecipeItem;
          return RecipeDetailProviderScreen(
            recipeItem: item,
            heroTag: "recipe_${item.id}",
          );
        },
      ),
      GoRoute(
        name: RouteNames.recipeSearch,
        path: '/search',
        builder: (BuildContext context, GoRouterState state) {
          return SearchProviderScreen();
        },
      ),
      GoRoute(
        name: RouteNames.recipeDetailSearch,
        path: '/search/recipe-detail',
        builder: (BuildContext context, GoRouterState state) {
          final item = state.extra as RecipeItem;
          return RecipeDetailProviderScreen(
            recipeItem: item,
            heroTag: "search_recipe_${item.id}",
          );
        },
      ),
      GoRoute(
        name: RouteNames.createPlan,
        path: '/plan/create',
        builder: (BuildContext context, GoRouterState state) {
          return CreatePlanScreen();
        },
      ),
      GoRoute(
        name: RouteNames.planDetail,
        path: '/search',
        builder: (BuildContext context, GoRouterState state) {
          return SearchProviderScreen();
        },
      ),
    ],
  );
});
