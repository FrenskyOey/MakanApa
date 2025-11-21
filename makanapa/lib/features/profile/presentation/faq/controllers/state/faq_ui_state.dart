import 'package:makanapa/features/profile/domain/models/faq.dart';
import 'package:makanapa/features/profile/presentation/faq/controllers/state/faq_event_state.dart';

class FaqUiState {
  final List<Faq> faqList;
  final FaqEventState eventState;
  final bool isLoading;

  FaqUiState({
    this.faqList = const [],
    this.eventState = const FaqEventState.initial(),
    this.isLoading = false,
  });

  FaqUiState copyWith({
    List<Faq>? faqList,
    bool? isLoading,
    FaqEventState? eventState,
  }) {
    return FaqUiState(
      faqList: faqList ?? this.faqList,
      eventState: eventState ?? this.eventState,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
