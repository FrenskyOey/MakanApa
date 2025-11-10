enum Flavor { staging, production }

class FlavorConfig {
  String title = '';
  String baseUrl = '';
  String supabaseUrl = '';
  String env = '';
  Flavor? flavor;
}
