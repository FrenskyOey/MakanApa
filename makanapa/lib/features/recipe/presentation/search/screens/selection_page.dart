import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:makanapa/features/recipe/domain/models/recipe_item.dart';
import 'package:makanapa/features/recipe/presentation/search/screens/search_page.dart';

class SelectionPage extends SearchPage {
  const SelectionPage({super.key});

  @override
  void onItemSelected(BuildContext context, RecipeItem item) async {
    context.pop(item);
  }
}
