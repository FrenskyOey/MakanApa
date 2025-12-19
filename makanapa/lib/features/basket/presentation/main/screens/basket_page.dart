import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:makanapa/core/configs/routes/route_names.dart';
import 'package:makanapa/core/helpers/snackbar_helper.dart';
import 'package:makanapa/features/basket/presentation/main/controllers/basket_bloc_controller.dart';
import 'package:makanapa/features/basket/presentation/main/controllers/state/basket_effect.dart';
import 'package:makanapa/features/basket/presentation/main/controllers/state/basket_event.dart';
import 'package:makanapa/features/basket/presentation/main/screens/basket_main_screen.dart';
import 'package:makanapa/features/basket/presentation/main/screens/basket_upcoming_screen.dart';

class BasketPage extends HookConsumerWidget {
  const BasketPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(() {
      context.read<BasketBloc>().add(LoadMainDataEvent());
      return null;
    }, const []);

    useEffect(() {
      final sub = context.read<BasketBloc>().sideEffects.listen((event) {
        event.maybeWhen(
          toastError: (error) {
            SnackBarHelper.showError(context, error);
          },
          toastSuccess: (message) {
            SnackBarHelper.showSuccess(context, message);
          },
          openUpcomingItem: (item) {
            context.pushNamed(RouteNames.upcomingBasket, extra: item);
          },
          orElse: () {},
        );
      });

      return sub.cancel; // Dispose subscription
    }, const []);

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Daftar Belanja"),
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.assignment), text: "Minggu Ini"),
              Tab(icon: Icon(Icons.update), text: "Minggu Mendatang"),
            ],
          ),
        ),
        body: TabBarView(
          children: [const BasketMainScreen(), const BasketUpcomingScreen()],
        ),
      ),
    );

    /*Scaffold(
      body: SafeArea(
        child: SizedBox.expand(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Basket Screen", style: context.textTheme.headlineMedium),
              Dimens.xxl.space,
              Icon(Icons.phonelink_erase, size: 80, color: context.secondary),
              Dimens.xxl.space,
              GradientText("COMING SOON"),
              Dimens.xxl.space,
            ],
          ),
        ),
        */
  }
}
