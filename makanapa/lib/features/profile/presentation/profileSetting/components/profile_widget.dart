import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:makanapa/core/extension/index.dart';
import 'package:makanapa/core/themes/dimens_constant.dart';
import 'package:makanapa/core/widgets/image/avatar_image.dart';
import 'package:makanapa/features/profile/presentation/profileSetting/controllers/profile_controller.dart';

class ProfileWidget extends HookConsumerWidget {
  const ProfileWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userData = ref.watch(
      profileControllerProvider.select((value) => value.userData),
    );

    final showLoading = ref.watch(
      profileControllerProvider.select((value) => value.showLoading),
    );

    if (userData == null) {
      return SizedBox();
    }
    return Stack(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: AvatarImage(
                src: userData.avatar,
                name: userData.name,
                size: AvatarSize.large,
              ),
            ),

            Dimens.md.space,
            Center(
              child: Text(
                userData.name,
                style: context.titleMedium,
                textAlign: TextAlign.center,
              ),
            ),
            Dimens.xs.space,
            Center(
              child: Text(
                userData.email,
                style: context.bodyMedium,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
        if (showLoading)
          Positioned(
            top: 0,
            right: 0,
            child: const SizedBox(
              height: 20,
              width: 20,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: Colors.green,
              ),
            ).paddingHorizontal(Dimens.lg),
          ),
      ],
    );
  }
}
