import 'package:flutter/material.dart';
import 'package:makanapa/core/extension/index.dart';
import 'package:makanapa/core/themes/dimens_constant.dart';
import 'package:makanapa/features/profile/domain/models/faq.dart';

class FaqItemWidget extends StatelessWidget {
  final Faq item;

  const FaqItemWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final shapes = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(Dimens.ms),
    );

    return Card(
      shape: shapes,
      elevation: 3,
      margin: EdgeInsets.zero,
      child: ExpansionTile(
        key: key,
        shape: shapes,
        collapsedShape: shapes,
        title: Text(item.question, style: context.titleSmall),
        children: [
          ListTile(title: Text(item.answer, style: context.labelLarge)),
        ],
      ),
    ).paddingBoth(Dimens.sm, Dimens.md);
  }
}
