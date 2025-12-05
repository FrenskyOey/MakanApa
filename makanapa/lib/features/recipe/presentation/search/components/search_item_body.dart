import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:makanapa/core/themes/dimens_constant.dart';
import 'package:makanapa/core/widgets/state/empty_state_widget.dart';
import 'package:makanapa/features/recipe/presentation/search/components/search_item_widget.dart';
import 'package:makanapa/features/recipe/presentation/search/controllers/search_bloc_controller.dart';
import 'package:makanapa/features/recipe/presentation/search/controllers/state/search_event.dart';
import 'package:makanapa/features/recipe/presentation/search/controllers/state/search_ui_state.dart';

class SearchItemBodyWidget extends HookConsumerWidget {
  final SearchBloc bloc;
  const SearchItemBodyWidget({super.key, required this.bloc});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BlocBuilder<SearchBloc, SearchUiState>(
      bloc: bloc,
      buildWhen: (p, c) {
        if (p.results != c.results || p.isEmpty != c.isEmpty) {
          return true;
        }
        return false;
      },
      builder: (context, state) {
        if (state.isEmpty) {
          return const EmptyStateWidget(
            title: "Perhatian",
            subtitle: "Data tidak ditemukkan",
          );
        }

        final stateList = state.results;
        return ListView.builder(
          padding: const EdgeInsets.symmetric(vertical: Dimens.md),
          itemCount: stateList.length,
          itemBuilder: (context, index) {
            final item = stateList[index];
            return SearchItemWidget(
              item: item,
              onRecipeClick: (item) {
                bloc.add(OpenDetailRecipeEvent(item));
              },
            );
          },
        );
      },
    );
  }
}
