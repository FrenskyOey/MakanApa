import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:makanapa/features/recipe/domain/models/class_enum.dart';
import 'package:makanapa/features/recipe/domain/models/dish_enum.dart';

part 'recipe_item.freezed.dart';

@freezed
abstract class RecipeItem with _$RecipeItem {
  const factory RecipeItem({
    @Default(0) int id,
    @Default("") String name,
    @Default("") String enName,
    @Default("") String picture,
    @Default(DishEnum.main) DishEnum dishType,
    @Default(ClassEnum.lainnya) ClassEnum classType,
    @Default("") String urlLinks,
  }) = _RecipeItem;
}
