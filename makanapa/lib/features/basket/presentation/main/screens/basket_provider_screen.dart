import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:makanapa/features/basket/presentation/main/controllers/basket_bloc_controller.dart';
import 'package:makanapa/features/basket/presentation/main/screens/basket_page.dart';
import 'package:makanapa/features/basket/provider/basket_provider.dart';

class BasketProviderScreen extends HookConsumerWidget {
  const BasketProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BlocProvider(
      create: (context) {
        return BasketBloc(repository: ref.read(basketRepositoryProvider));
      },
      child: const BasketPage(),
    );
  }
}
