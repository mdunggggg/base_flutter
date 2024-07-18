import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';

import 'data/shared_data/app_shared_preference.dart';
import 'initializer/app_config.dart';
import 'initializer/app_initializer.dart';
import 'presentation/app/my_app.dart';
import 'utils/log_utils.dart';

Future<void> main() async {
  await runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await AppSharedPreference.instance.initSharedPreferences();
    await AppInitializer(AppConfig.getInstance()).init();
    _runMyApp();
  }, _reportError,);
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
  Log.e(error, stackTrace: stackTrace, name: 'Uncaught exception');
}
