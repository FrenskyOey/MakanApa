import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:makanapa/core/widgets/OptionItem.dart';
import 'package:makanapa/core/widgets/option_widget.dart';
import 'package:makanapa/features/profile/presentation/profileSetting/controllers/profile_controller.dart';

class OptionListWidget extends HookConsumerWidget {
  const OptionListWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final types = ref.watch(
      profileControllerProvider.select((s) => s.userType),
    );

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        OptionWidget(
          item: OptionItem(
            icon: Icons.help,
            title: "About",
            subtitle: "Learn more about the app",
            color: const Color.fromARGB(255, 43, 98, 45),
          ),
          onPressed: () {
            ref.read(profileControllerProvider.notifier).openAboutUs();
          },
        ),
        if (types == 'email')
          OptionWidget(
            item: OptionItem(
              icon: Icons.key,
              title: "Change Password",
              subtitle: "Change your password",
              color: const Color.fromARGB(255, 69, 156, 72),
            ),
            onPressed: () {
              ref.read(profileControllerProvider.notifier).openChangePass();
            },
          ),
        OptionWidget(
          item: OptionItem(
            icon: Icons.exit_to_app,
            title: "Logout",
            subtitle: "",
            color: const Color.fromARGB(255, 90, 202, 93),
          ),
          onPressed: () {
            ref.read(profileControllerProvider.notifier).logout();
          },
        ),
      ],
    );
  }
}
