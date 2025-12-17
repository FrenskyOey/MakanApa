// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'basket_dashboard_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BasketDashboardResponse _$BasketDashboardResponseFromJson(
  Map<String, dynamic> json,
) => _BasketDashboardResponse(
  currentWeekIngredients: json['current_week_ingredients'] == null
      ? null
      : BasketSummaryResponse.fromJson(
          json['current_week_ingredients'] as Map<String, dynamic>,
        ),
  upcomingPlans:
      (json['upcoming_plan'] as List<dynamic>?)
          ?.map(
            (e) =>
                BasketUpcomingPlanResponse.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      [],
);

Map<String, dynamic> _$BasketDashboardResponseToJson(
  _BasketDashboardResponse instance,
) => <String, dynamic>{
  'current_week_ingredients': instance.currentWeekIngredients,
  'upcoming_plan': instance.upcomingPlans,
};
