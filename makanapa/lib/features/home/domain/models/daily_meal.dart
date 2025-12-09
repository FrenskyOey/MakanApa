import 'package:makanapa/features/recipe/domain/models/recipe_item.dart';

class DailyMeal {
  final DateTime times;
  final RecipeItem? lunch;
  final RecipeItem? dinner;

  const DailyMeal({required this.times, this.lunch, this.dinner});
}
