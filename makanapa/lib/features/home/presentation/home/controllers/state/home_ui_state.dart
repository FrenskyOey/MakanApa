class HomeUiState {
  final bool hideLoading;

  HomeUiState({this.hideLoading = true});

  HomeUiState copyWith({bool? hideLoading}) {
    return HomeUiState(hideLoading: hideLoading ?? this.hideLoading);
  }
}
