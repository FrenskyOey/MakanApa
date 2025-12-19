import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:makanapa/core/extension/index.dart';
import 'package:makanapa/core/themes/dimens_constant.dart';
import 'package:makanapa/core/widgets/OptionItem.dart';
import 'package:makanapa/core/widgets/option_widget.dart';
import 'package:makanapa/core/widgets/state/screen_content.dart';
import 'package:makanapa/features/basket/presentation/main/components/basket_shimmer_loading2.dart';
import 'package:makanapa/features/basket/presentation/main/controllers/basket_bloc_controller.dart';
import 'package:makanapa/features/basket/presentation/main/controllers/state/basket_event.dart';
import 'package:makanapa/features/basket/presentation/main/controllers/state/basket_ui_state.dart';
import 'package:makanapa/features/basket/presentation/main/screens/basket_empty_page2.dart';

class BasketUpcomingScreen extends HookConsumerWidget {
  const BasketUpcomingScreen({super.key});

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
          return previous.state != current.state ||
              previous.upcomingData != current.upcomingData;
        },
        builder: (context, state) {
          return ScreenContent<String>(
            state: state.state,
            overlayLoading: false,
            loadingWidget: const BasketShimmerLoading2(),
            onRetry: () {
              reloadData();
            },
            successWidget: (data) {
              if (state.upcomingData.isEmpty) {
                return const BasketEmptyWidget2();
              } else {
                final upcomingData = state.upcomingData;

                return CustomScrollView(
                  slivers: [
                    const SliverToBoxAdapter(
                      child: SizedBox(height: Dimens.md),
                    ),

                    SliverList(
                      delegate: SliverChildBuilderDelegate((context, index) {
                        final item = upcomingData[index];
                        final startDate = item.startDate.toReadableDateWithDays;
                        final endDate = item.endDate.toReadableDateWithDays;

                        return OptionWidget(
                          item: OptionItem(
                            icon: Icons.calendar_month,
                            title: "$startDate - $endDate",
                            subtitle: "Senin s/d Minggu",
                            color: const Color.fromARGB(255, 43, 98, 45),
                          ),
                          onPressed: () {
                            context.read<BasketBloc>().add(
                              OpenDetailItemEvent(item),
                            );
                          },
                        );
                      }, childCount: upcomingData.length),
                    ),
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
