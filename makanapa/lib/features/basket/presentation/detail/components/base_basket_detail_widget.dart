import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:makanapa/core/themes/dimens_constant.dart';
import 'package:makanapa/core/widgets/state/screen_content.dart';
import 'package:makanapa/features/basket/presentation/detail/components/basket_detail_empty_widget.dart';
import 'package:makanapa/features/basket/presentation/detail/components/basket_detail_loading_widget.dart';
import 'package:makanapa/features/basket/presentation/detail/controllers/basket_detail_bloc_controller.dart';
import 'package:makanapa/features/basket/presentation/detail/controllers/state/basket_detail_event.dart';
import 'package:makanapa/features/basket/presentation/detail/controllers/state/basket_detail_ui_state.dart';
import 'package:makanapa/features/basket/presentation/main/components/shopping_list_item.dart';

abstract class BaseBasketDetailWidget extends HookConsumerWidget {
  const BaseBasketDetailWidget({super.key});

  /// Returns the specific list of items (e.g. vegetableBasket, meatBasket) from the state.
  List<dynamic> getBasketGroup(BasketDetailUiState state);

  /// Returns the color theme for the items in this section.
  Color getBaseColor();

  /// Determines if the widget should rebuild based on previous and current state.
  /// This corresponds to the `buildWhen` logic specific to the basket group.
  bool checkRebuildItem(
    BasketDetailUiState previous,
    BasketDetailUiState current,
  );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BlocBuilder<BasketDetailBloc, BasketDetailUiState>(
      buildWhen: (previous, current) {
        return previous.state != current.state ||
            checkRebuildItem(previous, current);
      },
      builder: (context, state) {
        final uiState = state.state;
        final basketGroup = getBasketGroup(state);

        return ScreenContent<String>(
          state: uiState,
          overlayLoading: false,
          onRetry: () {
            if (state.detailData != null) {
              context.read<BasketDetailBloc>().add(
                LoadDetailEvent(state.detailData!),
              );
            }
          },
          loadingWidget: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 0,
              horizontal: Dimens.md,
            ),
            child: const BasketDetailLoadingWidget(),
          ),
          successWidget: (data) {
            if (basketGroup.isEmpty) {
              return const BasketDetailEmptyWidget();
            } else {
              return CustomScrollView(
                slivers: [
                  const SliverToBoxAdapter(child: SizedBox(height: Dimens.md)),
                  SliverList(
                    delegate: SliverChildBuilderDelegate((context, index) {
                      final item = basketGroup[index];
                      return ShoppingListItem(
                        item: item,
                        itemColor: getBaseColor(),
                        onPressed: () {
                          context.read<BasketDetailBloc>().add(
                            MarkingItemEvent(
                              !item.isMarked,
                              item.groupId,
                              item.id,
                            ),
                          );
                        },
                      );
                    }, childCount: basketGroup.length),
                  ),
                  const SliverToBoxAdapter(child: SizedBox(height: Dimens.md)),
                ],
              );
            }
          },
        );
      },
    );
  }
}
