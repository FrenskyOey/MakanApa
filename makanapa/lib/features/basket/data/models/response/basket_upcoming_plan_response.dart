import 'package:freezed_annotation/freezed_annotation.dart';

part 'basket_upcoming_plan_response.freezed.dart';
part 'basket_upcoming_plan_response.g.dart';

@freezed
abstract class BasketUpcomingPlanResponse with _$BasketUpcomingPlanResponse {
  const BasketUpcomingPlanResponse._();
  const factory BasketUpcomingPlanResponse({
    @JsonKey(name: 'group_id') required int groupId,
    @JsonKey(name: 'start_date') required String startDate,
  }) = _BasketUpcomingPlanResponse;

  factory BasketUpcomingPlanResponse.fromJson(Map<String, dynamic> json) =>
      _$BasketUpcomingPlanResponseFromJson(json);
}
