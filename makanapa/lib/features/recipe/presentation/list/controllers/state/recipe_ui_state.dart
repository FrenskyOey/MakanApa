import 'package:makanapa/core/states/data_state.dart';
import 'package:makanapa/features/recipe/domain/models/recipe_item.dart';

class RecipeUiState {
  final List<RecipeItem> recipeList;
  final bool showPageLoading;
  final bool showRefreshLoading;
  final bool isSyncing;
  final DataState<String> state;
  final String? currentFilter;

  RecipeUiState({
    this.recipeList = const [],
    this.showPageLoading = false,
    this.showRefreshLoading = false,
    this.isSyncing = false,
    this.state = const Initial<String>(),
    this.currentFilter,
  });

  RecipeUiState copyWith({
    List<RecipeItem>? recipeList,
    bool? showPageLoading,
    bool? showRefreshLoading,
    bool? isSyncing,
    DataState<String>? state,
    String? currentFilter,
  }) {
    return RecipeUiState(
      recipeList: recipeList ?? this.recipeList,
      showPageLoading: showPageLoading ?? this.showPageLoading,
      showRefreshLoading: showRefreshLoading ?? this.showRefreshLoading,
      isSyncing: isSyncing ?? this.isSyncing,
      state: state ?? this.state,
      currentFilter: currentFilter ?? this.currentFilter,
    );
  }
}
