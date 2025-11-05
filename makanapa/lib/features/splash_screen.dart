import 'package:flutter/material.dart';

import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:makanapa/core/extension/index.dart';

class SplashScreen extends HookConsumerWidget {
  const SplashScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(() {
      Future.delayed(const Duration(seconds: 2)).then((_) {
        if (!context.mounted) {
          return;
        }
        //context.goNamed(RouteNames.intro);
      });
      return null;
    }, []);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/ic_splash.png",
              width: double.infinity,
              fit: BoxFit.fitWidth,
            ),
            40.space,
            const CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
