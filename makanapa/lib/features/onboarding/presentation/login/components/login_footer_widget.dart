import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:makanapa/core/extension/index.dart';
import 'package:makanapa/core/helpers/snackbar_helper.dart';
import 'package:makanapa/core/themes/app_color.dart';
import 'package:makanapa/core/themes/dimens_constant.dart';
import 'package:makanapa/core/widgets/button/social_button.dart';
import 'package:makanapa/features/onboarding/presentation/login/controllers/login_controller.dart';

class LoginFooter extends HookConsumerWidget {
  const LoginFooter({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SocialLoginButton(
          text: "Masuk dengan Google",
          onPressed: () {
            SnackBarHelper.showError(context, "Coming soon");
          },
        ),
        Dimens.lg.space,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                // Default text style for all spans
                style: context.bodyMedium,
                children: <TextSpan>[
                  const TextSpan(text: 'Belum punya akun? '),
                  TextSpan(
                    text: 'Daftar disini',
                    style: const TextStyle(
                      color: AppColor.primary,
                      fontWeight: FontWeight.bold,
                    ),
                    // This makes the TextSpan tappable
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        ref.read(loginControllerProvider.notifier).openSignUp();
                      },
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
