import 'package:equatable/equatable.dart';
import 'package:makanapa/features/home/domain/models/avaiblity_item.dart';
import 'package:makanapa/features/home/domain/models/upcoming_item.dart';
import 'package:makanapa/features/home/domain/models/weekly_plan.dart';

class Dashboard extends Equatable {
  final WeeklyPlan? currentPlan;
  final List<UpcomingItem> upcomingItems;
  final List<AvaiblityItem> avaiblityItems;

  const Dashboard({
    this.currentPlan,
    required this.upcomingItems,
    required this.avaiblityItems,
  });

  @override
  List<Object?> get props => [currentPlan, upcomingItems, avaiblityItems];
}
