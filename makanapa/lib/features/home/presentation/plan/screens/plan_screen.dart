import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:makanapa/core/configs/routes/route_names.dart';
import 'package:makanapa/core/helpers/snackbar_helper.dart';
import 'package:makanapa/core/widgets/state/screen_content.dart';
import 'package:makanapa/features/home/presentation/plan/components/plan_body.dart';
import 'package:makanapa/features/home/presentation/plan/components/plan_loading_shimmer.dart';
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
            context.pushNamed(RouteNames.recipeDetailPlan, extra: item);
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
          loadingWidget: const PlanLoadingShimmerWidget(),
          successWidget: (data) {
            return const PlanBodyWidget();
          },
          onRetry: () {
            ref.read(planControllerProvider.notifier).loadData(groupId);
          },
        ),
      ),
    );
  }
}
