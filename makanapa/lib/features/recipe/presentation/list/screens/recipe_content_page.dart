import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
import 'package:makanapa/features/recipe/presentation/list/controllers/recipe_bloc_controller.dart';
import 'package:makanapa/features/recipe/presentation/list/controllers/state/recipe_list_effect.dart';
import 'package:makanapa/features/recipe/presentation/list/controllers/state/recipe_ui_event.dart';
import 'package:makanapa/features/recipe/presentation/list/controllers/state/recipe_ui_state.dart';

class RecipeContentPage extends HookConsumerWidget {
  const RecipeContentPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scrollController = useScrollController();

    void loadNextPage() async {
      if (!context.mounted) {
        return;
      }
      context.read<RecipeBloc>().add(LoadNextDataEvent());
    }

    void reloadData() async {
      if (!context.mounted) {
        return;
      }
      context.read<RecipeBloc>().add(ReloadRecipeDataEvent());
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
      final sub = context.read<RecipeBloc>().sideEffects.listen((event) {
        event.maybeWhen(
          toastError: (error) {
            SnackBarHelper.showError(context, error);
          },
          toastSuccess: (message) {
            SnackBarHelper.showSuccess(context, message);
          },
          openReceiptDetail: (item) {
            context.pushNamed(RouteNames.recipeDetailRecipe, extra: item);
          },
          openSearchRecipe: () {
            context.pushNamed(RouteNames.recipeSearch);
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
        child: BlocBuilder<RecipeBloc, RecipeUiState>(
          buildWhen: (p, c) {
            if (p.state != c.state ||
                p.showRefreshLoading != c.showRefreshLoading) {
              return true;
            }
            return false;
          },
          builder: (context, state) {
            return ScreenContent<String>(
              state: state.state,
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
                              isLoading: state.showRefreshLoading,
                              onRefresh: () {
                                context.read<RecipeBloc>().add(
                                  ReloadRecipeDataEvent(fromPullRefresh: true),
                                );
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
            );
          },
        ),
      ),
    );
  }
}
