import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:makanapa/core/extension/index.dart';
import 'package:makanapa/core/themes/dimens_constant.dart';
import 'package:makanapa/features/home/presentation/plan/components/plan_item.dart';
import 'package:makanapa/features/home/presentation/plan/controllers/plan_controller.dart';

class PlanBodyWidget extends HookConsumerWidget {
  const PlanBodyWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dataItem = ref.watch(
      planControllerProvider.select((value) => value.data),
    );

    if (dataItem == null) {
      return Container();
    }

    final dailyMeal = dataItem.meals;

    return CustomScrollView(
      slivers: [
        for (var item in dailyMeal) PlanItemWidget(item: item),
        SliverToBoxAdapter(child: Dimens.lg.space),
      ],
    );
  }
}
