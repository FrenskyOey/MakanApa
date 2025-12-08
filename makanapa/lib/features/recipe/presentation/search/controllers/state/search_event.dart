import 'package:makanapa/features/recipe/domain/models/recipe_item.dart';

sealed class SearchEvent {
  const SearchEvent();
}

class SearchRecipeEvent extends SearchEvent {
  final String searchKey;
  const SearchRecipeEvent(this.searchKey);
}

class OpenDetailRecipeEvent extends SearchEvent {
  final RecipeItem item;
  const OpenDetailRecipeEvent(this.item);
}

class UpdateSearchStreamEvent extends SearchEvent {
  final List<RecipeItem> items;
  const UpdateSearchStreamEvent(this.items);
}

class InternalSearchEvent extends SearchEvent {
  final String query;
  const InternalSearchEvent(this.query);
}
