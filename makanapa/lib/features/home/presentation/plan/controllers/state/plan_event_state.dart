import 'package:freezed_annotation/freezed_annotation.dart';
part 'plan_event_state.freezed.dart';

@freezed
class PlanEventState with _$PlanEventState {
  // handling toast Event
  const factory PlanEventState.toastError(String message) = _ToastError;
  const factory PlanEventState.toastSuccess(String message) = _ToastSuccess;
  const factory PlanEventState.closePage() = _ClosePage;
}
