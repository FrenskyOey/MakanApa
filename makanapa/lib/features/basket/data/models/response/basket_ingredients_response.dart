import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:makanapa/features/basket/data/models/response/basket_item_response.dart';

part 'basket_ingredients_response.freezed.dart';
part 'basket_ingredients_response.g.dart';

@freezed
abstract class BasketIngredientsResponse with _$BasketIngredientsResponse {
  const factory BasketIngredientsResponse({
    @JsonKey(name: 'veg', defaultValue: [])
    required List<BasketItemResponse> vegetables,
    @JsonKey(name: 'mea', defaultValue: [])
    required List<BasketItemResponse> meats,
    @JsonKey(name: 'oth', defaultValue: [])
    required List<BasketItemResponse> others,
  }) = _BasketIngredientsResponse;

  factory BasketIngredientsResponse.fromJson(Map<String, dynamic> json) =>
      _$BasketIngredientsResponseFromJson(json);
}
