import 'dart:io';
import 'package:isar_community/isar.dart';
import 'package:makanapa/features/basket/data/models/entity/basket_group_isar_model.dart';
import 'package:makanapa/features/basket/data/models/entity/basket_item_isar_model.dart';
import 'package:makanapa/features/home/data/models/entity/dashboard_isar_model.dart';
import 'package:makanapa/features/home/data/models/entity/weekly_detail_isar_model.dart';
import 'package:makanapa/features/onboarding/data/models/entity/user_entity.dart';
import 'package:makanapa/features/profile/data/models/entity/faq_isar_model.dart';
import 'package:makanapa/features/recipe/data/models/entity/recipe_detail_isar_model.dart';
import 'package:makanapa/features/recipe/data/models/entity/recipe_index_isar_model.dart';
import 'package:makanapa/features/recipe/data/models/entity/recipe_isar_model.dart';
import 'package:path_provider/path_provider.dart';

import 'package:makanapa/features/shared/models/device_config.dart';

import 'package:package_info_plus/package_info_plus.dart';
import 'package:device_info_plus/device_info_plus.dart';

Future<Isar> initializeIsar() async {
  final directory = await getApplicationDocumentsDirectory();
  Isar isar = await Isar.open(
    [
      UserEntitySchema,
      FaqEntitySchema,
      RecipeEntitySchema,
      RecipeDetailEntitySchema,
      RecipeIndexEntitySchema,
      DashboardEntitySchema,
      WeeklyDetailEntitySchema,
      BasketItemEntitySchema,
      BasketGroupEntitySchema,
    ],
    inspector: true,
    directory: directory.path,
  );
  return isar;
}

Future<DeviceConfig> deviceConfig() async {
  final PackageInfo packageInfo = await PackageInfo.fromPlatform();
  final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();

  String deviceOs = '';
  String deviceModel = '';
  String osVersion = '';

  // 1. Get OS and Model Info
  if (Platform.isAndroid) {
    final AndroidDeviceInfo androidInfo = await deviceInfoPlugin.androidInfo;
    deviceOs = 'Android';
    deviceModel = androidInfo.model;
    osVersion = androidInfo.version.release;
  } else if (Platform.isIOS) {
    final IosDeviceInfo iosInfo = await deviceInfoPlugin.iosInfo;
    deviceOs = 'iOS';
    deviceModel = iosInfo.utsname.machine;
    osVersion = iosInfo.systemVersion;
  } else {
    // Handle web/desktop cases if necessary
    deviceOs = Platform.operatingSystem;
    deviceModel = 'Unknown';
    osVersion = Platform.version;
  }

  // 2. Get App Version Code
  final String appVersion = '${packageInfo.version}+${packageInfo.buildNumber}';

  return DeviceConfig(
    deviceOs: deviceOs,
    deviceModel: deviceModel,
    osVersion: osVersion,
    appVersion: appVersion,
  );
}
