import 'package:flutter/material.dart';
import 'package:makanapa/core/extension/index.dart';
import 'package:makanapa/core/themes/app_color.dart';
import 'package:makanapa/core/themes/dimens_constant.dart';
import 'package:makanapa/features/basket/domain/models/basket_item.dart';

class ShoppingListItem extends StatelessWidget {
  final BasketItem item;
  final VoidCallback onPressed;
  final Color itemColor;

  const ShoppingListItem({
    super.key,
    required this.item,
    required this.onPressed,
    this.itemColor = AppColor.primary,
  });

  @override
  Widget build(BuildContext context) {
    final shapes = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(Dimens.ms),
    );

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Dimens.md, vertical: 6),
      child: Card(
        shape: shapes,
        elevation: 3,
        margin: EdgeInsets.zero,
        child: InkWell(
          onTap: onPressed,
          customBorder: shapes,
          child: Padding(
            padding: EdgeInsetsGeometry.symmetric(
              horizontal: Dimens.sm,
              vertical: Dimens.ms,
            ),
            child: Row(
              children: [
                // Checkbox Icon
                Icon(
                  item.isMarked
                      ? Icons.check_circle
                      : Icons.radio_button_unchecked,
                  color: item.isMarked ? itemColor : Colors.grey.shade300,
                  size: 28,
                ),
                Dimens.md.space,
                // Item Name
                Expanded(
                  child: Text(
                    item.name,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: item.isMarked ? Colors.grey : context.textPrimary,
                      decoration: item.isMarked
                          ? TextDecoration.lineThrough
                          : null,
                      decorationColor: Colors.grey,
                    ),
                  ),
                ),

                // Quantity Badge
                Container(
                  width: 80,
                  padding: const EdgeInsets.symmetric(vertical: Dimens.sm),
                  decoration: BoxDecoration(
                    color: itemColor, // Very light background
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Text(
                      '${item.qty} ${item.unit}',
                      style: context.labelMedium?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
