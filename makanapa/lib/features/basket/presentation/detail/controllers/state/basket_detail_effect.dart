import 'package:freezed_annotation/freezed_annotation.dart';
part 'basket_detail_effect.freezed.dart';

@freezed
class BasketDetailEffect with _$BasketDetailEffect {
  const factory BasketDetailEffect.toastError(String messgae) = _ToastError;
  const factory BasketDetailEffect.toastSuccess(String messgae) = _ToastSuccess;
  const factory BasketDetailEffect.openPlanDetail(int groupId) =
      _OpenPlanDetail;
}
