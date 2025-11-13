import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:makanapa/core/extension/index.dart';
import 'package:makanapa/core/themes/dimens_constant.dart';
import 'package:makanapa/features/onboarding/presentation/login/controllers/login_controller.dart';

class LoginForm extends HookConsumerWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = useMemoized(() => GlobalKey<FormState>());
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();

    final formState = ref.watch(
      loginControllerProvider.select(
        (value) =>
            (value.errorEmail, value.errorPassword, value.isLoginAllowed),
      ),
    );

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  hintText: 'Masukkan Email Anda',
                  errorText: formState.$1.isNotEmpty ? formState.$1 : null,
                ),
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                onChanged: (input) {
                  ref
                      .read(loginControllerProvider.notifier)
                      .isInputEmailValid(input);
                },

                autovalidateMode: AutovalidateMode.onUserInteraction,
              ),
              Dimens.lg.space,
              TextFormField(
                controller: passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                  hintText: 'Masukkan Password Anda',
                  errorText: formState.$2.isNotEmpty ? formState.$2 : null,
                ),
                obscureText: true,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.done,
                onChanged: (input) {
                  ref
                      .read(loginControllerProvider.notifier)
                      .isInputPasswordValid(input);
                },
                autovalidateMode: AutovalidateMode.onUserInteraction,
              ),
              Dimens.lg.space,
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: formState.$3
                      ? () {
                          ref
                              .read(loginControllerProvider.notifier)
                              .loginWithEmail(
                                emailController.text,
                                passwordController.text,
                              );
                        }
                      : null,
                  child: const Text('Masuk'),
                ),
              ),
              Dimens.lg.space,
            ],
          ),
        ),
      ],
    );
  }
}
