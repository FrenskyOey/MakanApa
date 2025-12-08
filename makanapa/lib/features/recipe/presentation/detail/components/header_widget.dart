import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:makanapa/core/extension/index.dart';
import 'package:makanapa/features/recipe/domain/models/recipe_item.dart';
import 'package:makanapa/features/recipe/presentation/detail/controllers/detail_bloc_controller.dart';
import 'package:makanapa/features/recipe/presentation/detail/controllers/state/detail_event.dart';
import 'package:makanapa/features/recipe/presentation/detail/controllers/state/detail_ui_state.dart';

class HeaderWidget extends SliverPersistentHeaderDelegate {
  final RecipeItem recipeItem;
  final VoidCallback onBack;
  final String? heroTag;

  // Configuration
  final double expandedHeight = 300.0;
  final double collapsedHeight = 90.0; // As per your request

  HeaderWidget({required this.recipeItem, required this.onBack, this.heroTag});

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    // 0.0 = Fully Expanded, 1.0 = Fully Collapsed
    final double progress = shrinkOffset / (maxExtent - minExtent);

    // Calculate Opacity for the App Bar Title
    // We only show it when we are 80% collapsed
    final double titleOpacity = (progress > 0.2) ? 1.0 : 0.0;

    return Stack(
      fit: StackFit.expand,
      children: [
        // 1. BACKGROUND IMAGE (With Hero)
        // We use a shader mask or container color to darken it as it shrinks
        Hero(
          tag: heroTag ?? "pictures",
          child: CachedNetworkImage(
            imageUrl: recipeItem.picture,
            fit: BoxFit.cover,
            placeholder: (context, url) => Container(color: Colors.grey[200]),
            errorWidget: (context, url, error) => Container(
              width: double.infinity,
              color: Colors.grey[200],
              child: const Icon(Icons.broken_image, color: Colors.grey),
            ),
          ),
        ),

        Container(
          color: Colors.black.withValues(alpha: (progress + 0.5) * 0.4),
        ),

        // 3. APP BAR ELEMENTS (Pinned)
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Container(
            padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
            height:
                kToolbarHeight +
                MediaQuery.of(context).padding.top, // Standard Toolbar height
            child: BlocBuilder<DetailBloc, DetailUiState>(
              buildWhen: (p, c) {
                return p.bookMarkState != c.bookMarkState;
              },
              builder: (context, state) {
                return NavigationToolbar(
                  leading: IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: onBack,
                  ),

                  middle: AnimatedOpacity(
                    duration: const Duration(milliseconds: 200),
                    opacity: titleOpacity,
                    child: Text(
                      recipeItem.name,
                      style: context.titleMedium?.copyWith(color: Colors.white),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),

                  // TRAILING: Bookmark Button
                  trailing: IconButton(
                    icon: Icon(
                      state.bookMarkState
                          ? Icons.bookmark
                          : Icons.bookmark_border,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      context.read<DetailBloc>().add(
                        ToggleBookmarkEvent(recipeItem.id),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => collapsedHeight; // Stops at 100

  @override
  bool shouldRebuild(covariant HeaderWidget oldDelegate) {
    return oldDelegate.recipeItem != recipeItem;
  }
}
