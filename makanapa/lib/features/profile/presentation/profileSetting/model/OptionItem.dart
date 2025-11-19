import 'package:flutter/material.dart';
import 'package:makanapa/core/themes/app_color.dart';

class OptionItem {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color color;

  const OptionItem({
    required this.icon,
    required this.title,
    required this.subtitle,
    this.color = AppColor.secondary,
  });
}
