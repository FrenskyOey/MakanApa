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

  CreateItem copyWith({
    int? indexes,
    RecipeItem? lunchItem,
    RecipeItem? dinnerItem,
  }) {
    return CreateItem(
      indexes: indexes ?? this.indexes,
      date: date,
      lunchItem: lunchItem,
      dinnerItem: dinnerItem,
    );
  }
}
