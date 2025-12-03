import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:makanapa/core/extension/index.dart';
import 'package:makanapa/core/themes/dimens_constant.dart';
import 'package:makanapa/features/recipe/presentation/list/components/filter_widget.dart';

class RecipeHeaderWidget extends HookConsumerWidget {
  const RecipeHeaderWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SliverToBoxAdapter(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Dimens.xs.space,
          Text('Filter', style: context.titleLarge),
          Dimens.md.space,
          const FilterWidget(),
          Dimens.md.space,
          Text('Resep', style: context.titleLarge),
        ],
      ),
    );
  }
}
