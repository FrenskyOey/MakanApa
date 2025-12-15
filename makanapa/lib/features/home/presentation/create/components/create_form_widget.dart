import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:makanapa/core/extension/index.dart';
import 'package:makanapa/core/helpers/dialog_helper.dart';
import 'package:makanapa/core/themes/dimens_constant.dart';
import 'package:makanapa/features/home/presentation/create/components/form_header.dart';
import 'package:makanapa/features/home/presentation/create/controllers/create_controller.dart';
import 'package:makanapa/features/home/presentation/create/model/create_enum.dart';
import 'package:makanapa/features/recipe/domain/models/recipe_item.dart';

typedef ActionCallback = void Function(ActionType action);

class CreateFormWidget extends HookConsumerWidget {
  final int indexes;
  const CreateFormWidget({super.key, required this.indexes});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final item = ref.watch(
      createControllerProvider.select((value) => value.formItem[indexes]),
    );

    final shapes = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(Dimens.ms),
    );

    Widget buildEmptyItem(VoidCallback onPressed) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(child: Text("Menu Kosong", style: context.bodyMedium)),
          InkWell(
            onTap: () {
              onPressed();
            },
            customBorder: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Ink(
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.add, color: Colors.white, size: 24.0),
              ),
            ),
          ),
        ],
      );
    }

    Widget buildRecipeWidget(RecipeItem item, ActionCallback onPressed) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 100,
            height: 70,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: CachedNetworkImage(
                imageUrl: item.picture,
                fit: BoxFit.cover,
                placeholder: (context, url) =>
                    Container(color: Colors.grey[200]),
                errorWidget: (context, url, error) => Container(
                  width: double.infinity,
                  color: Colors.grey[200],
                  child: const Icon(Icons.broken_image, color: Colors.grey),
                ),
              ),
            ),
          ),
          Dimens.ms.space,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Slight alignment adjustment
                Text(
                  item.name,
                  style: context.bodyMedium,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(item.classType.description, style: context.labelMedium),
              ],
            ),
          ),

          InkWell(
            onTap: () {
              onPressed(ActionType.update);
            },
            customBorder: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Ink(
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.edit, color: Colors.white, size: 24.0),
              ),
            ),
          ),
          Dimens.sm.space,
          InkWell(
            onTap: () {
              DialogHelper.showConfirmation(
                context: context,
                title: "Konfirmasi",
                content: "Apakah anda yakin untuk mendelete data?",
                primaryButtonText: "Ya",
                secondaryButtonText: "Tidak",
                onButtonPress: (buttonState) {
                  switch (buttonState) {
                    case DialogButtonType.primary:
                      {
                        onPressed(ActionType.delete);
                      }
                    default: // do nothing
                  }
                },
              );
            },
            customBorder: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Ink(
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.delete, color: Colors.white, size: 24.0),
              ),
            ),
          ),
        ],
      );
    }

    Widget buildFormComponents(MealType type) {
      RecipeItem? items;
      if (type == MealType.lunch) {
        items = item.lunchItem;
      } else {
        items = item.dinnerItem;
      }
      return Card(
        shape: shapes,
        elevation: 3,
        margin: EdgeInsets.zero,
        child: SizedBox(
          height: 90,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(Dimens.md, 0, Dimens.sm, 0),
            child: items == null
                ? buildEmptyItem(() {
                    ref
                        .read(createControllerProvider.notifier)
                        .onActionSubmited(item, type, ActionType.create);
                  })
                : buildRecipeWidget(items, (action) {
                    ref
                        .read(createControllerProvider.notifier)
                        .onActionSubmited(item, type, action);
                  }),
          ),
        ),
      );
    }

    return SliverMainAxisGroup(
      slivers: <Widget>[
        SliverPersistentHeader(
          pinned: true,
          delegate: FormHeaderContainer(
            child: Container(
              height: 50,
              color: context.surface,
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(left: Dimens.ms),
              child: Text(
                item.date.toReadableDate(),
                style: context.titleMedium,
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: Dimens.ms),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Siang", style: context.titleSmall),
                Dimens.ms.space,
                buildFormComponents(MealType.lunch),
                Dimens.ms.space,
                Text("Malam", style: context.titleSmall),
                Dimens.ms.space,
                buildFormComponents(MealType.dinner),
                Dimens.ms.space,
              ],
            ),
          ),
        ),
      ],
    );
  }
}
