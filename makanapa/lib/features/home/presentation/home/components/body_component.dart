import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:makanapa/features/home/presentation/home/components/body_content_component.dart';
import 'package:makanapa/features/home/presentation/home/components/empty_component.dart';
import 'package:makanapa/features/home/presentation/home/components/week_daily_selector.dart';
import 'package:makanapa/features/home/presentation/home/controllers/home_controller.dart';

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

    final startDate = currentPlan.startDate;
    final weekList = useMemoized(() {
      return List.generate(7, (index) {
        return startDate.add(Duration(days: index));
      });
    }, [startDate]);

    return SliverToBoxAdapter(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          WeeklyDateSelector(
            dates: weekList,
            selectedIndex: 4,
            onDateSelected: (index) {},
          ),
          SizedBox(
            height: 220,
            child: PageView.builder(
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
