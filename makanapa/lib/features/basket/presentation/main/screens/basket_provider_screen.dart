import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:makanapa/features/basket/presentation/main/screens/basket_page.dart';

class BasketProviderScreen extends HookConsumerWidget {
  const BasketProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: BasketPage(),
      /*SafeArea(
         child: BlocProvider(
          create: (context) {
            return DetailBloc(repository: ref.read(recipeRepositoryProvider));
          },
          child: BasketPage(),
        ),
      ),*/
    );
  }
}
