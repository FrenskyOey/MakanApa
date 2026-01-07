import 'package:equatable/equatable.dart';
import 'package:makanapa/features/home/domain/models/daily_meal.dart';

class WeeklyPlan extends Equatable {
  final int groupId;
  final DateTime startDate;
  final DateTime endDate;
  final List<DailyMeal> meals;

  const WeeklyPlan({
    required this.groupId,
    required this.startDate,
    required this.endDate,
    required this.meals,
  });

  @override
  List<Object?> get props => [groupId, startDate, endDate, meals];
}
