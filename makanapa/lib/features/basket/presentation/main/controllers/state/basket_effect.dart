import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:makanapa/features/basket/domain/models/basket_option.dart';
part 'basket_effect.freezed.dart';

@freezed
class BasketEffect with _$BasketEffect {
  const factory BasketEffect.toastError(String messgae) = _ToastError;
  const factory BasketEffect.toastSuccess(String messgae) = _ToastSuccess;
  const factory BasketEffect.openUpcomingItem(BasketOptionItem item) =
      _OpenUpcomingItem;
}
