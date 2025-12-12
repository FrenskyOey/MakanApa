import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:makanapa/core/extension/index.dart';
import 'package:makanapa/core/themes/app_color.dart';
import 'package:makanapa/features/home/domain/models/avaiblity_item.dart';

class AvaibilityBottomSheetWidget extends StatelessWidget {
  final List<AvaiblityItem> items;
  final String title;

  const AvaibilityBottomSheetWidget({
    super.key,
    required this.items,
    this.title = "Pilih Jadwal",
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Header with Title and Close Button
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Stack(
            alignment: Alignment.center,
            children: [
              // Center Title
              Center(child: Text(title, style: context.titleLarge)),
              // Close Button (x button)
              Align(
                alignment: Alignment.centerRight,
                child: IconButton(
                  icon: const Icon(Icons.close),
                  color: AppColor.secondary,
                  onPressed: () => Navigator.of(context).pop(), // Close sheet
                ),
              ),
            ],
          ),
        ),
        // List of Selectable Items
        Flexible(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];
              final dateFormat = DateFormat('dd MMM yyyy');
              final dateString =
                  "${dateFormat.format(item.startDate)} - ${dateFormat.format(item.endDate)}";

              final List<Color> colors = [
                AppColor.primary,
                Colors.red,
                Colors.blue,
                Colors.orange,
                Colors.purple,
              ];

              return ListTile(
                leading: Icon(
                  Icons.calendar_today,
                  color: colors[index % colors.length],
                ),
                title: Text(dateString),
                onTap: () {
                  Navigator.of(context).pop(item);
                },
              );
            },
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
