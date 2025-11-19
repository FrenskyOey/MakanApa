import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:makanapa/core/extension/index.dart';
import 'package:makanapa/core/themes/app_color.dart';
import 'package:makanapa/core/themes/dimens_constant.dart';
import 'package:makanapa/features/profile/presentation/changePassword/controllers/change_password_controller.dart';

class ChangePasswordWidget extends HookConsumerWidget {
  const ChangePasswordWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final (errorPassword, errorNewPassword, errorConfirmPassword) = ref.watch(
      changePasswordControllerProvider.select(
        (value) => (
          value.errorPassword,
          value.errorNewPassword,
          value.errorConfirmPassword,
        ),
      ),
    );

    final formKey = useMemoized(() => GlobalKey<FormState>());
    final passwordController = useTextEditingController();
    final newPasswordController = useTextEditingController();
    final confirmPasswordController = useTextEditingController();

    final passwordNode = useFocusNode();
    final newPasswordNode = useFocusNode();
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
                focusNode: passwordNode,
                controller: passwordController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock, color: AppColor.primary),
                  labelText: 'Password Lama',
                  hintText: 'Masukkan Password Lama Anda',
                  errorText: errorPassword.isNotEmpty ? errorPassword : null,
                ),
                obscureText: true,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(newPasswordNode);
                },
                onChanged: (input) {
                  ref
                      .read(changePasswordControllerProvider.notifier)
                      .isInpuOldtPasswordValid(input);
                },
                autovalidateMode: AutovalidateMode.onUserInteraction,
              ),
              Dimens.lg.space,
              TextFormField(
                focusNode: newPasswordNode,
                controller: newPasswordController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock, color: AppColor.primary),
                  labelText: 'Password Baru',
                  hintText: 'Masukkan Password Baru Anda',
                  errorText: errorNewPassword.isNotEmpty
                      ? errorNewPassword
                      : null,
                ),
                obscureText: true,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(confirmNode);
                },
                onChanged: (input) {
                  ref
                      .read(changePasswordControllerProvider.notifier)
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
                      .read(changePasswordControllerProvider.notifier)
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
