import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:makanapa/features/recipe/presentation/list/controllers/recipe_bloc_controller.dart';
import 'package:makanapa/features/recipe/presentation/list/screens/recipe_content_page.dart';
import 'package:makanapa/features/recipe/provider/recipe_provider.dart';

class RecipeProviderScreen extends HookConsumerWidget {
  const RecipeProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider(
          create: (context) {
            return RecipeBloc(repository: ref.read(recipeRepositoryProvider));
          },
          child: const RecipeContentPage(),
        ),
      ),
    );
  }
}
