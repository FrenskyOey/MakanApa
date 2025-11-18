import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:makanapa/features/profile/presentation/profileSetting/components/option_widget.dart';
import 'package:makanapa/features/profile/presentation/profileSetting/controllers/profile_controller.dart';
import 'package:makanapa/features/profile/presentation/profileSetting/model/OptionItem.dart';

class OptionContentWidget extends HookConsumerWidget {
  const OptionContentWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
