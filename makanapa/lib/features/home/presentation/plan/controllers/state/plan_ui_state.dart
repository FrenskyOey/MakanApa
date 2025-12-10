class PlanUiState {
  final bool hideLoading;

  PlanUiState({this.hideLoading = true});

  PlanUiState copyWith({bool? hideLoading}) {
    return PlanUiState(hideLoading: hideLoading ?? this.hideLoading);
  }
}
