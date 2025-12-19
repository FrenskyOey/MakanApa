import 'package:flutter/material.dart';
import 'package:makanapa/core/themes/app_color.dart';
import 'package:makanapa/core/themes/dimens_constant.dart';
import 'package:makanapa/features/basket/presentation/main/components/base_group_item.dart';
import 'package:makanapa/features/basket/presentation/main/controllers/state/basket_ui_state.dart';

class VegetableGroupItem extends BaseGroupItem {
  const VegetableGroupItem({super.key});

  @override
  bool checkRebuild(BasketUiState previous, BasketUiState current) {
    return previous.vegetableBasket != current.vegetableBasket;
  }

  @override
  Color getBaseColor() {
    return AppColor.primary;
  }

  @override
  List getItemGroup(BasketUiState state) {
    return state.vegetableBasket;
    //return const [];
  }

  @override
  String getTitle() {
    return "Sayuran";
  }

  @override
  double getTopPadding() {
    return Dimens.md;
  }
}
