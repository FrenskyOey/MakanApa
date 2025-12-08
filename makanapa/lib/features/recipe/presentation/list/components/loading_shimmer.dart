import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:makanapa/core/extension/index.dart';
import 'package:makanapa/core/themes/dimens_constant.dart';
import 'package:skeletonizer/skeletonizer.dart';

class LoadingShimmerWidget extends HookConsumerWidget {
  const LoadingShimmerWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Widget buildRecipeItem(int index) {
      final titles = [
        "Mediterranean Quinoa Salad",
        "Spicy Thai Peanut Noodles",
        "Avocado Toast with Egg",
        "Classic Beef Chili",
        "Mediterranean Quinoa Salad",
        "Spicy Thai Peanut Noodles",
        "Avocado Toast with Egg",
        "Classic Beef Chili",
      ];

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(12),
              ),
              // The Bone.icon is just a placeholder to give the shimmer some texture
              child: Bone.square(borderRadius: BorderRadius.circular(12)),
            ),
          ),

          Dimens.ms.space,
          // Title Text
          SizedBox(
            height: 50,
            child: Text(
              titles[index],
              style: context.titleMedium,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      );
    }

    // Helper widget to build the filter dropdowns
    Widget buildFilterChip(String label) {
      return Skeleton.leaf(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              Text(label, style: context.bodyLarge),
              const Icon(Icons.keyboard_arrow_down, size: 20),
            ],
          ),
        ),
      );
    }

    return Skeletonizer(
      enabled: true,
      enableSwitchAnimation: true,
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(Dimens.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Skeleton.leaf(
              child: Container(
                width: double.infinity,
                height: 44,
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            Dimens.md.space,
            // --- Header: Filters ---
            Text('Recipes', style: context.headlineLarge),
            Dimens.md.space,
            Row(children: [buildFilterChip('Italian')]),
            Dimens.md.space,
            // --- Section: Recipes ---
            Text('Recipes', style: context.headlineLarge),
            Dimens.md.space,
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 8,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 24,
                childAspectRatio: 0.75,
              ),
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
