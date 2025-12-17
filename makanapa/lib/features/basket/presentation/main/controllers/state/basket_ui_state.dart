class BasketUiState {
  final bool isLoading;

  BasketUiState({this.isLoading = false});

  BasketUiState copyWith({bool? isLoading}) {
    return BasketUiState(isLoading: isLoading ?? this.isLoading);
  }
}
