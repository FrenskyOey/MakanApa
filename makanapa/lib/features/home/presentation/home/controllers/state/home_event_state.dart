import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:makanapa/features/home/domain/models/avaiblity_item.dart';
part 'home_event_state.freezed.dart';

@freezed
class HomeEventState with _$HomeEventState {
  // handling toast Event
  const factory HomeEventState.toastError(String message) = _ToastError;
  const factory HomeEventState.toastSuccess(String message) = _ToastSuccess;
  const factory HomeEventState.openCreatePlan(AvaiblityItem item) =
      _OpenCreatePlan;
}
