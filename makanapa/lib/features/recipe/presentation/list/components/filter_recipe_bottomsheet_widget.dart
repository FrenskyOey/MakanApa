import 'package:flutter/material.dart';
import 'package:makanapa/core/extension/index.dart';
import 'package:makanapa/core/themes/app_color.dart';
import 'package:makanapa/features/recipe/domain/models/class_enum.dart';

class FilterRecipeBottomsheet extends StatelessWidget {
  final String title;
  final String? currentSelection;

  const FilterRecipeBottomsheet({
    super.key,
    this.title = "Pilih Tipe Masakan",
    this.currentSelection,
  });

  @override
  Widget build(BuildContext context) {
    List<ClassEnum> items = [
      ClassEnum.all,
      ClassEnum.favorite,
      ClassEnum.indonesia,
      ClassEnum.china,
      ClassEnum.korea,
      ClassEnum.jepang,
      ClassEnum.western,
      ClassEnum.thailand,
      ClassEnum.lainnya,
    ];

    final selectedColor = context.secondary;

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
              String description = item.description;
              if (item == ClassEnum.favorite) {
                description = "Favorite";
              }
              final isSelected = item.description == currentSelection;

              return ListTile(
                title: Text(
                  description,
                  style: TextStyle(
                    color: isSelected ? selectedColor : null,
                    fontWeight: isSelected
                        ? FontWeight.bold
                        : FontWeight.normal,
                  ),
                ),
                onTap: () {
                  if (item == ClassEnum.all) {
                    Navigator.of(context).pop("");
                    return;
                  }
                  Navigator.of(context).pop(item.description);
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
