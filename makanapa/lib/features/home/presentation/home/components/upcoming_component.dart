import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:makanapa/core/extension/index.dart';
import 'package:makanapa/core/themes/app_color.dart';
import 'package:makanapa/core/themes/dimens_constant.dart';
import 'package:makanapa/features/home/presentation/home/controllers/home_controller.dart';
import 'package:makanapa/features/shared/main/main_controller.dart';

class UpcomingComponentWidget extends HookConsumerWidget {
  const UpcomingComponentWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final (upcomingData, avaibleData) = ref.watch(
      homeControllerProvider.select(
        (value) => (
          value.dashboardData?.upcomingItems,
          value.dashboardData?.avaiblityItems,
        ),
      ),
    );

    final listLengths = (upcomingData?.length ?? 0);

    int componentLengths = listLengths;

    if (avaibleData.isNotNullOrEmpty) {
      componentLengths += 1;
    }

    return SliverPadding(
      padding: EdgeInsetsGeometry.fromLTRB(0, 0, 0, Dimens.lg),
      sliver: SliverGrid(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.6,
          crossAxisSpacing: Dimens.md,
          mainAxisSpacing: Dimens.md,
        ),
        delegate: SliverChildBuilderDelegate((context, index) {
          final isPrimary = index % 4 == 0 || index % 4 == 3;
          String content = "Tambah Menu";
          if (index < listLengths && upcomingData != null) {
            content = upcomingData[index].startDate.toReadableDateWithoutYear;
          }
          return Container(
            decoration: BoxDecoration(
              color: isPrimary ? AppColor.primary : AppColor.secondary,
              borderRadius: BorderRadius.circular(Dimens.md),
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(Dimens.md),
                onTap: () {
                  if (upcomingData == null || upcomingData.isEmpty) {
                    return;
                  }
                  if (index < listLengths) {
                    // open detail page, will do it later
                  } else {
                    final avaibleData = ref
                        .read(homeControllerProvider)
                        .dashboardData
                        ?.avaiblityItems;
                    if (avaibleData == null) {
                      return;
                    }
                    ref
                        .read(mainControllerProvider.notifier)
                        .openAvaiblityBottomSheet(avaibleData);
                  }
                },
                child: Center(child: Text(content, style: context.titleSmall)),
              ),
            ),
          );
        }, childCount: componentLengths),
      ),
    );
  }
}
