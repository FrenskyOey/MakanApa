import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:makanapa/features/recipe/domain/models/recipe_item.dart';
part 'search_effect.freezed.dart';

@freezed
class SearchEffect with _$SearchEffect {
  const factory SearchEffect.toastError(String messgae) = _ToastError;
  const factory SearchEffect.openDetailPage(RecipeItem item) = _OpenDetailPage;
}
