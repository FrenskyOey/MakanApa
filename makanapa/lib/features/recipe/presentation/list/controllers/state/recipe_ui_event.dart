import 'package:makanapa/features/recipe/domain/models/recipe_item.dart';

sealed class RecipeUiEvent {
  const RecipeUiEvent();
}

class ChangeFilterDataEvent extends RecipeUiEvent {
  final String filter;
  const ChangeFilterDataEvent(this.filter);
}

class ReloadRecipeDataEvent extends RecipeUiEvent {
  final bool fromPullRefresh;
  const ReloadRecipeDataEvent({this.fromPullRefresh = false});
}

class LoadNextDataEvent extends RecipeUiEvent {
  const LoadNextDataEvent();
}

class OpenDetailPageEvent extends RecipeUiEvent {
  RecipeItem item;

  OpenDetailPageEvent(this.item);
}

class OpenSearchRecipeEvent extends RecipeUiEvent {
  const OpenSearchRecipeEvent();
}

class PageUpdateStreamEvent extends RecipeUiEvent {
  final List<RecipeItem> data;
  const PageUpdateStreamEvent(this.data);
}
