import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:makanapa/core/configs/routes/route_names.dart';
import 'package:makanapa/core/extension/index.dart';
import 'package:makanapa/core/helpers/snackbar_helper.dart';
import 'package:makanapa/core/themes/dimens_constant.dart';
import 'package:makanapa/core/widgets/state/screen_content.dart';
import 'package:makanapa/core/widgets/state_refresh_indicator.dart';
import 'package:makanapa/features/recipe/presentation/list/components/bottom_loading_widget.dart';
import 'package:makanapa/features/recipe/presentation/list/components/loading_shimmer.dart';
import 'package:makanapa/features/recipe/presentation/list/components/recipe_body_widget.dart';
import 'package:makanapa/features/recipe/presentation/list/components/recipe_header_widget.dart';
import 'package:makanapa/features/recipe/presentation/list/components/search_recipe_widget.dart';
import 'package:makanapa/features/recipe/presentation/list/controllers/recipe_controller.dart';
import 'package:makanapa/features/recipe/presentation/list/controllers/state/recipe_event_state.dart';

class RecipeScreen extends HookConsumerWidget {
  const RecipeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final (screenState, refreshState) = ref.watch(
      recipeControllerProvider.select(
        (value) => (value.state, value.showRefreshLoading),
      ),
    );

    final scrollController = useScrollController();

    void loadNextPage() async {
      if (!context.mounted) {
        return;
      }

      await ref.read(recipeControllerProvider.notifier).loadNextData();
    }

    void reloadData() async {
      if (!context.mounted) {
        return;
      }

      await ref.read(recipeControllerProvider.notifier).reloadRecipeData();
    }

    void onScroll() {
      final scrollThreshold = scrollController.position.maxScrollExtent - 200;
      if (scrollThreshold <= 0) {
        return;
      }
      if (scrollController.position.pixels >= scrollThreshold) {
        loadNextPage();
      }
    }

    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        reloadData();
      });
      return null;
    }, []);

    useEffect(() {
      final sub = ref.read(recipeControllerProvider.notifier).events.listen((
        event,
      ) {
        event.maybeWhen(
          toastError: (error) {
            SnackBarHelper.showError(context, error);
          },
          toastSuccess: (message) {
            SnackBarHelper.showSuccess(context, message);
          },
          openReceiptDetail: (item) {
            context.pushNamed(RouteNames.recipeDetail, extra: item);
          },
          openSearchRecipe: () {
            SnackBarHelper.showWarning(context, "Belum Ready");
          },
          orElse: () {},
        );
      });

      return sub.cancel; // Dispose subscription
    }, const []);

    useEffect(() {
      scrollController.addListener(onScroll);
      return () => scrollController.removeListener(onScroll);
    }, const []);

    return Scaffold(
      body: SafeArea(
        child: ScreenContent<String>(
          state: screenState,
          overlayLoading: false,
          onRetry: () {
            reloadData();
          },
          loadingWidget: const LoadingShimmerWidget(),
          successWidget: (data) {
            return Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(
                    Dimens.ms,
                    Dimens.ms,
                    Dimens.ms,
                    0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SearchRecipeWidget(),
                      Dimens.ms.space,
                      Expanded(
                        child: StateRefreshIndicator(
                          isLoading: refreshState,
                          onRefresh: () {
                            ref
                                .read(recipeControllerProvider.notifier)
                                .reloadRecipeData(fromPullRefresh: true);
                          },
                          child: CustomScrollView(
                            controller: scrollController,
                            slivers: [
                              const RecipeHeaderWidget(),
                              const RecipeBodyWidget(),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const BottomLoadingWidget(),
              ],
            );
          },
        ),
      ),
    );
  }
}
