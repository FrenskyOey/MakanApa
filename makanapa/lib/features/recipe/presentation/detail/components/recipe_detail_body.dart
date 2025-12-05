import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:makanapa/core/extension/index.dart';
import 'package:makanapa/core/states/data_state.dart';
import 'package:makanapa/core/themes/dimens_constant.dart';
import 'package:makanapa/features/recipe/domain/models/recipe_detail.dart';
import 'package:makanapa/features/recipe/presentation/detail/controllers/detail_bloc_controller.dart';
import 'package:makanapa/features/recipe/presentation/detail/controllers/state/detail_event.dart';
import 'package:makanapa/features/recipe/presentation/detail/controllers/state/detail_ui_state.dart';

class RecipeDetailBodyWidget extends HookConsumerWidget {
  final DetailBloc bloc;

  const RecipeDetailBodyWidget({super.key, required this.bloc});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BlocBuilder<DetailBloc, DetailUiState>(
      bloc: bloc,
      buildWhen: (p, c) {
        if (c.state is Success) {
          return true;
        }
        return false;
      },
      builder: (context, state) {
        final RecipeDetail recipeDetail = (state.state as Success).data;
        final recipe = recipeDetail.recipe;
        final ingredients = recipeDetail.ingredients;

        return SliverMainAxisGroup(
          slivers: <Widget>[
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: Dimens.md),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Dimens.md.space,
                    Text(recipe.name, style: context.titleLarge),
                    Dimens.sm.space,
                    Text(
                      '${recipe.dishType.description} . ${recipe.classType.description}',
                      style: context.labelMedium,
                    ),
                    Dimens.md.space,
                    Text('Bahan', style: context.titleMedium),
                    Dimens.md.space,
                  ],
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                final item = ingredients[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: Dimens.md),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.radio_button_checked,
                            size: 20,
                            color: context.primary,
                          ),
                          Dimens.md.space,
                          Text(
                            "${item.qty} ${item.unit} ${item.name}",
                            style: context.bodyLarge,
                          ),
                        ],
                      ),
                      Dimens.md.space,
                    ],
                  ),
                );
              }, childCount: ingredients.length),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: Dimens.md),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      bloc.add(OpenUrlEvent(recipe.urlLinks));
                    },
                    child: const Text('Liat Cara Masak'),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
