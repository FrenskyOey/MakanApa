import 'package:freezed_annotation/freezed_annotation.dart';
part 'main_event.freezed.dart';

@freezed
class MainEvent with _$MainEvent {
  // handling toast Event
  const factory MainEvent.openTypeBottomSheet(String? currentType) =
      _OpenTypeBottomSheet;
  const factory MainEvent.typeBottomSheetResult(String type) =
      _TypeBottomSheetResult;
}
