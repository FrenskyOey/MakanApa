import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:makanapa/core/configs/routes/route_names.dart';
import 'package:makanapa/core/extension/index.dart';
import 'package:makanapa/core/helpers/snackbar_helper.dart';
import 'package:makanapa/core/states/data_state.dart';
import 'package:makanapa/core/widgets/state/screen_content.dart';
import 'package:makanapa/features/home/domain/models/dashboard.dart';
import 'package:makanapa/features/home/presentation/home/controllers/home_controller.dart';
import 'package:makanapa/features/home/presentation/home/controllers/state/home_event_state.dart';
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
      await ref.read(homeControllerProvider.notifier).reloadDashboardData();
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
          orElse: () {},
        );
      });

      return sub.cancel; // Dispose subscription
    }, const []);

    final homeUiState = ref.watch(homeControllerProvider);

    DataState<Dashboard> screenState = Initial();

    // Use the statement to assign the value
    if (homeUiState.hideLoading == false) {
      screenState = Loading();
    } else if (homeUiState.errorMessages.isNotNullOrEmpty) {
      screenState = Error(homeUiState.errorMessages!);
    } else if (homeUiState.dashboardData != null) {
      screenState = Success(homeUiState.dashboardData!);
    }

    return Scaffold(
      body: SafeArea(
        child: ScreenContent(
          state: screenState,
          successWidget: (data) {
            return SizedBox.expand(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      final items = data.avaiblityItems;
                      if (items.isEmpty) {
                        return;
                      }
                      ref
                          .read(mainControllerProvider.notifier)
                          .openAvaiblityBottomSheet(data.avaiblityItems);
                    },
                    child: const Text('Buat Planning'),
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
