import 'package:flutter/material.dart';
import 'package:makanapa/core/themes/app_color.dart';
import 'package:makanapa/features/basket/presentation/main/components/base_group_item.dart';
import 'package:makanapa/features/basket/presentation/main/controllers/state/basket_ui_state.dart';

class MeatGroupItem extends BaseGroupItem {
  const MeatGroupItem({super.key});

  @override
  bool checkRebuild(BasketUiState previous, BasketUiState current) {
    return previous.meatBasket != current.meatBasket;
  }

  @override
  Color getBaseColor() {
    return AppColor.error;
  }

  @override
  List getItemGroup(BasketUiState state) {
    return state.meatBasket;
  }

  @override
  String getTitle() {
    return "Daging";
  }
}

/*
    @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BlocBuilder<BasketBloc, BasketUiState>(
      buildWhen: checkRebuild,
      builder: (context, state) {
        final basketGroup = getItemGroup(state);
        final baseColor = getBaseColor();

        return SliverMainAxisGroup(
          slivers: <Widget>[
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.fromLTRB(
                  Dimens.md,
                  getTopPadding(),
                  Dimens.lg,
                  Dimens.sm,
                ),
                child: Row(
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
                        ),
                      ),
                    ),
                  ],
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
            const SliverToBoxAdapter(child: SizedBox(height: Dimens.md)),
          ],
        );
      },
    );
  }
}*/
