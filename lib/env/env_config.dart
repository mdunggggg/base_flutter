import 'package:injectable/injectable.dart';

@injectable
class EnvironmentConfig {
  // ignore: constant_identifier_names
  static const APP_NAME =
  String.fromEnvironment('DART_DEFINES_APP_NAME', defaultValue: 'Karate');
  static const BASE_URL_HTTP =
  String.fromEnvironment('DART_DEFINES_BASE_URL_HTTP');
}
