import 'dart:developer';

import 'package:chucker_flutter/chucker_flutter.dart';
import 'package:dio/dio.dart';
import 'package:makanapa/core/configs/flavors_config.dart';
import 'package:makanapa/features/shared/models/device_config.dart';
import 'package:makanapa/features/shared/network/interceptor/auth_interceptor.dart';
import 'package:makanapa/main_common.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:isar_community/isar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'master_provider.g.dart';

@Riverpod(keepAlive: true)
Dio dioClients(Ref ref) {
   final flavorConfig = ref.read(flavorConfigProvider);

  final chuckerInterceptor = ChuckerDioInterceptor();
  final logInterceptor = LogInterceptor(
    requestBody: true,
    responseBody: true,
    logPrint: (obj) {
      log(obj.toString());
    },
  );

  final flavors = flavorConfig.flavor ?? Flavor.staging;
  final Duration kConnectTimeout = flavors == Flavor.production
      ? Duration(seconds: 15)
      : Duration(seconds: 8);
  final Duration kReceiveTimeout = flavors == Flavor.production
      ? Duration(seconds: 25)
      : Duration(seconds: 15);

  final dio = Dio(
    BaseOptions(
      baseUrl: flavorConfig.baseUrl,
      connectTimeout: kConnectTimeout,
      receiveTimeout: kReceiveTimeout,
      sendTimeout: kConnectTimeout,

      headers: {'Content-Type': 'application/json'},

      validateStatus: (status) {
        return status != null && status >= 200 && status < 300;
      },

      responseType: ResponseType.json,
    ),
  );

  dio.interceptors.add(chuckerInterceptor);
  dio.interceptors.add(logInterceptor);

  final config = ref.read(devicConfigClientProvider);
  final authInterceptor = AuthInterceptor(
    deviceConfig: config,
    ref: ref,
    dio: dio,
  );
  dio.interceptors.add(authInterceptor);
  return dio;
}

@Riverpod(keepAlive: true)
SupabaseClient supabaseClients(Ref ref) {
  throw UnimplementedError();
}

@Riverpod(keepAlive: true)
SharedPreferences sharedPreferenceClients(Ref ref) {
  throw UnimplementedError();
}

@Riverpod(keepAlive: true)
DeviceConfig devicConfigClient(Ref ref) {
  throw UnimplementedError();
}

@Riverpod(keepAlive: true)
Isar isarClients(Ref ref) {
  throw UnimplementedError();
}
