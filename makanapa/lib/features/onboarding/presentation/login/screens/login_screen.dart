import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:makanapa/core/configs/routes/route_names.dart';
import 'package:makanapa/core/extension/index.dart';
import 'package:makanapa/core/helpers/snackbar_helper.dart';
import 'package:makanapa/core/states/data_state.dart' as data_state;
import 'package:makanapa/core/themes/app_color.dart';
import 'package:makanapa/core/themes/dimens_constant.dart';
import 'package:makanapa/features/onboarding/presentation/login/components/login_footer_widget.dart';
import 'package:makanapa/features/onboarding/presentation/login/components/login_form_widget.dart';
import 'package:makanapa/features/onboarding/presentation/login/components/login_header_widget.dart';
import 'package:makanapa/features/onboarding/presentation/login/controllers/login_controller.dart';
import 'package:makanapa/features/onboarding/presentation/login/controllers/state/login_event_state.dart';

class LoginScreen extends HookConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loginState = ref.watch(
      loginControllerProvider.select((value) => value.loginState),
    );

    ref.listen(loginControllerProvider.select((value) => value.eventState), (
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
        toSignUpPage: () {
          context.pushNamed(RouteNames.signUp);
        },
        orElse: () {},
      );
    });

    Widget mainBody() {
      return SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
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

    Widget buildProgressBar() {
      return Center(
        child: SizedBox(
          height: 30,
          width: 30,
          child: CircularProgressIndicator(
            strokeWidth: 2,
            color: AppColor.secondary,
          ),
        ).paddingAll(Dimens.md),
      );
    }

    Widget contents() {
      switch (loginState) {
        case data_state.Loading():
          return buildProgressBar();
        default:
          return mainBody();
      }
    }

    return Scaffold(body: SafeArea(child: contents()));
  }
}
