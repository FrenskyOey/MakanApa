import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:makanapa/core/extension/index.dart';
import 'package:makanapa/core/themes/dimens_constant.dart';
import 'package:makanapa/features/shared/provider/master_provider.dart';
import 'package:makanapa/main_common.dart';

class AppVersionWidget extends HookConsumerWidget {
  const AppVersionWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appVersion = ref.read(devicConfigClientProvider).appVersion;
    final flavors = ref.read(flavorConfigProvider).flavor?.description ?? '---';

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
          'Version $appVersion - $flavors',
          style: context.labelSmall,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
