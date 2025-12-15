import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:makanapa/features/home/data/models/response/dashboard/weekly_plan_response.dart';
import 'package:makanapa/features/home/domain/models/dashboard.dart';
import 'package:makanapa/features/home/domain/models/upcoming_item.dart';
import 'package:makanapa/features/home/domain/models/avaiblity_item.dart';

import 'daily_meal_response.dart';

part 'dashboard_response.freezed.dart';
part 'dashboard_response.g.dart';

@freezed
abstract class DashboardResponse with _$DashboardResponse {
  const DashboardResponse._();
  const factory DashboardResponse({
    @JsonKey(name: 'current_week_plant') WeeklyPlanResponse? currentWeekPlan,
    @JsonKey(name: 'upcoming_plan', defaultValue: [])
    required List<UpcomingPlanResponse> upcomingPlans,
    @JsonKey(name: 'avaible_plan', defaultValue: [])
    required List<AvailablePlanResponse> availablePlans,
  }) = _DashboardResponse;

  Dashboard toDomain() {
    return Dashboard(
      currentPlan: currentWeekPlan?.toDomain(),
      upcomingItems: upcomingPlans.map((e) => e.toDomain()).toList(),
      avaiblityItems: availablePlans.map((e) => e.toDomain()).toList(),
    );
  }

  factory DashboardResponse.fromJson(Map<String, dynamic> json) =>
      _$DashboardResponseFromJson(json);
}

@freezed
abstract class UpcomingPlanResponse with _$UpcomingPlanResponse {
  const UpcomingPlanResponse._();
  const factory UpcomingPlanResponse({
    @JsonKey(name: 'group_id') required int groupId,
    @JsonKey(name: 'start_date') required String startDate,
  }) = _UpcomingPlanResponse;

  UpcomingItem toDomain() {
    return UpcomingItem(groupId: groupId, startDate: parseDate(startDate));
  }

  factory UpcomingPlanResponse.fromJson(Map<String, dynamic> json) =>
      _$UpcomingPlanResponseFromJson(json);
}

@freezed
abstract class AvailablePlanResponse with _$AvailablePlanResponse {
  const AvailablePlanResponse._();
  const factory AvailablePlanResponse({
    @JsonKey(name: 'start_date') required String startDate,
  }) = _AvailablePlanResponse;

  AvaiblityItem toDomain() {
    final parsedStartDate = parseDate(startDate);
    return AvaiblityItem(
      startDate: parsedStartDate,
      endDate: parsedStartDate.add(const Duration(days: 6)),
    );
  }

  factory AvailablePlanResponse.fromJson(Map<String, dynamic> json) =>
      _$AvailablePlanResponseFromJson(json);
}
