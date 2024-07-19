import '../../env/env_config.dart';

class Api {
  static String baseUrl = EnvironmentConfig.BASE_URL_HTTP;

  static String personDetail = '$baseUrl/person/v1/detail';
  static String personList = '$baseUrl/person/v1/list';
  static String refreshToken = 'account/v1/refresh_token';
}
