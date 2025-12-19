import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';
import 'package:makanapa/features/basket/data/models/response/basket_summary_response.dart';
import 'package:makanapa/features/basket/data/models/response/basket_upcoming_plan_response.dart';
import 'package:makanapa/features/basket/domain/models/basket_option.dart';

part 'basket_dashboard_response.freezed.dart';
part 'basket_dashboard_response.g.dart';

@freezed
abstract class BasketDashboardResponse with _$BasketDashboardResponse {
  const BasketDashboardResponse._();

  const factory BasketDashboardResponse({
    @JsonKey(name: 'current_week_ingredients')
    BasketSummaryResponse? currentWeekIngredients,
    @JsonKey(name: 'upcoming_plan', defaultValue: [])
    required List<BasketUpcomingPlanResponse> upcomingPlans,
  }) = _BasketDashboardResponse;

  BasketSummary toDomain() {
    BasketOptionItem mapItem(int groupId, String dateStr) {
      final dateFormat = DateFormat('dd-MM-yyyy');
      final start = dateFormat.parse(dateStr);
      final end = start.add(const Duration(days: 6));
      return BasketOptionItem(groupId: groupId, startDate: start, endDate: end);
    }

    return BasketSummary(
      currentGroup: currentWeekIngredients != null
          ? mapItem(
              currentWeekIngredients!.groupId,
              currentWeekIngredients!.startDate,
            )
          : null,
      upcomingGroup: upcomingPlans
          .map((e) => mapItem(e.groupId, e.startDate))
          .toList(),
    );
  }

  factory BasketDashboardResponse.fromJson(Map<String, dynamic> json) =>
      _$BasketDashboardResponseFromJson(json);
}
