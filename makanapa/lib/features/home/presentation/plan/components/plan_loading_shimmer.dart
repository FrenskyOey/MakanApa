import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:makanapa/core/extension/index.dart';
import 'package:makanapa/core/themes/dimens_constant.dart';
import 'package:skeletonizer/skeletonizer.dart';

class PlanLoadingShimmerWidget extends HookConsumerWidget {
  const PlanLoadingShimmerWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Widget buildRecipeItem(int index) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 50,
            color: context.surface,
            alignment: Alignment.centerLeft,
            child: Text("XXXX - 01 Dec 2025", style: context.headlineSmall),
          ),
          Dimens.ms.space,
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Recipes",
                      style: context.titleMedium,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Dimens.sm.space,
                    Text("mealType . Cuisine", style: context.labelMedium),
                  ],
                ),
              ),
              Dimens.md.space,
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  width: 100,
                  height: 70,
                  color: Colors.grey[300],
                ), // Placeholder for skeleton
              ),
            ],
          ),
        ],
      );
    }

    return Skeletonizer(
      enabled: true,
      enableSwitchAnimation: true,
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(Dimens.md, 0, Dimens.md, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 7,
              itemBuilder: (context, index) {
                return buildRecipeItem(index);
              },
            ),
          ],
        ),
      ),
    );
  }
}
