class CreateUiState {
  final bool hideLoading;

  CreateUiState({this.hideLoading = true});

  CreateUiState copyWith({bool? hideLoading}) {
    return CreateUiState(hideLoading: hideLoading ?? this.hideLoading);
  }
}
