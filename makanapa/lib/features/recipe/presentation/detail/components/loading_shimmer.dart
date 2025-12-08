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

    return SliverMainAxisGroup(
      slivers: <Widget>[
        SliverToBoxAdapter(
          child: Skeletonizer(
            enabled: true,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: Dimens.md),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Dimens.md.space,
                  Text('Title of foods', style: context.displaySmall),
                  Dimens.sm.space,
                  Text('Main Dish . Itallian', style: context.labelLarge),
                  Dimens.md.space,
                  Text('Ingredients', style: context.titleLarge),
                  Dimens.md.space,
                  ListView.builder(
                    padding: EdgeInsets.zero, // Remove top/bottom padding
                    shrinkWrap:
                        true, // <--- 1. Calculates height based on children
                    physics:
                        const NeverScrollableScrollPhysics(), // <--- 2. Disables internal scrolling
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.radio_button_off_rounded,
                                size: 20,
                              ),
                              Dimens.md.space,
                              Text(titles[index], style: context.bodyLarge),
                            ],
                          ),
                          Dimens.md.space,
                        ],
                      );
                    },
                  ),
                  Skeleton.leaf(
                    child: Container(
                      width: double.infinity,
                      height: 38,
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  ),
                  Dimens.md.space,
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
