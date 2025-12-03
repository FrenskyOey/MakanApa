import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:makanapa/core/extension/index.dart';
import 'package:makanapa/core/themes/dimens_constant.dart';
import 'package:makanapa/features/recipe/presentation/list/controllers/recipe_controller.dart';

class SearchRecipeWidget extends HookConsumerWidget {
  const SearchRecipeWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        margin: EdgeInsets.zero,
        child: InkWell(
          borderRadius: BorderRadius.circular(Dimens.ms),
          onTap: () {
            ref.read(recipeControllerProvider.notifier).openSearchRecipe();
          },
          child: Padding(
            padding: EdgeInsetsGeometry.all(Dimens.ms),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.search, color: context.textPrimary),
                Dimens.sm.space,
                Text("Cari Resep", style: context.bodyMedium),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
