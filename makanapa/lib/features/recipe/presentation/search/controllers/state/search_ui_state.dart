import 'package:makanapa/core/extension/src/string_extension.dart';
import 'package:makanapa/features/recipe/domain/models/recipe_item.dart';

class SearchUiState {
  final List<RecipeItem> results;
  final String currentQuery;
  final bool isInitial;
  final bool isLoading;
  final String? errorMessage;

  bool get isEmpty =>
      !isLoading && errorMessage.isNullOrEmpty && results.isEmpty;

  SearchUiState({
    this.results = const [],
    this.currentQuery = '',
    this.isLoading = false,
    this.errorMessage,
    this.isInitial = true,
  });

  SearchUiState copyWith({
    List<RecipeItem>? results,
    String? currentQuery,
    bool? isLoading,
    bool? isInitial,
    String? errorMessage,
  }) {
    return SearchUiState(
      results: results ?? this.results,
      currentQuery: currentQuery ?? this.currentQuery,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
      isInitial: isInitial ?? this.isInitial,
    );
  }
}
