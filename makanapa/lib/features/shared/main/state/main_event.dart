import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:makanapa/features/home/domain/models/avaiblity_item.dart';
part 'main_event.freezed.dart';

@freezed
class MainEvent with _$MainEvent {
  // handling toast Event
  const factory MainEvent.openTypeBottomSheet(String? currentType) =
      _OpenTypeBottomSheet;
  const factory MainEvent.typeBottomSheetResult(String type) =
      _TypeBottomSheetResult;
  const factory MainEvent.openAvaibilityBottomSheet(List<AvaiblityItem> item) =
      _OpenAvaibilityBottomSheet;
  const factory MainEvent.avaibilityBottomSheetResult(AvaiblityItem item) =
      _AvaibilityBottomSheetResult;
}
