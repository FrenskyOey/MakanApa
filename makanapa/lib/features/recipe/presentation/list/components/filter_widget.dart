import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:makanapa/core/extension/index.dart';
import 'package:makanapa/core/themes/dimens_constant.dart';
import 'package:makanapa/features/recipe/presentation/list/controllers/recipe_bloc_controller.dart';
import 'package:makanapa/features/recipe/presentation/list/controllers/state/recipe_ui_event.dart';
import 'package:makanapa/features/recipe/presentation/list/controllers/state/recipe_ui_state.dart';
import 'package:makanapa/features/shared/main/main_controller.dart';
import 'package:makanapa/features/shared/main/state/main_event.dart';

class FilterWidget extends HookConsumerWidget {
  const FilterWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(() {
      final sub = ref.read(mainControllerProvider.notifier).events.listen((
        event,
      ) {
        event.maybeWhen(
          typeBottomSheetResult: (type) {
            context.read<RecipeBloc>().add(ChangeFilterDataEvent(type));
          },
          orElse: () {},
        );
      });

      return sub.cancel; // Dispose subscription
    }, const []);

    return Material(
      color: context.primary,
      borderRadius: BorderRadius.circular(8),
      clipBehavior: Clip.hardEdge,

      child: BlocBuilder<RecipeBloc, RecipeUiState>(
        buildWhen: (p, c) {
          if (p.currentFilter != c.currentFilter) {
            return true;
          }
          return false;
        },
        builder: (context, state) {
          String filters = state.currentFilter ?? "";

          if (filters == "bookmark") {
            filters = "Favorite";
          }

          return InkWell(
            onTap: () {
              ref
                  .read(mainControllerProvider.notifier)
                  .openTypeBottomSheet(filters);
            },
            child: SizedBox(
              width: 110,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(
                  Dimens.sm,
                  Dimens.xs,
                  Dimens.xs,
                  Dimens.xs,
                ),
                child: Row(
                  children: [
                    Text(
                      filters.isEmpty ? "Pilih Tipe" : filters,
                      style: context.bodyMedium?.copyWith(color: Colors.white),
                    ),

                    Expanded(child: Container()),
                    const Icon(
                      Icons.keyboard_arrow_down,
                      size: 20,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
