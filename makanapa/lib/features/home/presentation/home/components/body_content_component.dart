import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:makanapa/core/constants/color_filter_constant.dart';
import 'package:makanapa/core/extension/index.dart';
import 'package:makanapa/core/themes/dimens_constant.dart';
import 'package:makanapa/features/home/domain/models/daily_meal.dart';
import 'package:makanapa/features/home/presentation/home/controllers/home_controller.dart';
import 'package:makanapa/features/recipe/domain/models/recipe_item.dart';

class BodyContentComponentWidget extends HookConsumerWidget {
  final DailyMeal dailyMeal;
  const BodyContentComponentWidget({super.key, required this.dailyMeal});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final mealDate = DateTime(
      dailyMeal.times.year,
      dailyMeal.times.month,
      dailyMeal.times.day,
    );
    final isPast = mealDate.isBefore(today);

    Widget buildRecipeTile(
      BuildContext context,
      RecipeItem item,
      String mealType,
    ) {
      Widget image = CachedNetworkImage(
        imageUrl: item.picture,
        width: double.infinity,
        fit: BoxFit.cover,
        placeholder: (context, url) => Container(color: Colors.grey[200]),
        errorWidget: (context, url, error) => Container(
          width: double.infinity,
          color: Colors.grey[200],
          child: const Icon(Icons.broken_image, color: Colors.grey),
        ),
      );

      if (isPast) {
        image = ColorFiltered(colorFilter: grayScaleFilter, child: image);
      }

      return Card(
        elevation: 0,
        margin: EdgeInsets.zero,
        // margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        child: Stack(
          children: [
            SizedBox.expand(
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                  bottomLeft: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                ),
                child: Hero(tag: "home_${item.id}", child: image),
              ),
            ),

            Align(
              alignment: AlignmentGeometry.bottomLeft,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                  bottomLeft: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                ),
                child: Container(
                  width: double.infinity,
                  color: Colors.black.withValues(alpha: 0.5),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Dimens.sm.space,
                      Padding(
                        padding: const EdgeInsets.fromLTRB(
                          Dimens.ms,
                          0,
                          Dimens.ms,
                          Dimens.xs,
                        ),
                        child: Text(
                          item.name,
                          style: context.titleMedium?.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(
                          Dimens.ms,
                          0,
                          Dimens.ms,
                          Dimens.xs,
                        ),
                        child: Text(
                          "$mealType . ${item.classType.description}",
                          style: context.labelMedium?.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ),

                      Dimens.sm.space,
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget buildType2Layout(
      BuildContext context,
      RecipeItem lunch,
      RecipeItem dinner,
    ) {
      return Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                ref.read(homeControllerProvider.notifier).toDetailrecipe(lunch);
              },
              child: buildRecipeTile(context, lunch, "Siang"),
            ),
          ),
          Dimens.md.space,
          Expanded(
            child: GestureDetector(
              onTap: () {
                ref
                    .read(homeControllerProvider.notifier)
                    .toDetailrecipe(dinner);
              },
              child: buildRecipeTile(context, dinner, "Malam"),
            ),
          ),
        ],
      );
    }

    Widget buildType1Layout(
      BuildContext context,
      RecipeItem item, {
      required bool isLunch,
    }) {
      return Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                ref.read(homeControllerProvider.notifier).toDetailrecipe(item);
              },
              child: buildRecipeTile(
                context,
                item,
                isLunch ? "Siang" : "Malam",
              ),
            ),
          ),
        ],
      );
    }

    Widget buildNoDataLayout() {
      return Card(
        elevation: 0,
        margin: EdgeInsets.zero,
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Center(child: Text("Kosong", style: context.titleMedium)),
        ),
      );
    }

    Widget buildComponents() {
      final lunch = dailyMeal.lunch;
      final dinner = dailyMeal.dinner;

      // Type-2: Both Lunch and Dinner are available
      if (lunch != null && dinner != null) {
        return buildType2Layout(context, lunch, dinner);
      }
      // Type-1: Only Lunch is available
      else if (lunch != null) {
        return buildType1Layout(context, lunch, isLunch: true);
      }
      // Type-1: Only Dinner is available
      else if (dinner != null) {
        return buildType1Layout(context, dinner, isLunch: false);
      }
      // No Data: Both are null
      else {
        return buildNoDataLayout();
      }
    }

    return SizedBox.expand(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(Dimens.sm, Dimens.ms, Dimens.ms, 0),
        child: buildComponents(),
      ),
    );
  }
}
