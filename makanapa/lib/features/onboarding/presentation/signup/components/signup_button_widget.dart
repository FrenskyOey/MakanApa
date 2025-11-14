import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:makanapa/features/onboarding/presentation/signup/controllers/signup_controller.dart';

class SignupButtonWidget extends HookConsumerWidget {
  const SignupButtonWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final buttonEnableState = ref.watch(
      signUpControllerProvider.select((value) => value.isSignUpAllowed),
    );

    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: buttonEnableState
            ? () {
                ref.read(signUpControllerProvider.notifier).signUpWithEmail();
              }
            : null,
        child: const Text('Daftar'),
      ),
    );
  }
}
