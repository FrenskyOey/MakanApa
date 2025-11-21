import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:isar_community/isar.dart';
import 'package:makanapa/core/configs/flavors_config.dart';
import 'package:makanapa/core/configs/routes/router.dart';
import 'package:makanapa/core/constants/key_constant.dart';
import 'package:makanapa/core/themes/app_theme.dart';
import 'package:makanapa/features/shared/models/device_config.dart';
import 'package:makanapa/features/shared/provider/master_provider.dart';
import 'package:makanapa/firebase_options.dart';
import 'package:makanapa/app_depedencies.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final flavorConfigProvider = Provider<FlavorConfig>((ref) {
  throw UnimplementedError();
});

Future<void> mainCommon(FlavorConfig config) async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: config.env);
  await _initializeFirebase();
  await _initializeSupabase(config.supabaseUrl);
  final SharedPreferences preference = await SharedPreferences.getInstance();
  final SupabaseClient supabase = Supabase.instance.client;
  final Isar isar = await initializeIsar();
  final DeviceConfig deviceConfigs = await deviceConfig();

  // how to load api key env
  // String apiKey = dotenv.get(KeyConstant.apiKey);

  runApp(
    ProviderScope(
      overrides: [
        flavorConfigProvider.overrideWith((ref) => config),
        sharedPreferenceClientsProvider.overrideWith((ref) => preference),
        supabaseClientsProvider.overrideWith((ref) => supabase),
        isarClientsProvider.overrideWith((ref) => isar),
        devicConfigClientProvider.overrideWith((ref) => deviceConfigs),
      ],
      child: const MyApp(),
    ),
  );
}

Future<void> _initializeSupabase(String supabaseUrl) async {
  String supabaseKey = dotenv.get(KeyConstant.supaKey);
  await Supabase.initialize(url: supabaseUrl, anonKey: supabaseKey);
}

Future<void> _initializeFirebase() async {
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routeProvider);
    return MaterialApp.router(
      title: 'Makan Apa',
      darkTheme: AppTheme.dark,
      theme: AppTheme.light,

      routeInformationProvider: router.routeInformationProvider,
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
    );
  }
}
