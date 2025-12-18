import 'package:makanapa/core/states/data_state.dart';
import 'package:makanapa/features/basket/domain/models/basket_option.dart';
import 'package:makanapa/features/basket/domain/models/basket_item.dart';
import 'package:makanapa/features/recipe/domain/models/ingredient_enum.dart';

class BasketUiState {
  final DataState<String> state;
  final BasketSummary? summaryData;
  final List<BasketItem> vegetableBasket;
  final List<BasketItem> meatBasket;
  final List<BasketItem> otherBasket;
  final List<BasketOptionItem> upcomingData;

  BasketUiState({
    this.state = const Initial(),
    this.vegetableBasket = const [],
    this.meatBasket = const [],
    this.otherBasket = const [],
    this.summaryData,
    this.upcomingData = const [],
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

  BasketUiState copyWith({
    DataState<String>? state,
    BasketSummary? summaryData,
    List<BasketItem>? vegetableBasket,
    List<BasketItem>? meatBasket,
    List<BasketItem>? otherBasket,
    List<BasketOptionItem>? upcomingData,
  }) {
    return BasketUiState(
      state: state ?? this.state,
      summaryData: summaryData ?? this.summaryData,
      vegetableBasket: vegetableBasket ?? this.vegetableBasket,
      meatBasket: meatBasket ?? this.meatBasket,
      otherBasket: otherBasket ?? this.otherBasket,
      upcomingData: upcomingData ?? this.upcomingData,
    );
  }
}
