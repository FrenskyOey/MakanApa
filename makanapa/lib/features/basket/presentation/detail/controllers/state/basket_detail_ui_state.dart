import 'package:makanapa/core/states/data_state.dart';
import 'package:makanapa/features/basket/domain/models/basket_option.dart';
import 'package:makanapa/features/basket/domain/models/basket_item.dart';
import 'package:makanapa/features/recipe/domain/models/ingredient_enum.dart';

class BasketDetailUiState {
  final DataState<String> state;
  final BasketOptionItem? detailData;
  final List<BasketItem> vegetableBasket;
  final List<BasketItem> meatBasket;
  final List<BasketItem> otherBasket;
  final bool isDataLoaded;

  BasketDetailUiState({
    this.state = const Initial(),
    this.vegetableBasket = const [],
    this.meatBasket = const [],
    this.otherBasket = const [],
    this.isDataLoaded = false,
    this.detailData,
  });

  bool get isEmpty =>
      vegetableBasket.isEmpty && meatBasket.isEmpty && otherBasket.isEmpty;

  int getBasketSize(IngredientEnum type) {
    switch (type) {
      case IngredientEnum.vegetable:
        return vegetableBasket.length;
      case IngredientEnum.meat:
        return meatBasket.length;
      case IngredientEnum.other:
        return otherBasket.length;
      case IngredientEnum.nulls:
        return 0;
    }
  }

  BasketDetailUiState copyWith({
    DataState<String>? state,
    BasketOptionItem? detailData,
    List<BasketItem>? vegetableBasket,
    List<BasketItem>? meatBasket,
    List<BasketItem>? otherBasket,
    bool? isDataLoaded,
  }) {
    return BasketDetailUiState(
      state: state ?? this.state,
      detailData: detailData ?? this.detailData,
      vegetableBasket: vegetableBasket ?? this.vegetableBasket,
      meatBasket: meatBasket ?? this.meatBasket,
      otherBasket: otherBasket ?? this.otherBasket,
      isDataLoaded: isDataLoaded ?? this.isDataLoaded,
    );
  }
}
