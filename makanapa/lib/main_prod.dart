import 'package:chucker_flutter/chucker_flutter.dart';
import 'package:makanapa/core/configs/flavors_config.dart';
import 'package:makanapa/core/constants/key_constant.dart';
import 'package:makanapa/main_common.dart';

void main() async {
  ChuckerFlutter.showOnRelease = false;
  ChuckerFlutter.showNotification = false;

  final flavorConfig = FlavorConfig()
    ..title = 'Makan Apa'
    ..baseUrl = 'https://tajpcrucnaiuviirjned.supabase.co/functions'
    ..supabaseUrl = 'https://tajpcrucnaiuviirjned.supabase.co'
    ..env = KeyConstant.envProdFile
    ..flavor = Flavor.production;

  mainCommon(flavorConfig);
}
