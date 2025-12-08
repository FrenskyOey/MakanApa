import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:makanapa/features/recipe/domain/models/recipe_item.dart';
part 'recipe_list_effect.freezed.dart';

@freezed
class RecipeListEffect with _$RecipeListEffect {
  // handling toast Event
  const factory RecipeListEffect.toastError(String messgae) = _ToastError;
  const factory RecipeListEffect.toastSuccess(String messgae) = _ToastSuccess;

  // handling open detail page
  const factory RecipeListEffect.openReceiptDetail(RecipeItem item) =
      _OpenReceiptDetail;

  const factory RecipeListEffect.openSearchRecipe() = _OpenSearchRecipe;
}
