import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:makanapa/core/extension/index.dart';
import 'package:makanapa/core/themes/dimens_constant.dart';
import 'package:skeletonizer/skeletonizer.dart';

class BasketShimmerLoading2 extends HookConsumerWidget {
  const BasketShimmerLoading2({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Widget buildSkeletonItem() {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: Dimens.sm),
        child: Skeleton.leaf(
          child: Container(
            width: double.infinity,
            height: 70,
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      );
    }

    return Skeletonizer(
      enabled: true,
      enableSwitchAnimation: true,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Dimens.md.space,
          buildSkeletonItem(),
          buildSkeletonItem(),
          buildSkeletonItem(),
          buildSkeletonItem(),
          Dimens.sm.space,
        ],
      ),
    );
  }
}
