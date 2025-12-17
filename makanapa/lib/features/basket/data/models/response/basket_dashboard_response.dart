import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:makanapa/features/basket/data/models/response/basket_summary_response.dart';
import 'package:makanapa/features/basket/data/models/response/basket_upcoming_plan_response.dart';

part 'basket_dashboard_response.freezed.dart';
part 'basket_dashboard_response.g.dart';

@freezed
abstract class BasketDashboardResponse with _$BasketDashboardResponse {
  const factory BasketDashboardResponse({
    @JsonKey(name: 'current_week_ingredients')
    BasketSummaryResponse? currentWeekIngredients,
    @JsonKey(name: 'upcoming_plan', defaultValue: [])
    required List<BasketUpcomingPlanResponse> upcomingPlans,
  }) = _BasketDashboardResponse;

  factory BasketDashboardResponse.fromJson(Map<String, dynamic> json) =>
      _$BasketDashboardResponseFromJson(json);
}
