import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:makanapa/features/home/presentation/home/components/body_content_component.dart';
import 'package:makanapa/features/home/presentation/home/components/empty_component.dart';
import 'package:makanapa/features/home/presentation/home/components/week_daily_selector.dart';
import 'package:makanapa/features/home/presentation/home/controllers/home_controller.dart';
import 'package:makanapa/features/home/presentation/home/controllers/pager_controller.dart';

class BodyComponentWidget extends HookConsumerWidget {
  const BodyComponentWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentPlan = ref.watch(
      homeControllerProvider.select(
        (value) => value.dashboardData?.currentPlan,
      ),
    );

    if (currentPlan == null) {
      return const EmptyComponentWidget();
    }

    final pagerController = usePageController();

    useEffect(() {
      void listener() {
        if (pagerController.hasClients) {
          final currentPages = pagerController.page;
          if (currentPages == null) {
            return;
          }
          ref
              .read(pagerControllerProvider.notifier)
              .updateSelectedIndex(currentPages);
        }
      }

      pagerController.addListener(listener);
      return () => pagerController.removeListener(listener);
    }, []);

    final startDate = currentPlan.startDate;
    final weekList = useMemoized(() {
      return List.generate(7, (index) {
        return startDate.add(Duration(days: index));
      });
    }, [startDate]);

    useEffect(() {
      final now = DateTime.now();
      final today = DateTime(now.year, now.month, now.day);
      final index = weekList.indexWhere((date) {
        final itemDate = DateTime(date.year, date.month, date.day);
        return itemDate.isAtSameMomentAs(today);
      });

      if (index != -1) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (pagerController.hasClients) {
            pagerController.jumpToPage(index);
          }
        });
      }
      return null;
    }, [weekList]);

    return SliverToBoxAdapter(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          WeeklyDateSelector(
            dates: weekList,
            onDateSelected: (index) {
              pagerController.jumpToPage(index);
            },
          ),
          SizedBox(
            height: 220,
            child: PageView.builder(
              controller: pagerController,
              itemCount: currentPlan.meals.length,
              itemBuilder: (context, index) {
                return BodyContentComponentWidget(
                  dailyMeal: currentPlan.meals[index],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
