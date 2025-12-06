import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:makanapa/core/extension/index.dart';
import 'package:makanapa/core/themes/dimens_constant.dart';
import 'package:makanapa/features/recipe/presentation/list/controllers/recipe_bloc_controller.dart';
import 'package:makanapa/features/recipe/presentation/list/controllers/state/recipe_ui_state.dart';

class BottomLoadingWidget extends HookConsumerWidget {
  const BottomLoadingWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BlocBuilder<RecipeBloc, RecipeUiState>(
      buildWhen: (p, c) {
        if (p.showPageLoading != c.showPageLoading) {
          return true;
        }
        return false;
      },
      builder: (context, state) {
        final isLoading = state.showPageLoading;
        if (isLoading) {
          return Positioned(
            bottom: 0, // Distance from bottom
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 12),
              decoration: BoxDecoration(color: context.primary),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: Colors.white,
                    ),
                  ),
                  Dimens.md.space,
                  Text(
                    "Mohon Tunggu...",
                    style: context.bodyMedium?.copyWith(color: Colors.white),
                  ),
                ],
              ),
            ),
          );
        } else {
          return Positioned(
            bottom: 0, // Distance from bottom
            left: 0,
            right: 0,
            child: Container(),
          );
        }
      },
    );
  }
}
