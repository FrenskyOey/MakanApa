import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:makanapa/core/extension/index.dart';
import 'package:makanapa/core/themes/dimens_constant.dart';
import 'package:makanapa/core/widgets/gradient_text.dart';
import 'package:makanapa/features/shared/provider/token/token_provider.dart';

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /*final state = ref.watch(templateControllerProvider);

    ref.listen(templateEventProvider, (prev, next) {
      if (next == null) {
        return;
      }
      next.maybeWhen(
        orElse: () {},
      );

      ref.read(templateEventProvider.notifier).resetState();
    });

    void loadData() async {
      if (!context.mounted) {
        return;
      }

      await ref.read(templateEventProvider.notifier).loadData();
    }

    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        loadData();
      });
     
    }, []);*/

    return Scaffold(
      body: SizedBox.expand(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Home Screen", style: context.textTheme.headlineMedium),
            Dimens.xxl.space,
            Icon(Icons.phonelink_erase, size: 80, color: context.secondary),
            Dimens.xxl.space,
            GradientText("COMING SOON"),
            Dimens.xxl.space,
            SizedBox(
              width: 230,
              child: ElevatedButton(
                onPressed: () {
                  ref.read(tokenProvider.notifier).signOut();
                },
                child: Text("Log Out"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
