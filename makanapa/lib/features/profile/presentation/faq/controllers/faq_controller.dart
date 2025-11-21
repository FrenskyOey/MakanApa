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

  @override
  FaqUiState build() {
    _repo = ref.read(faqRepositoryProvider);
    ref.onDispose(() {
      _userSubscription?.cancel();
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

  void resetState() {
    state = state.copyWith(eventState: FaqEventState.initial());
  }

  Future<void> reloadFaqData() async {
    state = state.copyWith(isLoading: true);
    final results = await _repo.reloadFaqData();
    if (!ref.mounted) {
      return;
    }
    results.fold(
      (l) => {state = state.copyWith(eventState: FaqEventState.toastError(l))},
      (r) => {
        // skip nothing to do
      },
    );
    state = state.copyWith(isLoading: false);
  }
}
