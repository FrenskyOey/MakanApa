import 'package:flutter/material.dart';

// --- (Step 1: Define the StickyHeaderDelegate as shown above) ---
class FaqHeaderContainer extends SliverPersistentHeaderDelegate {
  final Widget child;
  final double minHeight;
  final double maxHeight;

  FaqHeaderContainer({
    required this.child,
    this.minHeight = 50.0,
    this.maxHeight = 50.0,
  });

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => maxHeight;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(FaqHeaderContainer oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}
