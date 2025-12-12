import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:makanapa/core/configs/routes/route_names.dart';
import 'package:makanapa/core/extension/index.dart';
import 'package:makanapa/core/helpers/dialog_helper.dart';
import 'package:makanapa/core/helpers/snackbar_helper.dart';
import 'package:makanapa/core/states/data_state.dart';
import 'package:makanapa/core/themes/dimens_constant.dart';
import 'package:makanapa/core/widgets/state/screen_content.dart';
import 'package:makanapa/features/home/domain/models/avaiblity_item.dart';
import 'package:makanapa/features/home/presentation/create/components/create_form_widget.dart';
import 'package:makanapa/features/home/presentation/create/controllers/create_controller.dart';
import 'package:makanapa/features/home/presentation/create/controllers/state/create_event_state.dart';
import 'package:makanapa/features/home/presentation/create/model/create_enum.dart';
import 'package:makanapa/features/home/presentation/create/model/create_item_model.dart';
import 'package:makanapa/features/recipe/domain/models/recipe_item.dart';

class CreatePlanScreen extends HookConsumerWidget {
  final AvaiblityItem request;
  const CreatePlanScreen({super.key, required this.request});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final canPop = useState(false);

    void reloadData() {
      ref.read(createControllerProvider.notifier).initData(request);
    }

    void openFoodSelection(CreateItem item, MealType type) async {
      final RecipeItem? result = await context.pushNamed(
        RouteNames.recipeSelection,
      );

      if (!context.mounted || result == null) {
        return;
      }

      ref
          .read(createControllerProvider.notifier)
          .updateMeals(item, type, result);
    }

    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        reloadData();
      });
      return null;
    }, []);

    useEffect(() {
      final sub = ref.read(createControllerProvider.notifier).events.listen((
        event,
      ) {
        event.maybeWhen(
          toastError: (error) {
            SnackBarHelper.showError(context, error);
          },
          selectFoodPage: (item, type) {
            openFoodSelection(item, type);
          },
          toastSuccess: (success) {},
          closePage: () {
            canPop.value = true;
            WidgetsBinding.instance.addPostFrameCallback((_) {
              if (context.mounted) {
                context.pop();
              }
            });
          },
          orElse: () {},
        );
      });

      return sub.cancel; // Dispose subscription
    }, const []);

    final itemLength = ref.watch(
      createControllerProvider.select((value) => value.formItem.length),
    );

    final showLoading = ref.watch(
      createControllerProvider.select((value) => value.showLoading),
    );

    return PopScope(
      canPop: canPop.value,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;
        DialogHelper.showConfirmation(
          context: context,
          title: "Konfirmasi",
          content: "Apakah anda yakin untuk membatalkan pembuatan menu?",
          primaryButtonText: "Ya",
          secondaryButtonText: "Tidak",
          onButtonPress: (type) {
            if (type == DialogButtonType.primary) {
              canPop.value = true;
              WidgetsBinding.instance.addPostFrameCallback((_) {
                if (context.mounted) {
                  context.pop();
                }
              });
            }
          },
        );
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("Buat Menu"),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.save, size: 20.0),
              color: context.secondary,
              onPressed: () {
                ref.read(createControllerProvider.notifier).createPlan();
              },
            ),
          ],
        ),
        body: ScreenContent<String>(
          state: Success(""),
          overlayLoading: showLoading,
          successWidget: (data) {
            return SafeArea(
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: SizedBox(
                      child: Padding(
                        padding: const EdgeInsets.all(Dimens.ms),
                        child: Text(
                          'Menu tanggal ${request.startDate.toReadableDateWithoutYear} - ${request.endDate.toReadableDateWithoutYear}',
                          style: context.titleMedium?.copyWith(
                            color: context.primary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  for (int i = 0; i < itemLength; i++)
                    CreateFormWidget(indexes: i),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
