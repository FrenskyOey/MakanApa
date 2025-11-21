import 'package:makanapa/features/profile/domain/models/faq.dart';

class FaqUiState {
  final List<Faq> faqList;
  final bool isLoading;

  FaqUiState({this.faqList = const [], this.isLoading = false});

  FaqUiState copyWith({List<Faq>? faqList, bool? isLoading}) {
    return FaqUiState(
      faqList: faqList ?? this.faqList,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
