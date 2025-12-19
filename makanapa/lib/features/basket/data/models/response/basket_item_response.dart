import 'package:freezed_annotation/freezed_annotation.dart';

part 'basket_item_response.freezed.dart';
part 'basket_item_response.g.dart';

@freezed
abstract class BasketItemResponse with _$BasketItemResponse {
  const BasketItemResponse._();
  const factory BasketItemResponse({
    @JsonKey(name: 'id', defaultValue: 0) required int id,
    @JsonKey(name: 'name', defaultValue: '') required String name,
    @JsonKey(name: 'unit', defaultValue: '') required String unit,
    @JsonKey(name: 'quantity', defaultValue: 0) required num quantity,
  }) = _BasketItemResponse;

  factory BasketItemResponse.fromJson(Map<String, dynamic> json) =>
      _$BasketItemResponseFromJson(json);
}
