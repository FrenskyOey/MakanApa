import 'package:flutter/material.dart';
import 'package:makanapa/core/extension/index.dart';
import 'package:makanapa/core/themes/dimens_constant.dart';
import 'package:makanapa/features/profile/presentation/profileSetting/model/OptionItem.dart';

class OptionWidget extends StatelessWidget {
  final OptionItem item;
  final VoidCallback onPressed;

  const OptionWidget({super.key, required this.item, required this.onPressed});

  Widget _iconContainer(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(Dimens.ms),
      decoration: BoxDecoration(
        color: item.color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(Dimens.sm),
      ),
      child: Icon(item.icon, color: item.color, size: 24),
    );
  }

  Widget _contentContainer(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(item.title, style: context.titleSmall),
        Dimens.xs.space,
        if (item.subtitle.isNotEmpty)
          Text(item.subtitle, style: context.labelLarge),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final shapes = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(Dimens.ms),
    );

    return Card(
      shape: shapes,
      elevation: 3,
      margin: EdgeInsets.zero,
      child: InkWell(
        onTap: onPressed,
        customBorder: shapes,
        child: Row(
          children: [
            _iconContainer(context),
            Dimens.md.space,
            Expanded(child: _contentContainer(context)),
            Icon(Icons.chevron_right, color: context.secondary),
          ],
        ).paddingAll(Dimens.md),
      ),
    ).paddingBoth(Dimens.sm, Dimens.md);
  }
}
