class BasketDetailUiState {
  final bool isLoading;

  BasketDetailUiState({this.isLoading = false});

  BasketDetailUiState copyWith({bool? isLoading}) {
    return BasketDetailUiState(isLoading: isLoading ?? this.isLoading);
  }
}
