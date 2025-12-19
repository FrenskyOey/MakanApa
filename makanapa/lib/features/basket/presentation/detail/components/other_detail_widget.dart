import 'package:flutter/material.dart';
import 'package:makanapa/features/basket/presentation/detail/components/base_basket_detail_widget.dart';
import 'package:makanapa/features/basket/presentation/detail/controllers/state/basket_detail_ui_state.dart';

class OtherDetailWidget extends BaseBasketDetailWidget {
  const OtherDetailWidget({super.key});

  @override
  bool checkRebuildItem(
    BasketDetailUiState previous,
    BasketDetailUiState current,
  ) {
    return previous.otherBasket != current.otherBasket;
  }

  @override
  Color getBaseColor() {
    return Colors.blueAccent;
  }

  @override
  List<dynamic> getBasketGroup(BasketDetailUiState state) {
    return state.otherBasket;
  }
}
