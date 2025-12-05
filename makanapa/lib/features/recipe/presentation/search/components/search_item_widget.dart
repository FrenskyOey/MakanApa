import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:makanapa/core/extension/index.dart';
import 'package:makanapa/core/themes/dimens_constant.dart';
import 'package:makanapa/features/recipe/domain/models/recipe_item.dart';

class SearchItemWidget extends HookConsumerWidget {
  final RecipeItem item;
  final Function(RecipeItem item) onRecipeClick;

  const SearchItemWidget({
    super.key,
    required this.item,
    required this.onRecipeClick,
  });
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Dimens.md,
            vertical: Dimens.ms,
          ),
          child: Row(
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
                      item.name,
                      style: context.bodyLarge,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      item.enName,
                      style: context.labelMedium?.copyWith(
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "${item.dishType.description} . ${item.classType.description}",
                      style: context.labelMedium,
                    ),
                  ],
                ),
              ),
              Dimens.md.space,
              SizedBox(
                width: 100,
                height: 70,
                child: Hero(
                  tag: "search_recipe_${item.id}",
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: CachedNetworkImage(
                      imageUrl: item.picture,
                      fit: BoxFit.cover,
                      placeholder: (context, url) =>
                          Container(color: Colors.grey[200]),
                      errorWidget: (context, url, error) => Container(
                        width: double.infinity,
                        color: Colors.grey[200],
                        child: const Icon(
                          Icons.broken_image,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),

        Positioned.fill(
          child: Material(
            color: Colors.transparent, // Must be transparent
            child: InkWell(
              borderRadius: BorderRadius.circular(12),
              onTap: () {
                onRecipeClick(item);
              },
            ),
          ),
        ),
      ],
    );
  }
}
