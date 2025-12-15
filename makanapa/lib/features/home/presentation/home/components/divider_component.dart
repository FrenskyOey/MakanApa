import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:makanapa/core/extension/index.dart';
import 'package:makanapa/core/themes/dimens_constant.dart';

class DividerComponentWidget extends HookConsumerWidget {
  const DividerComponentWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SliverToBoxAdapter(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Dimens.lg.space,
          Text("Daftar Menu Yang Akan Datang", style: context.titleMedium),
          Dimens.md.space,
        ],
      ),
    );
  }
}
