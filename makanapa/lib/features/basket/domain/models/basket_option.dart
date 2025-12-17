class BasketSummary {
  final BasketOptionItem? currentGroup;
  final List<BasketOptionItem> upcomingGroup;

  const BasketSummary({
    required this.currentGroup,
    required this.upcomingGroup,
  });
}

class BasketOptionItem {
  final int groupId;
  final DateTime startDate;
  final DateTime endDate;

  const BasketOptionItem({
    required this.groupId,
    required this.startDate,
    required this.endDate,
  });
}
