import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:makanapa/core/extension/index.dart';
import 'package:makanapa/core/helpers/snackbar_helper.dart';
import 'package:makanapa/core/themes/dimens_constant.dart';
import 'package:makanapa/features/profile/presentation/profileSetting/components/option_content_widget.dart';
import 'package:makanapa/features/profile/presentation/profileSetting/components/profile_widget.dart';
import 'package:makanapa/features/profile/presentation/profileSetting/controllers/profile_controller.dart';
import 'package:makanapa/features/profile/presentation/profileSetting/controllers/state/profile_event_state.dart';

class ProfileScreen extends HookConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(profileControllerProvider.select((value) => value.eventState), (
      prev,
      next,
    ) {
      next.maybeWhen(
        openAboutUs: () {
          // TO DO
          SnackBarHelper.showError(context, "Not ready yet");
        },
        openChangePassword: () {
          // TO DO
          SnackBarHelper.showError(context, "Not ready yet");
        },
        openEditProfile: (userData) {
          // TO DO
          SnackBarHelper.showError(context, "Not ready yet");
        },
        logout: () {
          // TO DO
          SnackBarHelper.showError(context, "Not ready yet");
        },
        orElse: () {},
      );
      ref.read(profileControllerProvider.notifier).resetState();
    });

    void reloadData() async {
      if (!context.mounted) {
        return;
      }

      await ref.read(profileControllerProvider.notifier).reloadProfileData();
    }

    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        reloadData();
      });
      return null;
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pengaturan'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.edit, size: 20.0),
            color: context.secondary,
            onPressed: () {
              ref.read(profileControllerProvider.notifier).openEditProfile();
            },
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Dimens.md.space,
                const ProfileWidget(),
                Dimens.lg.space,
                const OptionContentWidget(),
                Dimens.xxl.space,
                Text(
                  '© 2025 MakanApa. All Rights Reserved.',
                  style: context.labelMedium,
                  textAlign: TextAlign.center,
                ),
                Dimens.xs.space,
                Text(
                  'Version 1.0.0 - Staging',
                  style: context.labelSmall,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ).paddingAll(Dimens.sm),
        ),
      ),
    );
  }
}
