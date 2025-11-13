import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:makanapa/core/extension/index.dart';
import 'package:makanapa/core/themes/dimens_constant.dart';

class LoginHeader extends HookConsumerWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          "Selamat Datang",
          textAlign: TextAlign.center,
          style: context.textTheme.headlineMedium,
        ),
        Dimens.sm.space,
        SizedBox(
          height: 140,
          width: 140,
          child: Image.asset("assets/images/ic_splash.png"),
        ),

        Text(
          "Silahkan login dengan akun anda",
          textAlign: TextAlign.center,
          style: context.bodyMedium,
        ),
      ],
    );
  }
}
