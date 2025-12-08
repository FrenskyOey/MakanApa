class PageRequestState {
  final int page;
  final String? filter;

  const PageRequestState({this.page = 1, this.filter});

  PageRequestState copyWith({int? page, String? filter}) {
    return PageRequestState(
      page: page ?? this.page,
      filter: filter ?? this.filter,
    );
  }
}
