import 'dart:async';

import 'package:makanapa/features/home/domain/models/avaiblity_item.dart';
import 'package:makanapa/features/shared/main/state/main_event.dart';
import 'package:makanapa/features/shared/main/state/main_ui_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'main_controller.g.dart';

@riverpod
class MainController extends _$MainController {
  final _eventController = StreamController<MainEvent>.broadcast();
  Stream<MainEvent> get events => _eventController.stream;

  @override
  MainUiState build() {
    ref.onDispose(() {
      _eventController.close();
    });
    return MainUiState();
  }

  void openTypeBottomSheet(String? currentType) {
    _eventController.add(MainEvent.openTypeBottomSheet(currentType));
  }

  void onTypeBottomSheetResult(String type) {
    _eventController.add(MainEvent.typeBottomSheetResult(type));
  }

  void openAvaiblityBottomSheet(List<AvaiblityItem> items) {
    _eventController.add(MainEvent.openAvaibilityBottomSheet(items));
  }

  void onAvaiblitySelected(AvaiblityItem item) {
    _eventController.add(MainEvent.avaibilityBottomSheetResult(item));
  }
}
