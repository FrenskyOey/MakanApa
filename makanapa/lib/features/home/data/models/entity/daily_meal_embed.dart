import 'package:isar_community/isar.dart';
import 'package:makanapa/features/home/domain/models/daily_meal.dart';
import 'package:makanapa/features/recipe/data/models/entity/embed_recipe_model.dart';

part 'daily_meal_embed.g.dart';

@embedded
class DailyMealEmbed {
  late DateTime times;
  RecipeEmbedModel? lunch;
  RecipeEmbedModel? dinner;

  DailyMealEmbed();

  factory DailyMealEmbed.fromEntity(DailyMeal entity) {
    return DailyMealEmbed()
      ..times = entity.times
      ..lunch = entity.lunch != null
          ? RecipeEmbedModel.fromEntity(entity.lunch!, false)
          : null
      ..dinner = entity.dinner != null
          ? RecipeEmbedModel.fromEntity(entity.dinner!, false)
          : null;
  }

  DailyMeal toDomain() {
    return DailyMeal(
      times: times,
      lunch: lunch?.toDomain(),
      dinner: dinner?.toDomain(),
    );
  }
}
