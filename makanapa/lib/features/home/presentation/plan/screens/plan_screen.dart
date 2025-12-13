import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:makanapa/core/extension/index.dart';
import 'package:makanapa/core/helpers/snackbar_helper.dart';
import 'package:makanapa/core/states/data_state.dart';
import 'package:makanapa/core/themes/dimens_constant.dart';
import 'package:makanapa/core/widgets/gradient_text.dart';
import 'package:makanapa/core/widgets/state/error_state_widget.dart';
import 'package:makanapa/core/widgets/state/loading_state_widget.dart';
import 'package:makanapa/features/home/domain/models/weekly_plan.dart';
import 'package:makanapa/features/home/presentation/plan/controllers/plan_controller.dart';
import 'package:makanapa/features/home/presentation/plan/controllers/state/plan_event_state.dart';

class PlanScreen extends HookConsumerWidget {
  final int groupId;

  const PlanScreen({super.key, required this.groupId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(
      planControllerProvider.select((value) => (value.state)),
    );

    useEffect(() {
      ref.read(planControllerProvider.notifier).loadData(groupId);
      return null;
    }, const []);

    useEffect(() {
      final sub = ref.read(planControllerProvider.notifier).events.listen((
        event,
      ) {
        event.maybeWhen(
          toastError: (error) {
            SnackBarHelper.showError(context, error);
          },
          toastSuccess: (message) {
            SnackBarHelper.showSuccess(context, message);
          },
          openRecipeDetail: (item) {
            // coming soons
          },
          orElse: () {},
        );
      });

      return sub.cancel; // Dispose subscription
    }, const []);

    Widget getWidgetBody(DataState<WeeklyPlan> state) {
      if (state is Loading) {
        return const LoadingStateWidget();
      }

      if (state is Error) {
        final messages = (state as Error).message;
        return SliverToBoxAdapter(
          child: ErrorStateWidget(
            title: "Ada Masalah",
            subtitle: messages,
            buttonText: "Coba Lagi",
            onButtonPressed: () {
              ref.read(planControllerProvider.notifier).loadData(groupId);
            },
          ),
        );
      }

      if (state is Success) {
        return SliverToBoxAdapter(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Menu Detail Screen"),
              Dimens.xxl.space,
              Icon(Icons.phonelink_erase, size: 80, color: context.secondary),
              Dimens.xxl.space,
              GradientText("COMING SOON"),
              Dimens.xxl.space,
            ],
          ),
        );
      }
      return const SliverToBoxAdapter(child: SizedBox());
    }

    return Scaffold(
      appBar: AppBar(title: Text("Detail Menu")),
      body: SafeArea(child: CustomScrollView(slivers: [getWidgetBody(state)])),
    );
  }
}
