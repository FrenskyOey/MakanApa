import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:makanapa/core/extension/index.dart';
import 'package:makanapa/core/themes/dimens_constant.dart';
import 'package:skeletonizer/skeletonizer.dart';

class LoadingShimmerWidget extends HookConsumerWidget {
  const LoadingShimmerWidget({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
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

    // 5. Individual List Item Widget
    Widget buildFoodItem(String foodName) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Text Info Side
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Slight alignment adjustment
                Text(
                  foodName,
                  style: context.bodyLarge,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  "Utama . Italians",
                  style: TextStyle(
                    fontSize: 14, // Match the green in image
                  ),
                ),
              ],
            ),
          ),

          // Image Side
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Container(
              width: 100,
              height: 70,
              color: Colors.grey[300],
            ), // Placeholder for skeleton
          ),
        ],
      );
    }

    return Skeletonizer(
      enabled: true,
      enableSwitchAnimation: true,
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: Dimens.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: titles.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: Dimens.ms),
                  child: buildFoodItem(titles[index]),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
