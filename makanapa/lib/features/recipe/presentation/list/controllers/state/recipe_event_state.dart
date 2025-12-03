import 'package:freezed_annotation/freezed_annotation.dart';
part 'recipe_event_state.freezed.dart';

@freezed
class RecipeListEventState with _$RecipeListEventState {
  // handling toast Event
  const factory RecipeListEventState.toastError(String messgae) = _ToastError;
  const factory RecipeListEventState.toastSuccess(String messgae) =
      _ToastSuccess;

  // handling open detail page
  const factory RecipeListEventState.openReceiptDetail(int receiptId) =
      _OpenReceiptDetail;

  const factory RecipeListEventState.openSearchRecipe() = _OpenSearchRecipe;
}
