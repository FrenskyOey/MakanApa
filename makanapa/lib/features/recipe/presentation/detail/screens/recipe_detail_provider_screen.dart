import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:makanapa/features/recipe/domain/models/recipe_item.dart';
import 'package:makanapa/features/recipe/presentation/detail/controllers/detail_bloc_controller.dart';
import 'package:makanapa/features/recipe/presentation/detail/screens/recipe_detail_page.dart';
import 'package:makanapa/features/recipe/provider/recipe_provider.dart';

class RecipeDetailProviderScreen extends HookConsumerWidget {
  final RecipeItem recipeItem;
  final String? heroTag;

  const RecipeDetailProviderScreen({
    super.key,
    required this.recipeItem,
    this.heroTag,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider(
          create: (context) {
            return DetailBloc(repository: ref.read(recipeRepositoryProvider));
          },
          child: RecipeDetailPage(recipeItem: recipeItem, heroTag: heroTag),
        ),
      ),
    );
  }
}
