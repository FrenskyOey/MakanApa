import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:makanapa/core/themes/dimens_constant.dart';
import 'package:makanapa/core/widgets/state/empty_state_widget.dart';
import 'package:makanapa/features/recipe/presentation/list/components/recipe_item_widget.dart';
import 'package:makanapa/features/recipe/presentation/list/controllers/recipe_bloc_controller.dart';
import 'package:makanapa/features/recipe/presentation/list/controllers/state/recipe_ui_event.dart';
import 'package:makanapa/features/recipe/presentation/list/controllers/state/recipe_ui_state.dart';

class RecipeBodyWidget extends HookConsumerWidget {
  const RecipeBodyWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BlocBuilder<RecipeBloc, RecipeUiState>(
      buildWhen: (p, c) {
        if (p.recipeList != c.recipeList) {
          return true;
        }
        return false;
      },
      builder: (context, state) {
        final (recipeData) = state.recipeList;

        if (recipeData.isEmpty) {
          return SliverToBoxAdapter(
            child: const EmptyStateWidget(
              title: "Perhatian",
              subtitle: "Data makanan kosong",
            ),
          );
        }

        return SliverPadding(
          padding: const EdgeInsets.fromLTRB(0, Dimens.md, Dimens.sm, 0),
          sliver: SliverGrid(
            delegate: SliverChildBuilderDelegate((context, index) {
              final items = recipeData[index];
              return RecipeItemWidget(
                item: items,
                onRecipeClick: (item) {
                  context.read<RecipeBloc>().add(OpenDetailPageEvent(item));
                },
              );
            }, childCount: recipeData.length),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 24,
              childAspectRatio: 0.75,
            ),
          ),
        );
      },
    );
  }
}
