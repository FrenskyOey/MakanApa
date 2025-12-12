import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:makanapa/features/recipe/presentation/search/controllers/search_bloc_controller.dart';
import 'package:makanapa/features/recipe/presentation/search/model/search_enum.dart';
import 'package:makanapa/features/recipe/provider/recipe_provider.dart';
import 'package:makanapa/features/recipe/presentation/search/screens/search_page.dart';
import 'package:makanapa/features/recipe/presentation/search/screens/selection_page.dart';

class SearchProviderScreen extends HookConsumerWidget {
  final SearchType type;
  const SearchProviderScreen({super.key, this.type = SearchType.search});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String titleBar = type == SearchType.search
        ? "Cari Resep"
        : "Pilih Resep";

    return Scaffold(
      appBar: AppBar(title: Text(titleBar)),
      body: SafeArea(
        child: BlocProvider(
          create: (context) {
            return SearchBloc(repository: ref.read(recipeRepositoryProvider));
          },
          child: type == SearchType.search
              ? const SearchPage()
              : SelectionPage(),
        ),
      ),
    );
  }
}
