import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:makanapa/core/configs/routes/route_names.dart';
import 'package:makanapa/core/extension/index.dart';
import 'package:makanapa/core/helpers/snackbar_helper.dart';
import 'package:makanapa/core/themes/app_color.dart';
import 'package:makanapa/core/themes/dimens_constant.dart';
import 'package:makanapa/core/widgets/state/error_state_widget.dart';
import 'package:makanapa/features/recipe/domain/models/recipe_item.dart';
import 'package:makanapa/features/recipe/presentation/search/components/loading_shimmer.dart';
import 'package:makanapa/features/recipe/presentation/search/components/search_item_body.dart';
import 'package:makanapa/features/recipe/presentation/search/controllers/search_bloc_controller.dart';
import 'package:makanapa/features/recipe/presentation/search/controllers/state/search_effect.dart';
import 'package:makanapa/features/recipe/presentation/search/controllers/state/search_event.dart';
import 'package:makanapa/features/recipe/presentation/search/controllers/state/search_ui_state.dart';

class SearchPage extends HookConsumerWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = useMemoized(() => GlobalKey<FormState>());
    final searchController = useTextEditingController();

    void openDetailPage(RecipeItem item) async {
      await context.pushNamed(RouteNames.recipeDetailSearch, extra: item);
      if (!context.mounted) {
        return;
      }
      context.pop();
    }

    useEffect(() {
      context.read<SearchBloc>().add(SearchRecipeEvent(""));
      return null;
    }, const []);

    useEffect(() {
      final sub = context.read<SearchBloc>().sideEffects.listen((event) {
        event.maybeWhen(
          toastError: (error) {
            SnackBarHelper.showError(context, error);
          },
          openDetailPage: (item) {
            openDetailPage(item);
          },
          orElse: () {},
        );
      });

      return sub.cancel; // Dispose subscription
    }, const []);

    Widget getBodyWidget(SearchUiState states) {
      if (states.isInitial) {
        return const SizedBox();
      }

      if (states.isLoading) {
        return const LoadingShimmerWidget();
      }

      if (states.errorMessage.isNotNullOrEmpty) {
        return LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: ErrorStateWidget(
                  title: "Perhatian",
                  subtitle: "Gagal mendapatkan data",
                  buttonText: "Coba Lagi",
                  onButtonPressed: () {
                    context.read<SearchBloc>().add(
                      SearchRecipeEvent(searchController.text),
                    );
                  },
                ),
              ),
            );
          },
        );
      }

      return const SearchItemBodyWidget();
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Dimens.md.space,
        Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: Dimens.md),
            child: Column(
              children: [
                TextFormField(
                  controller: searchController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search, color: AppColor.primary),
                    labelText: null,
                    hintText: 'Cari Resep',
                    errorText: null,
                  ),
                  keyboardType: TextInputType.name,
                  textInputAction: TextInputAction.done,
                  onChanged: (input) {
                    context.read<SearchBloc>().add(SearchRecipeEvent(input));
                  },
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
              ],
            ),
          ),
        ),
        Dimens.sm.space,
        Expanded(
          child: BlocBuilder<SearchBloc, SearchUiState>(
            buildWhen: (previous, current) {
              if (previous.isInitial != current.isInitial ||
                  previous.isLoading != current.isLoading ||
                  previous.errorMessage != current.errorMessage) {
                return true;
              }
              return false;
            },
            builder: (context, state) {
              return getBodyWidget(state);
            },
          ),
        ),
      ],
    );
  }
}
