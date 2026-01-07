import 'package:equatable/equatable.dart';
import 'package:makanapa/features/recipe/domain/models/recipe_item.dart';

class DailyMeal extends Equatable {
  final DateTime times;
  final RecipeItem? lunch;
  final RecipeItem? dinner;

  const DailyMeal({required this.times, this.lunch, this.dinner});

  @override
  List<Object?> get props => [times, lunch, dinner];
}
