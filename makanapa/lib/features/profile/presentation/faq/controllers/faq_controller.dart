import 'dart:async';

import 'package:makanapa/core/handlers/log/log_helper.dart';
import 'package:makanapa/features/profile/presentation/faq/controllers/state/faq_event_state.dart';
import 'package:makanapa/features/profile/presentation/faq/controllers/state/faq_ui_state.dart';
import 'package:makanapa/features/profile/provider/profile_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'faq_controller.g.dart';

@riverpod
class FaqController extends _$FaqController {
  StreamSubscription? _userSubscription;

  @override
  FaqUiState build() {
    ref.onDispose(() {
      LogHelper.error("FaqController Controller is disposed");
      _userSubscription?.cancel();
    });
    return FaqUiState();
  }

  Future<void> initStream() async {
    final repo = await ref.read(faqRepositoryProvider.future);
    final faqStream = repo.getFaq();
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
    await Future.delayed(Duration(seconds: 2));
    if (!ref.mounted) {
      return;
    }
    final repo = await ref.read(faqRepositoryProvider.future);
    final results = await repo.reloadFaqData();
    results.fold(
      (l) => {state = state.copyWith(eventState: FaqEventState.toastError(l))},
      (r) => {
        // skip nothing to do
      },
    );
    state = state.copyWith(isLoading: false);
  }
}
