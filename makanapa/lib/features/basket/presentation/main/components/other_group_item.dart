import 'package:flutter/material.dart';
import 'package:makanapa/features/basket/presentation/main/components/base_group_item.dart';
import 'package:makanapa/features/basket/presentation/main/controllers/state/basket_ui_state.dart';

class OtherGroupItem extends BaseGroupItem {
  const OtherGroupItem({super.key});

  @override
  bool checkRebuild(BasketUiState previous, BasketUiState current) {
    return previous.otherBasket != current.otherBasket;
  }

  @override
  Color getBaseColor() {
    return Colors.blueAccent;
  }

  @override
  List getItemGroup(BasketUiState state) {
    return state.otherBasket;
  }

  @override
  String getTitle() {
    return "Bumbu Lainnya";
  }
}
