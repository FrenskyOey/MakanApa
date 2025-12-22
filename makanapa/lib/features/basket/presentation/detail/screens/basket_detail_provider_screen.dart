import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:makanapa/features/basket/domain/models/basket_option.dart';
import 'package:makanapa/features/basket/presentation/detail/controllers/basket_detail_bloc_controller.dart';
import 'package:makanapa/features/basket/presentation/detail/screens/basket_detail_page.dart';
import 'package:makanapa/features/basket/provider/basket_provider.dart';

class BasketDetailProviderScreen extends HookConsumerWidget {
  final BasketOptionItem item;
  const BasketDetailProviderScreen({super.key, required this.item});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BlocProvider(
      create: (context) {
        return BasketDetailBloc(repository: ref.read(basketRepositoryProvider));
      },
      child: BasketDetailPage(item: item),
    );
  }
}
