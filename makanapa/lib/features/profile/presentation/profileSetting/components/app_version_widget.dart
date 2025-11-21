import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:makanapa/core/extension/index.dart';
import 'package:makanapa/core/themes/dimens_constant.dart';

class AppVersionWidget extends HookConsumerWidget {
  const AppVersionWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Dimens.md.space,
        Text(
          '© 2025 MakanApa. All Rights Reserved.',
          style: context.labelMedium,
          textAlign: TextAlign.center,
        ),
        Dimens.xs.space,
        Text(
          'Version 1.0.0 - Staging',
          style: context.labelSmall,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
