import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:makanapa/core/configs/routes/route_names.dart';
import 'package:makanapa/core/extension/index.dart';
import 'package:makanapa/core/helpers/snackbar_helper.dart';
import 'package:makanapa/core/states/data_state.dart';
import 'package:makanapa/core/themes/dimens_constant.dart';
import 'package:makanapa/core/widgets/state/screen_content.dart';
import 'package:makanapa/features/onboarding/presentation/signup/components/signup_button_widget.dart';
import 'package:makanapa/features/onboarding/presentation/signup/components/signup_form_widget.dart';
import 'package:makanapa/features/onboarding/presentation/signup/controllers/signup_controller.dart';
import 'package:makanapa/features/onboarding/presentation/signup/controllers/state/signup_event_state.dart';

class SignupScreen extends HookConsumerWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final eventState = ref.watch(
      signUpControllerProvider.select((s) => s.eventState),
    );

    ref.listen(signUpControllerProvider.select((value) => value.eventState), (
      prev,
      next,
    ) {
      next.maybeWhen(
        toastError: (messgae) {
          SnackBarHelper.showError(context, messgae);
        },
        toHomePage: () {
          context.goNamed(RouteNames.main);
        },
        backPress: () {
          context.pop();
        },
        orElse: () {},
      );

      final shouldReset = next.maybeWhen(
        showLoading: () => false, // Don't reset when loading starts
        orElse: () => true, // Reset for all other events
      );

      if (shouldReset) {
        ref.read(signUpControllerProvider.notifier).resetEventState();
      }
    });

    Widget mainBody() {
      return Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Buat Akunmu',
                      style: context.titleLarge,
                      textAlign: TextAlign.center,
                    ),
                    Dimens.lg.space,
                    const SignupFormWidget(),
                  ],
                ),
              ),
            ),
          ),
          const SignupButtonWidget(),
        ],
      ).paddingAll(Dimens.lg);
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
