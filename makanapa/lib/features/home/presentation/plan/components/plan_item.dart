import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:makanapa/core/extension/index.dart';
import 'package:makanapa/core/themes/dimens_constant.dart';
import 'package:makanapa/features/home/domain/models/daily_meal.dart';
import 'package:makanapa/features/home/presentation/create/components/form_header.dart';
import 'package:makanapa/features/home/presentation/plan/controllers/plan_controller.dart';
import 'package:makanapa/features/recipe/domain/models/recipe_item.dart';

class PlanItemWidget extends HookConsumerWidget {
  const PlanItemWidget({super.key, required this.item});
  final DailyMeal item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hasLunch = item.lunch != null;
    final hasDinner = item.dinner != null;
    final hasContent = hasLunch || hasDinner;

    return SliverMainAxisGroup(
      slivers: <Widget>[
        SliverPersistentHeader(
          pinned: true,
          delegate: FormHeaderContainer(
            child: Container(
              height: 50,
              color: context.surface,
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(left: Dimens.md),
              child: Text(
                item.times.toReadableDate(),
                style: context.titleMedium,
              ),
            ),
          ),
        ),

        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: Dimens.md),
            child: hasContent
                ? Column(
                    children: [
                      Dimens.sm.space,
                      if (hasLunch)
                        _RecipeCard(
                          recipe: item.lunch!,
                          mealTypeLabel: "Siang",
                          onItemClick: (recipe) {
                            ref
                                .read(planControllerProvider.notifier)
                                .toDetailrecipe(recipe);
                          },
                        ),

                      if (hasLunch && hasDinner) Dimens.md.space,

                      if (hasDinner)
                        _RecipeCard(
                          recipe: item.dinner!,
                          mealTypeLabel: "Malam",
                          onItemClick: (recipe) {
                            ref
                                .read(planControllerProvider.notifier)
                                .toDetailrecipe(recipe);
                          },
                        ),

                      Dimens.sm.space,
                    ],
                  )
                : _NoContentPlaceholder(),
          ),
        ),
      ],
    );
  }
}

class _NoContentPlaceholder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      alignment: Alignment.centerLeft,
      child: Text("Kosong", style: context.titleMedium),
    );
  }
}

class _RecipeCard extends StatelessWidget {
  final RecipeItem recipe;
  final String mealTypeLabel;
  final Function(RecipeItem recipe) onItemClick;

  const _RecipeCard({
    required this.recipe,
    required this.mealTypeLabel,
    required this.onItemClick,
  });

  @override
  Widget build(BuildContext context) {
    String cuisine = recipe.classType.description;
    if (cuisine.isNotEmpty) {
      cuisine = cuisine[0].toUpperCase() + cuisine.substring(1);
    }

    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: () {
        onItemClick(recipe);
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: SizedBox(
              height: 70,
              child: Align(
                alignment: AlignmentGeometry.centerLeft,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      recipe.name,
                      style: context.titleMedium,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Dimens.sm.space,
                    Text(
                      "$mealTypeLabel · $cuisine",
                      style: context.labelMedium,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Dimens.md.space,
          SizedBox(
            width: 100,
            height: 70,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Hero(
                tag: "plan_${recipe.id}",
                child: CachedNetworkImage(
                  imageUrl: recipe.picture,
                  fit: BoxFit.cover,
                  placeholder: (context, url) =>
                      Container(color: Colors.grey[200]),
                  errorWidget: (context, url, error) => Container(
                    width: double.infinity,
                    color: Colors.grey[200],
                    child: const Icon(Icons.broken_image, color: Colors.grey),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
