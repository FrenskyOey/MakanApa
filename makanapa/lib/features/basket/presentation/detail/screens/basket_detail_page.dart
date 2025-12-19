import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:makanapa/core/configs/routes/route_names.dart';
import 'package:makanapa/core/extension/index.dart';
import 'package:makanapa/core/helpers/snackbar_helper.dart';
import 'package:makanapa/core/themes/dimens_constant.dart';
import 'package:makanapa/features/basket/domain/models/basket_option.dart';
import 'package:makanapa/features/basket/presentation/detail/components/meat_detail_widget.dart';
import 'package:makanapa/features/basket/presentation/detail/components/other_detail_widget.dart';
import 'package:makanapa/features/basket/presentation/detail/components/vegetable_detail_widget.dart';
import 'package:makanapa/features/basket/presentation/detail/controllers/basket_detail_bloc_controller.dart';
import 'package:makanapa/features/basket/presentation/detail/controllers/state/basket_detail_effect.dart';
import 'package:makanapa/features/basket/presentation/detail/controllers/state/basket_detail_event.dart';

class BasketDetailPage extends HookConsumerWidget {
  final BasketOptionItem item;
  const BasketDetailPage({super.key, required this.item});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(() {
      context.read<BasketDetailBloc>().add(LoadDetailEvent(item));
      return null;
    }, const []);

    useEffect(() {
      final sub = context.read<BasketDetailBloc>().sideEffects.listen((event) {
        event.maybeWhen(
          toastError: (error) {
            SnackBarHelper.showError(context, error);
          },
          toastSuccess: (message) {
            SnackBarHelper.showSuccess(context, message);
          },
          openPlanDetail: (groupId) {
            context.pushNamed(RouteNames.planDetail, extra: groupId);
          },
          orElse: () {},
        );
      });

      return sub.cancel; // Dispose subscription
    }, const []);

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "${item.startDate.toReadableDateWithoutYear} - ${item.endDate.toReadableDateWithoutYear}",
          ),
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.eco_rounded), text: 'Sayuran'),
              Tab(icon: Icon(Icons.kebab_dining_rounded), text: 'Daging'),
              Tab(icon: Icon(Icons.photo_filter), text: 'Lainnya'),
            ],
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: TabBarView(
                children: [
                  const VegetableDetailWidget(),
                  const MeatDetailWidget(),
                  const OtherDetailWidget(),
                ],
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(
                  Dimens.md,
                  Dimens.ms,
                  Dimens.md,
                  Dimens.md,
                ),
                child: ElevatedButton(
                  onPressed: () {
                    context.read<BasketDetailBloc>().add(
                      OpenPlanDetailEvent(item.groupId),
                    );
                  },
                  child: Text("Lihat Menu"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
