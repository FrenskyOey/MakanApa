import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:makanapa/features/home/presentation/create/model/create_enum.dart';
import 'package:makanapa/features/home/presentation/create/model/create_item_model.dart';
part 'create_event_state.freezed.dart';

@freezed
class CreateEventState with _$CreateEventState {
  // handling toast Event
  const factory CreateEventState.toastError(String message) = _ToastError;
  const factory CreateEventState.toastSuccess(String message) = _ToastSuccess;
  const factory CreateEventState.selectFoodPage(
    CreateItem item,
    MealType type,
  ) = _SelectFoodPage;
  const factory CreateEventState.closePage() = _ClosePage;
}
