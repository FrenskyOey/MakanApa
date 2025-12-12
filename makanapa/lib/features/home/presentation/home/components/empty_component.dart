import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:makanapa/core/extension/index.dart';
import 'package:makanapa/core/themes/dimens_constant.dart';
import 'package:makanapa/features/home/presentation/home/controllers/home_controller.dart';
import 'package:makanapa/features/shared/main/main_controller.dart';

class EmptyComponentWidget extends HookConsumerWidget {
  const EmptyComponentWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SliverToBoxAdapter(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 230,
            child: Image.asset(
              "assets/images/empty_mascots.png",
              fit: BoxFit.fitWidth,
            ).paddingAll(Dimens.md),
          ),
          Text("Sepertinya kamu belum membuat menu", style: context.titleSmall),
          Dimens.lg.space,
          ElevatedButton(
            onPressed: () {
              final avaibleData = ref
                  .read(homeControllerProvider)
                  .dashboardData
                  ?.avaiblityItems;

              if (avaibleData == null || avaibleData.isEmpty) {
                return;
              }
              ref
                  .read(mainControllerProvider.notifier)
                  .onAvaiblitySelected(avaibleData.first);
            },
            child: const Text('Buat Menu Sekarang'),
          ),
        ],
      ),
    );
  }
}
