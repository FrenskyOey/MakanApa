import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:makanapa/core/extension/index.dart';
import 'package:makanapa/core/handlers/log/log_helper.dart';
import 'package:makanapa/core/helpers/snackbar_helper.dart';
import 'package:makanapa/core/states/data_state.dart';
import 'package:makanapa/core/widgets/state/error_state_widget.dart';
import 'package:makanapa/features/recipe/domain/models/recipe_detail.dart';
import 'package:makanapa/features/recipe/domain/models/recipe_item.dart';
import 'package:makanapa/features/recipe/presentation/detail/components/header_widget.dart';
import 'package:makanapa/features/recipe/presentation/detail/components/loading_shimmer.dart';
import 'package:makanapa/features/recipe/presentation/detail/components/recipe_detail_body.dart';
import 'package:makanapa/features/recipe/presentation/detail/controllers/detail_bloc_controller.dart';
import 'package:makanapa/features/recipe/presentation/detail/controllers/state/detail_effect.dart';
import 'package:makanapa/features/recipe/presentation/detail/controllers/state/detail_event.dart';
import 'package:makanapa/features/recipe/presentation/detail/controllers/state/detail_ui_state.dart';
import 'package:url_launcher/url_launcher.dart';

class RecipeDetailPage extends HookConsumerWidget {
  final RecipeItem recipeItem;
  final String? heroTag;

  const RecipeDetailPage({super.key, required this.recipeItem, this.heroTag});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Future<void> launchingUrl(String urlString) async {
      final Uri url = Uri.parse(urlString);
      if (!await launchUrl(url)) {
        LogHelper.error("Could not launch $urlString");
      }
    }

    useEffect(() {
      context.read<DetailBloc>().add(LoadDetailEvent(recipeItem.id));
      return null;
    }, const []);

    useEffect(() {
      final sub = context.read<DetailBloc>().sideEffects.listen((event) {
        event.maybeWhen(
          toastError: (error) {
            SnackBarHelper.showError(context, error);
          },
          toastSuccess: (message) {
            SnackBarHelper.showSuccess(context, message);
          },
          openUrlLink: (url) {
            //launchingUrl("https://id.shp.ee/7CR2q55");
            if (url.isNullOrEmpty) {
              SnackBarHelper.showError(context, "Data url tidak ditemukan");
              return;
            }

            launchingUrl(url);
          },
          orElse: () {},
        );
      });

      return sub.cancel; // Dispose subscription
    }, const []);

    Widget getWidgetBody(DataState<RecipeDetail> state) {
      if (state is Loading) {
        return const LoadingShimmerWidget();
      }

      if (state is Error) {
        final messages = (state as Error).message;
        return SliverToBoxAdapter(
          child: ErrorStateWidget(
            title: "Ada Masalah",
            subtitle: messages,
            buttonText: "Coba Lagi",
            onButtonPressed: () {
              context.read<DetailBloc>().add(LoadDetailEvent(recipeItem.id));
            },
          ),
        );
      }

      if (state is Success) {
        return const RecipeDetailBodyWidget();
      }

      return const SliverToBoxAdapter(child: SizedBox());
    }

    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<DetailBloc, DetailUiState>(
          listener: (context, state) {},
          buildWhen: (previous, current) {
            return previous.state != current.state;
          },
          builder: (context, state) {
            return CustomScrollView(
              slivers: [
                SliverPersistentHeader(
                  pinned: true,
                  delegate: HeaderWidget(
                    recipeItem: recipeItem,
                    onBack: () => Navigator.pop(context),
                    heroTag: heroTag,
                  ),
                ),
                getWidgetBody(state.state),
              ],
            );
          },
        ),
      ),
    );
  }
}
