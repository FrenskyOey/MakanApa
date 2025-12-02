import 'package:makanapa/features/recipe/domain/models/recipe_item.dart';

class RecipePage {
  final List<RecipeItem> data;
  final int nextCursor;
  final int limit;
  final int dataCounter;

  const RecipePage({
    required this.data,
    required this.nextCursor,
    required this.limit,
    required this.dataCounter,
  });
}
