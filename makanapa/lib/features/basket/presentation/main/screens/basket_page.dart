import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:makanapa/core/extension/index.dart';
import 'package:makanapa/core/themes/dimens_constant.dart';
import 'package:makanapa/core/widgets/gradient_text.dart';

class BasketPage extends HookConsumerWidget {
  const BasketPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /*
    useEffect(() {
      context.read<DetailBloc>().add(LoadDetailEvent(recipeItem.id));
      return null;
    }, const []);

    useEffect(() {
      final sub = context.read<DetailBloc>().sideEffects.listen((event) {
        event.maybeWhen(
          toastError: (error) {
            SnackBarHelper.showError(context, error);
          },
          toastSuccess: (message) {
            SnackBarHelper.showSuccess(context, message);
          },
          openUrlLink: (url) {
            //launchingUrl("https://id.shp.ee/7CR2q55");
            if (url.isNullOrEmpty) {
              SnackBarHelper.showError(context, "Data url tidak ditemukan");
              return;
            }

            launchingUrl(url);
          },
          orElse: () {},
        );
      });

      return sub.cancel; // Dispose subscription
    }, const []);
    */

    return Scaffold(
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

        /*
        child: BlocConsumer<DetailBloc, DetailUiState>(
          listener: (context, state) {},
          buildWhen: (previous, current) {
            return previous.state != current.state;
          },
          builder: (context, state) {
            return CustomScrollView(
              slivers: [
                SliverPersistentHeader(
                  pinned: true,
                  delegate: HeaderWidget(
                    recipeItem: recipeItem,
                    onBack: () => Navigator.pop(context),
                    heroTag: heroTag,
                  ),
                ),
                getWidgetBody(state.state),
              ],
            );
          },
        ),*/
      ),
    );
  }
}
