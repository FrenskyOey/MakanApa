enum ClassEnum {
  all('Semua'),
  favorite('bookmark'),
  indonesia('Indonesia'),
  china('China'),
  korea('Korea'),
  jepang('Jepang'),
  western('Western'),
  thailand('Thailand'),
  lainnya('Lainnya');

  final String description;
  const ClassEnum(this.description);

  static ClassEnum fromDescription(String val) {
    return ClassEnum.values.firstWhere(
      (e) => e.description == val,
      orElse: () => ClassEnum.indonesia, // Default value
    );
  }
}
