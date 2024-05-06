import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';

import 'data/shared_data/app_shared_preference.dart';
import 'data/shared_data/pref_keys.dart';
import 'initializer/app_config.dart';
import 'initializer/app_initializer.dart';
import 'presentation/app/my_app.dart';

Future<void> main() async {
  await runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await AppSharedPreference.instance.initSharedPreferences();
    await AppSharedPreference.instance.setValue(PrefKeys.token, "123");
    await AppInitializer(AppConfig.getInstance()).init();
    _runMyApp();
  }, _reportError);
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

Future<void> _runMyApp() async {
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}

void _reportError(Object error, StackTrace stackTrace) {
  print('Uncaught exception: error: $error \n stackTrace: $stackTrace ');
}
