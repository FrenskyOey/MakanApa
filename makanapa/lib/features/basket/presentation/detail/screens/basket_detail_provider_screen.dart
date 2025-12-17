import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:makanapa/features/basket/presentation/detail/screens/basket_detail_page.dart';

class BasketDetailProviderScreen extends HookConsumerWidget {
  const BasketDetailProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: BasketDetailPage(),
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
