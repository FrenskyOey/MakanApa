import 'package:flutter/material.dart';
import 'package:makanapa/core/themes/app_color.dart';
import 'package:makanapa/features/basket/presentation/detail/components/base_basket_detail_widget.dart';
import 'package:makanapa/features/basket/presentation/detail/controllers/state/basket_detail_ui_state.dart';

class VegetableDetailWidget extends BaseBasketDetailWidget {
  const VegetableDetailWidget({super.key});

  @override
  bool checkRebuildItem(
    BasketDetailUiState previous,
    BasketDetailUiState current,
  ) {
    return previous.vegetableBasket != current.vegetableBasket;
  }

  @override
  Color getBaseColor() {
    return AppColor.primary;
  }

  @override
  List<dynamic> getBasketGroup(BasketDetailUiState state) {
    return state.vegetableBasket;
  }
}
