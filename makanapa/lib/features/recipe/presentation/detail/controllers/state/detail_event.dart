import 'package:makanapa/features/recipe/domain/models/recipe_detail.dart';

sealed class DetailEvent {
  const DetailEvent();
}

class LoadDetailEvent extends DetailEvent {
  final int recipeId;
  const LoadDetailEvent(this.recipeId);
}

class ToggleBookmarkEvent extends DetailEvent {
  final int recipeId;
  const ToggleBookmarkEvent(this.recipeId);
}

class OpenUrlEvent extends DetailEvent {
  final String url;
  const OpenUrlEvent(this.url);
}

class RecipeUpdateStreamEvent extends DetailEvent {
  final RecipeDetail data;
  const RecipeUpdateStreamEvent(this.data);
}
