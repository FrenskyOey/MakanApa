import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:makanapa/core/themes/dimens_constant.dart';
import 'package:makanapa/core/widgets/state/screen_content.dart';
import 'package:makanapa/features/basket/presentation/main/screens/basket_empty_page.dart';
import 'package:makanapa/features/basket/presentation/main/components/basket_shimmer_loading.dart';
import 'package:makanapa/features/basket/presentation/main/components/meat_group_item.dart';
import 'package:makanapa/features/basket/presentation/main/components/other_group_item.dart';
import 'package:makanapa/features/basket/presentation/main/components/veg_group_item.dart';
import 'package:makanapa/features/basket/presentation/main/controllers/basket_bloc_controller.dart';
import 'package:makanapa/features/basket/presentation/main/controllers/state/basket_event.dart';
import 'package:makanapa/features/basket/presentation/main/controllers/state/basket_ui_state.dart';

class BasketMainScreen extends HookConsumerWidget {
  const BasketMainScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void reloadData() async {
      if (!context.mounted) {
        return;
      }
      context.read<BasketBloc>().add(LoadMainDataEvent());
    }

    return SizedBox.expand(
      child: BlocConsumer<BasketBloc, BasketUiState>(
        listener: (context, state) {},
        buildWhen: (previous, current) {
          return previous.state != current.state;
        },
        builder: (context, state) {
          return ScreenContent<String>(
            state: state.state,
            overlayLoading: false,
            onRetry: () {
              reloadData();
            },
            loadingWidget: const BasketShimmerLoading(),
            successWidget: (data) {
              if (state.isEmpty) {
                return const BasketEmptyWidget();
              } else {
                return const CustomScrollView(
                  slivers: [
                    VegetableGroupItem(),
                    MeatGroupItem(),
                    OtherGroupItem(),
                    SliverToBoxAdapter(child: SizedBox(height: Dimens.md)),
                  ],
                );
              }
            },
          );
        },
      ),
    );
  }
}
