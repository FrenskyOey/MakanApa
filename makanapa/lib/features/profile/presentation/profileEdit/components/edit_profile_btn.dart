import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:makanapa/features/profile/presentation/profileEdit/controllers/profile_edit_controller.dart';

class EditProfileBtn extends HookConsumerWidget {
  const EditProfileBtn({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final buttonEnableState = ref.watch(
      profileEditControllerProvider.select((value) => value.isSubmitAllowed),
    );

    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: buttonEnableState
            ? () {
                ref
                    .read(profileEditControllerProvider.notifier)
                    .changeProfile();
              }
            : null,
        child: const Text('Ubah'),
      ),
    );
  }
}
