import 'dart:async';

import 'package:flutter/material.dart';

import 'data/shared_data/app_shared_preference.dart';
import 'initializer/app_config.dart';
import 'initializer/app_initializer.dart';
import 'presentation/app/my_app.dart';

Future<void> main() async {
  await runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await AppSharedPreference.instance.initSharedPreferences();
    await AppInitializer(AppConfig.getInstance()).init();
    _runMyApp();
  }, _reportError,);
}

Future<void> _runMyApp() async {
  runApp(const MyApp());
}

void _reportError(Object error, StackTrace stackTrace) {
  print('Uncaught exception: error: $error \n stackTrace: $stackTrace ');
}
