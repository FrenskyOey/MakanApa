import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:makanapa/core/extension/index.dart';
import 'package:makanapa/core/themes/dimens_constant.dart';
import 'package:makanapa/features/home/presentation/home/components/empty_component.dart';
import 'package:makanapa/features/home/presentation/home/controllers/home_controller.dart';

class BodyComponentWidget extends HookConsumerWidget {
  const BodyComponentWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentPlan = ref.watch(
      homeControllerProvider.select(
        (value) => value.dashboardData?.currentPlan,
      ),
    );

    if (currentPlan == null) {
      return const EmptyComponentWidget();
    }

    return SliverToBoxAdapter(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("Datanya ada cuy", style: context.titleSmall),
          Dimens.lg.space,
        ],
      ),
    );
  }
}
