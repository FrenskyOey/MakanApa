import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:makanapa/features/recipe/domain/models/recipe_item.dart';
part 'recipe_event_state.freezed.dart';

@freezed
class RecipeListEventState with _$RecipeListEventState {
  // handling toast Event
  const factory RecipeListEventState.toastError(String messgae) = _ToastError;
  const factory RecipeListEventState.toastSuccess(String messgae) =
      _ToastSuccess;

  // handling open detail page
  const factory RecipeListEventState.openReceiptDetail(RecipeItem item) =
      _OpenReceiptDetail;

  const factory RecipeListEventState.openSearchRecipe() = _OpenSearchRecipe;
}
