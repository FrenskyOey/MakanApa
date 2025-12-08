import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:makanapa/features/recipe/presentation/search/controllers/search_bloc_controller.dart';
import 'package:makanapa/features/recipe/presentation/search/screens/search_page.dart';
import 'package:makanapa/features/recipe/provider/recipe_provider.dart';

class SearchProviderScreen extends HookConsumerWidget {
  const SearchProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cari Resep')),
      body: SafeArea(
        child: BlocProvider(
          create: (context) {
            return SearchBloc(repository: ref.read(recipeRepositoryProvider));
          },
          child: const SearchPage(),
        ),
      ),
    );
  }
}
