import 'package:flutter/material.dart';

import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:makanapa/core/configs/routes/route_names.dart';
import 'package:makanapa/core/extension/index.dart';
import 'package:makanapa/features/shared/provider/token/token_provider.dart';
import 'package:makanapa/features/shared/provider/token/token_state.dart';

class SplashScreen extends HookConsumerWidget {
  const SplashScreen({super.key});

  Future<void> reloadUserState(BuildContext context, WidgetRef ref) async {
    final tokenNotifier = ref.read(tokenProvider.notifier);
    final state = await tokenNotifier.reloadToken();

    state.maybeWhen(
      loginState: (token) {
        context.goNamed(RouteNames.main);
      },
      orElse: () {
        context.goNamed(RouteNames.intro);
      },
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /*Future<void> loadDb() async {
      final results = await Supabase.instance.client
          .schema('food')
          .from('Resep')
          .select();
      final counts = results.length;

      if (!context.mounted) {
        return;
      }

      SnackBarHelper.showSuccess(
        context,
        "Resep Counts : ${counts.toString()}",
      );
    }*/

    useEffect(() {
      Future.delayed(const Duration(seconds: 2)).then((_) {
        if (!context.mounted) {
          return;
        }
        reloadUserState(context, ref);
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
