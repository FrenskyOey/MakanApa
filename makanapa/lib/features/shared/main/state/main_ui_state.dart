class MainUiState {
  final bool shouldLoading;

  MainUiState({this.shouldLoading = false});

  MainUiState copyWith({bool? shouldLoading}) {
    return MainUiState(shouldLoading: shouldLoading ?? this.shouldLoading);
  }
}
