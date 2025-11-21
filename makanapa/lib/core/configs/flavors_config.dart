enum Flavor {
  staging('staging'),
  production('production');

  final String description;
  const Flavor(this.description);
}

class FlavorConfig {
  String title = '';
  String baseUrl = '';
  String supabaseUrl = '';
  String env = '';
  Flavor? flavor;
}
