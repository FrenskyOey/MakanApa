import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:makanapa/features/home/domain/models/daily_meal.dart';
import 'package:intl/intl.dart';
import 'package:makanapa/features/recipe/data/models/response/recipe_response.dart';

part 'daily_meal_response.freezed.dart';
part 'daily_meal_response.g.dart';

@freezed
abstract class DailyMealResponse with _$DailyMealResponse {
  const DailyMealResponse._();

  const factory DailyMealResponse({
    @JsonKey(name: 'date', defaultValue: "") required String date,
    @JsonKey(name: 'lunch', defaultValue: null) RecipeResponse? lunch,
    @JsonKey(name: 'dinner', defaultValue: null) RecipeResponse? dinner,
  }) = _DailyMealResponse;

  DailyMeal toDomain() {
    return DailyMeal(
      times: parseDate(date),
      lunch: lunch?.toDomain(),
      dinner: dinner?.toDomain(),
    );
  }

  factory DailyMealResponse.fromJson(Map<String, dynamic> json) =>
      _$DailyMealResponseFromJson(json);
}

DateTime parseDate(String dateString) {
  try {
    return DateFormat('dd-MM-yyyy').parse(dateString);
  } catch (e) {
    return DateTime.now();
  }
}
