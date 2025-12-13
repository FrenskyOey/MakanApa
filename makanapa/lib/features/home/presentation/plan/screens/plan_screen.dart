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
import 'package:makanapa/core/widgets/state/screen_content.dart';
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
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ref.read(planControllerProvider.notifier).loadData(groupId);
      });
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

    return Scaffold(
      appBar: AppBar(title: Text("Detail Menu")),
      body: SafeArea(
        child: ScreenContent(
          // To Do Shimmering loading
          state: state,
          successWidget: (data) {
            return SizedBox.expand(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Menu Detail Screen", style: context.titleLarge),
                  Dimens.xxl.space,
                  Icon(
                    Icons.phonelink_erase,
                    size: 80,
                    color: context.secondary,
                  ),
                  Dimens.xxl.space,
                  GradientText("COMING SOON"),
                  Dimens.xxl.space,
                ],
              ),
            );
          },
          onRetry: () {
            ref.read(planControllerProvider.notifier).loadData(groupId);
          },
        ),
      ),
    );
  }
}
