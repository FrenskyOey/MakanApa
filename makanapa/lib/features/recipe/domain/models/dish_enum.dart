enum DishEnum {
  main('Utama'),
  side('Pendamping');

  final String description;
  const DishEnum(this.description);

  static DishEnum fromDescription(String val) {
    return DishEnum.values.firstWhere(
      (e) => e.description == val,
      orElse: () => DishEnum.main, // Default value
    );
  }
}
