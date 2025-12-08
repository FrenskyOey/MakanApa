import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:makanapa/core/extension/index.dart';
import 'package:makanapa/core/themes/app_color.dart';
import 'package:makanapa/core/themes/dimens_constant.dart';
import 'package:makanapa/features/recipe/presentation/list/controllers/recipe_bloc_controller.dart';
import 'package:makanapa/features/recipe/presentation/list/controllers/state/recipe_ui_event.dart';

class SearchRecipeWidget extends HookConsumerWidget {
  const SearchRecipeWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        margin: EdgeInsets.zero,
        child: InkWell(
          borderRadius: BorderRadius.circular(Dimens.ms),
          onTap: () {
            context.read<RecipeBloc>().add(OpenSearchRecipeEvent());
          },
          child: Padding(
            padding: EdgeInsetsGeometry.all(Dimens.ms),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.search, color: AppColor.primary),
                Dimens.sm.space,
                Text("Cari Resep", style: context.bodyMedium),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
