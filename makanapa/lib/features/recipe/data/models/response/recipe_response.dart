import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:makanapa/features/recipe/domain/models/class_enum.dart';
import 'package:makanapa/features/recipe/domain/models/dish_enum.dart';
import 'package:makanapa/features/recipe/domain/models/recipe_item.dart';

part 'recipe_response.freezed.dart';
part 'recipe_response.g.dart';

@freezed
abstract class RecipeResponse with _$RecipeResponse {
  const RecipeResponse._();

  const factory RecipeResponse({
    @JsonKey(name: 'id', defaultValue: 0) required int id,
    @JsonKey(name: 'name', defaultValue: '') required String name,
    @JsonKey(name: 'en_name', defaultValue: '') required String enName,
    @JsonKey(name: 'reseptype', defaultValue: '') required String resepType,
    @JsonKey(name: 'classtype', defaultValue: '') required String classType,
    @JsonKey(name: 'picture', defaultValue: '') required String picture,
  }) = _RecipeResponse;

  RecipeItem toDomain() {
    return RecipeItem(
      id: id,
      name: name,
      enName: enName,
      picture: picture,
      dishType: DishEnum.fromDescription(resepType),
      classType: ClassEnum.fromDescription(classType),
    );
  }

  factory RecipeResponse.fromJson(Map<String, dynamic> json) =>
      _$RecipeResponseFromJson(json);
}
