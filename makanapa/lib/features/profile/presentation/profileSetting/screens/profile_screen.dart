import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:makanapa/core/configs/routes/route_names.dart';
import 'package:makanapa/core/extension/index.dart';
import 'package:makanapa/core/helpers/snackbar_helper.dart';
import 'package:makanapa/core/themes/dimens_constant.dart';
import 'package:makanapa/features/onboarding/domain/models/user.dart';
import 'package:makanapa/features/profile/presentation/profileSetting/components/app_version_widget.dart';
import 'package:makanapa/features/profile/presentation/profileSetting/components/option_list_widget.dart';
import 'package:makanapa/features/profile/presentation/profileSetting/components/profile_widget.dart';
import 'package:makanapa/features/profile/presentation/profileSetting/controllers/profile_controller.dart';
import 'package:makanapa/features/profile/presentation/profileSetting/controllers/state/profile_event_state.dart';

class ProfileScreen extends HookConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void openEditProfilePage(UserData user) async {
      final UserData? result = await context.pushNamed(
        RouteNames.profileEdit,
        extra: user,
      );
      await Future.delayed(Duration(seconds: 1));
      if (!context.mounted || result == null) {
        return;
      }
      SnackBarHelper.showSuccess(context, "Profile berhasil diupdate");
    }

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

    useEffect(() {
      final sub = ref.read(profileControllerProvider.notifier).events.listen((
        event,
      ) {
        event.maybeWhen(
          openAboutUs: () {
            context.pushNamed(RouteNames.faq);
          },
          openChangePassword: () {
            context.pushNamed(RouteNames.changePassword);
          },
          openEditProfile: (userData) {
            openEditProfilePage(userData);
          },
          orElse: () {},
        );
      });

      return sub.cancel; // Dispose subscription
    }, const []);

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
                const OptionListWidget(),
                Dimens.md.space,
                const AppVersionWidget(),
              ],
            ),
          ).paddingAll(Dimens.sm),
        ),
      ),
    );
  }
}
