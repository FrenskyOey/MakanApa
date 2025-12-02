enum IngredientEnum {
  vegetable('VEG'),
  meat('MEA'),
  other('OTH'),
  nulls('NULL');

  final String description;
  const IngredientEnum(this.description);
}
