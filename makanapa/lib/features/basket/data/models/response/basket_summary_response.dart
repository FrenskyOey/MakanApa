import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:makanapa/features/basket/data/models/response/basket_ingredients_response.dart';

part 'basket_summary_response.freezed.dart';
part 'basket_summary_response.g.dart';

@freezed
abstract class BasketSummaryResponse with _$BasketSummaryResponse {
  const BasketSummaryResponse._();
  const factory BasketSummaryResponse({
    @JsonKey(name: 'group_id') required int groupId,
    @JsonKey(name: 'start_date') required String startDate,
    @JsonKey(name: 'bahan') required BasketIngredientsResponse ingredients,
  }) = _BasketSummaryResponse;

  factory BasketSummaryResponse.fromJson(Map<String, dynamic> json) =>
      _$BasketSummaryResponseFromJson(json);
}
