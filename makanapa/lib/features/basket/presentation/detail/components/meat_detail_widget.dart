import 'package:flutter/material.dart';
import 'package:makanapa/core/themes/app_color.dart';
import 'package:makanapa/features/basket/presentation/detail/components/base_basket_detail_widget.dart';
import 'package:makanapa/features/basket/presentation/detail/controllers/state/basket_detail_ui_state.dart';

class MeatDetailWidget extends BaseBasketDetailWidget {
  const MeatDetailWidget({super.key});

  @override
  bool checkRebuildItem(
    BasketDetailUiState previous,
    BasketDetailUiState current,
  ) {
    return previous.meatBasket != current.meatBasket;
  }

  @override
  Color getBaseColor() {
    return AppColor.error;
  }

  @override
  List<dynamic> getBasketGroup(BasketDetailUiState state) {
    return state.meatBasket;
  }
}
