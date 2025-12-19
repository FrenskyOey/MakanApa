class BasketItem {
  final int id;
  final int groupId;
  final String name;
  final String unit;
  final int qty;
  final String type;
  final bool isMarked;

  const BasketItem({
    required this.id,
    required this.groupId,
    required this.name,
    required this.unit,
    required this.qty,
    required this.type,
    required this.isMarked,
  });
}
