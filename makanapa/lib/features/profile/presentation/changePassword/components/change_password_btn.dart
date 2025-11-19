import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:makanapa/features/profile/presentation/changePassword/controllers/change_password_controller.dart';

class ChangePasswordBtn extends HookConsumerWidget {
  const ChangePasswordBtn({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final buttonEnableState = ref.watch(
      changePasswordControllerProvider.select((value) => value.isSubmitAllowed),
    );

    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: buttonEnableState
            ? () {
                ref
                    .read(changePasswordControllerProvider.notifier)
                    .changePassword();
              }
            : null,
        child: const Text('Ubah'),
      ),
    );
  }
}
