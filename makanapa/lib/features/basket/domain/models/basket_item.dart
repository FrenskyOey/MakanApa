class BasketItem {
  final String name;
  final String unit;
  final int qty;
  final String type;
  final bool isMarked;

  const BasketItem({
    required this.name,
    required this.unit,
    required this.qty,
    required this.type,
    required this.isMarked,
  });
}
