import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:makanapa/core/extension/index.dart';
import 'package:makanapa/core/themes/dimens_constant.dart';
import 'package:makanapa/features/basket/presentation/main/components/shopping_list_item.dart';
import 'package:makanapa/features/basket/presentation/main/controllers/basket_bloc_controller.dart';
import 'package:makanapa/features/basket/presentation/main/controllers/state/basket_event.dart';
import 'package:makanapa/features/basket/presentation/main/controllers/state/basket_ui_state.dart';

abstract class BaseGroupItem extends HookConsumerWidget {
  const BaseGroupItem({super.key});

  /// Returns the title of the group section.
  String getTitle();

  /// Returns the list of items for this group from the state.
  List<dynamic> getItemGroup(BasketUiState state);

  /// Returns the primary color for this group.
  Color getBaseColor();

  /// Determines whether the widget should rebuild when the state changes.
  bool checkRebuild(BasketUiState previous, BasketUiState current);

  /// Returns the top padding for the group header. Defaults to 0.
  double getTopPadding() => 0.0;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BlocBuilder<BasketBloc, BasketUiState>(
      buildWhen: checkRebuild,
      builder: (context, state) {
        final basketGroup = getItemGroup(state);
        final baseColor = getBaseColor();

        if (basketGroup.isEmpty) {
          return const SliverToBoxAdapter(child: SizedBox.shrink());
        }

        return SliverMainAxisGroup(
          slivers: <Widget>[
            SliverPersistentHeader(
              pinned: true,
              delegate: _GroupHeaderDelegate(
                child: Container(
                  color: context.surface,
                  height: 50,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(Dimens.md, 0, Dimens.lg, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(getTitle(), style: context.titleMedium),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: Dimens.md,
                            vertical: Dimens.xs,
                          ),
                          decoration: BoxDecoration(
                            color: baseColor,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            '${basketGroup.length} jenis',
                            style: context.labelLarge?.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                final item = basketGroup[index];
                return ShoppingListItem(
                  item: item,
                  itemColor: baseColor,
                  onPressed: () {
                    context.read<BasketBloc>().add(
                      MarkingItemEvent(!item.isMarked, item.groupId, item.id),
                    );
                  },
                );
              }, childCount: basketGroup.length),
            ),
          ],
        );
      },
    );
  }
}

class _GroupHeaderDelegate extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final double maxHeight;
  final Widget child;

  _GroupHeaderDelegate({
    required this.child,
    this.minHeight = 50.0,
    this.maxHeight = 50.0,
  });

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return SizedBox.expand(child: child);
  }

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => maxHeight;

  @override
  bool shouldRebuild(_GroupHeaderDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}
