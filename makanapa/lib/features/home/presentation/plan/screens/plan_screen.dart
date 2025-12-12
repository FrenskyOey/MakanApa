import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:makanapa/core/extension/index.dart';
import 'package:makanapa/core/themes/dimens_constant.dart';
import 'package:makanapa/core/widgets/gradient_text.dart';

class PlanScreen extends HookConsumerWidget {
  final int groupId;
  const PlanScreen({super.key, required this.groupId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SizedBox.expand(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Detail Plan Screen", style: context.textTheme.headlineMedium),
            Dimens.xxl.space,
            Icon(Icons.phonelink_erase, size: 80, color: context.secondary),
            Dimens.xxl.space,
            GradientText("COMING SOON"),
            Dimens.xxl.space,
          ],
        ),
      ),
    );
  }
}
