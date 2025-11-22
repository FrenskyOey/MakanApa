import 'dart:async';

import 'package:makanapa/features/profile/domain/repositories/faq_repository.dart';
import 'package:makanapa/features/profile/presentation/faq/controllers/state/faq_event_state.dart';
import 'package:makanapa/features/profile/presentation/faq/controllers/state/faq_ui_state.dart';
import 'package:makanapa/features/profile/provider/profile_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'faq_controller.g.dart';

@riverpod
class FaqController extends _$FaqController {
  StreamSubscription? _userSubscription;
  late FaqRepository _repo;

  final _eventController = StreamController<FaqEventState>.broadcast();
  Stream<FaqEventState> get events => _eventController.stream;

  @override
  FaqUiState build() {
    _repo = ref.read(faqRepositoryProvider);
    ref.onDispose(() {
      _userSubscription?.cancel();
      _eventController.close();
    });
    return FaqUiState();
  }

  Future<void> initStream() async {
    final faqStream = _repo.getFaq();
    _userSubscription = faqStream.listen((faqData) {
      if (faqData == null) {
        return;
      }
      state = state.copyWith(faqList: faqData);
    });
  }

  Future<void> reloadFaqData() async {
    state = state.copyWith(isLoading: true);
    final results = await _repo.reloadFaqData();
    if (!ref.mounted) {
      return;
    }
    results.fold(
      (l) => {_eventController.add(FaqEventState.toastError(l))},

      (r) => {
        // skip nothing to do
      },
    );
    state = state.copyWith(isLoading: false);
  }
}
