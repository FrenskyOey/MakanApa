import 'package:chucker_flutter/chucker_flutter.dart';
import 'package:makanapa/core/configs/flavors_config.dart';
import 'package:makanapa/core/constants/key_constant.dart';
import 'package:makanapa/main_common.dart';

void main() async {
  ChuckerFlutter.showOnRelease = true;
  ChuckerFlutter.showNotification = true;

  final flavorConfig = FlavorConfig()
    ..title = 'Makan Apa'
    ..baseUrl = 'https://digimon-api.vercel.app'
    ..env = KeyConstant.envStagingFile
    ..flavor = Flavor.staging;

  mainCommon(flavorConfig);
}
