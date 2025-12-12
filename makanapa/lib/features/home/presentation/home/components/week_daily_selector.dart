import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:makanapa/core/extension/src/text_style_extension.dart';
import 'package:makanapa/core/themes/app_color.dart';
import 'package:makanapa/features/home/presentation/home/controllers/pager_controller.dart';

class WeeklyDateSelector extends HookConsumerWidget {
  final List<DateTime> dates;
  final Function(int) onDateSelected;

  const WeeklyDateSelector({
    super.key,
    required this.dates,
    required this.onDateSelected,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int selectedIndex = ref.watch(pagerControllerProvider).round();

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: dates.asMap().entries.map((entry) {
        final index = entry.key;
        final date = entry.value;

        return Expanded(
          child: _DateItem(
            index: index,
            date: date,
            isSelected: index == selectedIndex,
            onTap: () => onDateSelected(index),
          ),
        );
      }).toList(),
    );
  }
}

class _DateItem extends StatelessWidget {
  final int index;
  final DateTime date;
  final bool isSelected;
  final VoidCallback onTap;

  const _DateItem({
    required this.index,
    required this.date,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    // Determine Logic for Colors
    final now = DateTime.now();

    // Normalize to midnight for accurate day comparison
    final today = DateTime(now.year, now.month, now.day);
    final itemDate = DateTime(date.year, date.month, date.day);

    final isToday = itemDate.isAtSameMomentAs(today);
    final isPast = itemDate.isBefore(today);

    // 1. Text Color Logic
    Color textColor;
    if (isSelected) {
      textColor = Colors.white; // Selected
    } else if (isToday) {
      textColor = AppColor.primary; // Today
    } else if (isPast) {
      textColor = AppColor.secondary; // Dark Green (Yesterday/Past)
    } else {
      textColor = AppColor.primaryBright; // Light Green (Future)
    }

    BoxDecoration? decoration;
    if (isSelected) {
      decoration = BoxDecoration(
        color: AppColor.primary,
        borderRadius: BorderRadius.circular(12),
      );
    } else if (isToday) {
      decoration = BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.green, // Round rect green border
          width: 2.0,
        ),
      );
    }

    String day = "UNK";

    switch (index) {
      case 0:
        day = "SEN";
        break;
      case 1:
        day = "SLS";
        break;
      case 2:
        day = "RAB";
        break;
      case 3:
        day = "KAM";
        break;
      case 4:
        day = "JMT";
        break;
      case 5:
        day = "SAB";
        break;
      case 6:
        day = "MNG";
        break;
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2.0),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          decoration: decoration,
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Date (Dec 5)
              Text(
                DateFormat('MMM d').format(date),
                style: context.labelMedium?.copyWith(
                  color: textColor.withValues(alpha: .8),
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 4),
              // Day (FRI)
              Text(day, style: context.titleSmall?.copyWith(color: textColor)),
            ],
          ),
        ),
      ),
    );
  }
}
