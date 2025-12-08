import 'package:makanapa/core/states/data_state.dart';
import 'package:makanapa/features/recipe/domain/models/recipe_detail.dart';

class DetailUiState {
  final DataState<RecipeDetail> state;
  final bool bookMarkState;

  DetailUiState({
    this.state = const Initial<RecipeDetail>(),
    this.bookMarkState = false,
  });

  DetailUiState copyWith({
    DataState<RecipeDetail>? state,
    bool? bookMarkState,
  }) {
    return DetailUiState(
      bookMarkState: bookMarkState ?? this.bookMarkState,
      state: state ?? this.state,
    );
  }
}
