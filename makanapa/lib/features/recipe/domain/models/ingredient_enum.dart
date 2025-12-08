enum IngredientEnum {
  vegetable('VEG'),
  meat('MEA'),
  other('OTH'),
  nulls('NULL');

  final String description;
  const IngredientEnum(this.description);

  static IngredientEnum fromDescription(String val) {
    return IngredientEnum.values.firstWhere(
      (e) => e.description == val,
      orElse: () => IngredientEnum.nulls, // Default value
    );
  }
}
