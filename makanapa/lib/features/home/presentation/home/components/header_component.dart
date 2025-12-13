import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:makanapa/core/extension/index.dart';
import 'package:makanapa/core/themes/dimens_constant.dart';
import 'package:makanapa/features/profile/presentation/profileSetting/controllers/profile_controller.dart';

class HeaderComponentWidget extends HookConsumerWidget {
  const HeaderComponentWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userName = ref.watch(
      profileControllerProvider.select((value) => value.userData?.name),
    );

    return SliverToBoxAdapter(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Dimens.md.space,
          Text("Selamat Datang,  $userName", style: context.titleLarge),
          Dimens.ms.space,
          Text("Menu Makan Minggu Ini", style: context.titleMedium),
          Dimens.md.space,
        ],
      ),
    );
  }
}
