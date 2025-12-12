import 'package:makanapa/features/recipe/domain/models/recipe_item.dart';

class CreateItem {
  final int indexes;
  final DateTime date;
  final RecipeItem? lunchItem;
  final RecipeItem? dinnerItem;

  const CreateItem({
    required this.indexes,
    required this.date,
    this.lunchItem,
    this.dinnerItem,
  });

  CreateItem copyWith({RecipeItem? lunchItem, RecipeItem? dinnerItem}) {
    return CreateItem(
      indexes: indexes,
      date: date,
      lunchItem: lunchItem,
      dinnerItem: dinnerItem,
    );
  }
}
