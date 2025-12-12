import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:makanapa/core/configs/routes/route_names.dart';
import 'package:makanapa/core/extension/index.dart';
import 'package:makanapa/core/helpers/snackbar_helper.dart';
import 'package:makanapa/core/states/data_state.dart';
import 'package:makanapa/core/themes/dimens_constant.dart';
import 'package:makanapa/core/widgets/state/screen_content.dart';
import 'package:makanapa/features/home/presentation/home/components/body_component.dart';
import 'package:makanapa/features/home/presentation/home/components/divider_component.dart';
import 'package:makanapa/features/home/presentation/home/components/header_component.dart';
import 'package:makanapa/features/home/presentation/home/components/upcoming_component.dart';
import 'package:makanapa/features/home/presentation/home/controllers/home_controller.dart';
import 'package:makanapa/features/home/presentation/home/controllers/state/home_event_state.dart';
import 'package:makanapa/features/profile/presentation/profileSetting/controllers/profile_controller.dart';
import 'package:makanapa/features/shared/main/main_controller.dart';
import 'package:makanapa/features/shared/main/state/main_event.dart';

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void reloadData() async {
      if (!context.mounted) {
        return;
      }
      ref.read(homeControllerProvider.notifier).reloadDashboardData();
      ref.read(profileControllerProvider.notifier).reloadProfileData();
    }

    useEffect(() {
      final sub = ref.read(mainControllerProvider.notifier).events.listen((
        event,
      ) {
        event.maybeWhen(
          avaibilityBottomSheetResult: (type) {
            ref.read(homeControllerProvider.notifier).createPlans(type);
          },
          orElse: () {},
        );
      });

      return sub.cancel; // Dispose subscription
    }, const []);

    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        reloadData();
      });
      return null;
    }, []);

    useEffect(() {
      final sub = ref.read(homeControllerProvider.notifier).events.listen((
        event,
      ) {
        event.maybeWhen(
          toastError: (error) {
            SnackBarHelper.showError(context, error);
          },
          toastSuccess: (success) {},
          openCreatePlan: (item) {
            context.pushNamed(RouteNames.createPlan, extra: item);
          },
          openRecipeDetail: (item) {
            context.pushNamed(RouteNames.recipeDetailHome, extra: item);
          },
          openPlanDetail: (groupId) {
            context.pushNamed(RouteNames.planDetail, extra: groupId);
          },
          orElse: () {},
        );
      });

      return sub.cancel; // Dispose subscription
    }, const []);

    final (hideLoading, errorMessage) = ref.watch(
      homeControllerProvider.select(
        (value) => (value.hideLoading, value.errorMessages),
      ),
    );

    DataState<String> screenState = Initial();

    if (hideLoading == false) {
      screenState = Loading();
    } else if (errorMessage.isNotNullOrEmpty) {
      screenState = Error(errorMessage!);
    } else {
      screenState = Success("");
    }

    return Scaffold(
      appBar: AppBar(title: Text("Makan Apa")),
      body: SafeArea(
        child: ScreenContent(
          state: screenState,
          successWidget: (data) {
            return SizedBox.expand(
              child: CustomScrollView(
                slivers: [
                  SliverPadding(
                    padding: EdgeInsetsGeometry.symmetric(
                      horizontal: Dimens.md,
                    ),
                    sliver: const HeaderComponentWidget(),
                  ),
                  const BodyComponentWidget(),
                  SliverPadding(
                    padding: EdgeInsetsGeometry.symmetric(
                      horizontal: Dimens.md,
                    ),
                    sliver: const DividerComponentWidget(),
                  ),

                  SliverPadding(
                    padding: EdgeInsetsGeometry.symmetric(
                      horizontal: Dimens.md,
                    ),
                    sliver: const UpcomingComponentWidget(),
                  ),
                ],
              ),
            );
          },
          onRetry: () {
            reloadData();
          },
        ),
      ),
    );
  }
}
