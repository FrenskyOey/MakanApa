import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pager_controller.g.dart';

@riverpod
class PagerController extends _$PagerController {
  @override
  double build() {
    return 0.0;
  }

  void updateSelectedIndex(double index) {
    state = index;
  }
}
