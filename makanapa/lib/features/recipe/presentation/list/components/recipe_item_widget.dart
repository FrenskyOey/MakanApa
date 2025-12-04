import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:makanapa/core/extension/index.dart';
import 'package:makanapa/core/themes/dimens_constant.dart';
import 'package:makanapa/features/recipe/domain/models/recipe_item.dart';

class RecipeItemWidget extends HookConsumerWidget {
  const RecipeItemWidget({
    super.key,
    required this.item,
    required this.onRecipeClick,
  });

  final RecipeItem item;
  final Function(RecipeItem item) onRecipeClick;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(
      children: [
        Positioned.fill(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Hero(
                  tag: "recipe_${item.id}",
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
              Dimens.ms.space,
              // Title Text
              SizedBox(
                height: 50,
                child: Text(
                  item.name,
                  style: context.bodyLarge,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
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
