import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:makanapa/core/configs/routes/route_names.dart';
import 'package:makanapa/core/extension/index.dart';
import 'package:makanapa/core/helpers/snackbar_helper.dart';
import 'package:makanapa/core/states/data_state.dart';
import 'package:makanapa/core/themes/dimens_constant.dart';
import 'package:makanapa/core/widgets/state/screen_content.dart';
import 'package:makanapa/features/onboarding/presentation/login/components/login_footer_widget.dart';
import 'package:makanapa/features/onboarding/presentation/login/components/login_form_widget.dart';
import 'package:makanapa/features/onboarding/presentation/login/components/login_header_widget.dart';
import 'package:makanapa/features/onboarding/presentation/login/controllers/login_controller.dart';
import 'package:makanapa/features/onboarding/presentation/login/controllers/state/login_event_state.dart';

class LoginScreen extends HookConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final eventState = ref.watch(
      loginControllerProvider.select((s) => s.eventState),
    );

    ref.listen(loginControllerProvider.select((value) => value.eventState), (
      prev,
      next,
    ) {
      // Handle side-effects like navigation or showing a snackbar
      // The listen callback is perfect for actions that should only happen once per state change.
      next.whenOrNull(
        toastError: (message) {
          SnackBarHelper.showError(context, message);
        },
        toHomePage: () {
          context.goNamed(RouteNames.home);
        },
        toSignUpPage: () {
          context.pushNamed(RouteNames.signUp);
        },
      );

      final shouldReset = next.maybeWhen(
        showLoading: () => false, // Don't reset when loading starts
        orElse: () => true, // Reset for all other events
      );

      if (shouldReset) {
        ref.read(loginControllerProvider.notifier).resetEventState();
      }
    });

    Widget mainBody() {
      return SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          // Use a constrained box to ensure the content is scrollable even on larger screens
          // while keeping the content centered vertically.
          height:
              MediaQuery.sizeOf(context).height -
              MediaQuery.paddingOf(context).top -
              MediaQuery.paddingOf(context).bottom,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const LoginHeader(),
              Dimens.lg.space,
              const LoginForm(),
              Text(
                "---   atau  ---",
                textAlign: TextAlign.center,
                style: context.bodyMedium,
              ),
              Dimens.lg.space,
              const LoginFooter(),
              Dimens.lg.space,
              Text(
                "Demo Account",
                textAlign: TextAlign.center,
                style: context.bodyMedium,
              ),
              Text(
                "(Email : testUser@test.com, Password : 12341234 ) ",
                textAlign: TextAlign.center,
                style: context.bodyMedium,
              ),
            ],
          ),
        ).paddingAll(Dimens.lg),
      );
    }

    return Scaffold(
      body: ScreenContent<String>(
        state: Success(""),
        overlayLoading: eventState.maybeWhen(
          showLoading: () => true,
          orElse: () => false,
        ),
        successWidget: (data) {
          return SafeArea(child: mainBody());
        },
      ),
    );
  }
}
