import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:makanapa/core/extension/index.dart';
import 'package:makanapa/core/themes/app_color.dart';
import 'package:makanapa/core/themes/dimens_constant.dart';
import 'package:makanapa/features/onboarding/presentation/signup/controllers/signup_controller.dart';

class SignupFormWidget extends HookConsumerWidget {
  const SignupFormWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final (
      errorEmail,
      errorName,
      errorPhone,
      errorPassword,
      errorConfirmPassword,
    ) = ref.watch(
      signUpControllerProvider.select(
        (value) => (
          value.errorEmail,
          value.errorName,
          value.errorPhone,
          value.errorPassword,
          value.errorConfirmPassword,
        ),
      ),
    );

    final formKey = useMemoized(() => GlobalKey<FormState>());
    final emailController = useTextEditingController();
    final nameController = useTextEditingController();
    final phoneController = useTextEditingController();
    final confirmPasswordController = useTextEditingController();
    final passwordController = useTextEditingController();

    final passwordNode = useFocusNode();
    final confirmNode = useFocusNode();

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
                  prefixIcon: Icon(Icons.email, color: AppColor.primary),
                  labelText: 'Email',
                  hintText: 'Masukkan Email Anda',
                  errorText: errorEmail.isNotEmpty ? errorEmail : null,
                ),
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                onChanged: (input) {
                  ref
                      .read(signUpControllerProvider.notifier)
                      .isInputEmailValid(input);
                },

                autovalidateMode: AutovalidateMode.onUserInteraction,
              ),
              Dimens.lg.space,
              TextFormField(
                controller: nameController,
                textCapitalization: TextCapitalization.words,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person, color: AppColor.primary),
                  labelText: 'Nama',
                  hintText: 'Masukkan Nama Anda',
                  errorText: errorName.isNotEmpty ? errorName : null,
                ),
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                onChanged: (input) {
                  ref
                      .read(signUpControllerProvider.notifier)
                      .isUserNameValid(input);
                },

                autovalidateMode: AutovalidateMode.onUserInteraction,
              ),
              Dimens.lg.space,
              TextFormField(
                controller: phoneController,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.phone_android,
                    color: AppColor.primary,
                  ),
                  labelText: 'Telepon',
                  hintText: 'Masukkan Nomor Telepon',
                  errorText: errorPhone.isNotEmpty ? errorPhone : null,
                ),
                keyboardType: TextInputType.phone,
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(passwordNode);
                },
                onChanged: (input) {
                  ref
                      .read(signUpControllerProvider.notifier)
                      .isPhoneNumberValid(input);
                },
                autovalidateMode: AutovalidateMode.onUserInteraction,
              ),
              Dimens.lg.space,
              TextFormField(
                focusNode: passwordNode,
                controller: passwordController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock, color: AppColor.primary),
                  labelText: 'Password',
                  hintText: 'Masukkan Password Anda',
                  errorText: errorPassword.isNotEmpty ? errorPassword : null,
                ),
                obscureText: true,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(confirmNode);
                },
                onChanged: (input) {
                  ref
                      .read(signUpControllerProvider.notifier)
                      .isInputPasswordValid(input);
                },
                autovalidateMode: AutovalidateMode.onUserInteraction,
              ),
              Dimens.lg.space,
              TextFormField(
                focusNode: confirmNode,
                controller: confirmPasswordController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock, color: AppColor.primary),
                  labelText: 'Konfirmasi Password',
                  hintText: 'Konfirmasi Password',
                  errorText: errorConfirmPassword.isNotEmpty
                      ? errorConfirmPassword
                      : null,
                ),
                obscureText: true,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.done,
                onChanged: (input) {
                  ref
                      .read(signUpControllerProvider.notifier)
                      .isConfirmPasswordValid(input);
                },
                autovalidateMode: AutovalidateMode.onUserInteraction,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
