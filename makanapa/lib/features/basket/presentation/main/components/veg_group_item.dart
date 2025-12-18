import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:makanapa/core/extension/index.dart';
import 'package:makanapa/core/themes/app_color.dart';
import 'package:makanapa/core/themes/dimens_constant.dart';
import 'package:makanapa/features/basket/presentation/main/components/shopping_list_item.dart';
import 'package:makanapa/features/basket/presentation/main/controllers/basket_bloc_controller.dart';
import 'package:makanapa/features/basket/presentation/main/controllers/state/basket_event.dart';
import 'package:makanapa/features/basket/presentation/main/controllers/state/basket_ui_state.dart';

class VegetableGroupItem extends HookConsumerWidget {
  const VegetableGroupItem({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BlocBuilder<BasketBloc, BasketUiState>(
      buildWhen: (previous, current) {
        return previous.vegetableBasket != current.vegetableBasket;
      },
      builder: (context, state) {
        final basketGroup = state.vegetableBasket;
        return SliverMainAxisGroup(
          slivers: <Widget>[
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(
                  Dimens.md,
                  Dimens.md,
                  Dimens.lg,
                  Dimens.sm,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Sayuran", style: context.titleMedium),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: Dimens.md,
                        vertical: Dimens.xs,
                      ),
                      decoration: BoxDecoration(
                        color: AppColor.primary,
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
                  itemColor: AppColor.primary,
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
}
