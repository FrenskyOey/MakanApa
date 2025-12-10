import 'package:freezed_annotation/freezed_annotation.dart';
part 'create_event_state.freezed.dart';

@freezed
class CreateEventState with _$CreateEventState {
  // handling toast Event
  const factory CreateEventState.toastError(String message) = _ToastError;
  const factory CreateEventState.toastSuccess(String message) = _ToastSuccess;
  const factory CreateEventState.closePage() = _ClosePage;
}
