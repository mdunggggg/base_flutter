import 'package:dio/dio.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';
import 'package:injectable/injectable.dart';

import '../shared_data/app_shared_preference.dart';
import '../shared_data/pref_keys.dart';
import 'api_path.dart';
import 'dio_logger.dart';
import 'interceptor.dart';

@injectable
class BaseDio {
  Dio? _instance;

  Dio _dio() {
    _instance = _createDioInstance();
    return _instance!;
  }

  var headers = {
    'Content-Type': 'application/json',
    'accept': 'application/json',
  };

  Dio _createDioInstance() {
    late Dio dio;
    final token = AppSharedPreference.instance.getValue(PrefKeys.token);
    var header = headers;
    if (token != null) header = {...headers, 'authorization': 'Bearer $token'};
    dio = Dio(BaseOptions(headers: header));

    dio.interceptors.clear();
    dio.interceptors.addAll(
      [
        ApiInterceptor(),
        PrettyDioLogger(requestBody: true),
        RetryInterceptor(
          dio: dio,
          retries: 3,
          logPrint: print,
          retryDelays: [
            const Duration(seconds: 1),
            const Duration(seconds: 2),
            const Duration(seconds: 3),
          ],
        ),
      ],
    );
    return dio;
  }

  void _saveTokenToStorage(String token) {
    AppSharedPreference.instance.setValue(PrefKeys.token, token);
  }

  static String baseURL = Api.baseUrl;

  Future<dynamic> get(String path, {Map<String, dynamic>? data}) async {
    return _dio().get('$baseURL/$path', queryParameters: data);
  }

  Future<dynamic> post(String path, {Object? data}) async {
    return _dio().post('$baseURL/$path', data: data);
  }

  Future<dynamic> put(String path, {Object? data}) async {
    return _dio().put('$baseURL/$path', data: data);
  }

  Future<dynamic> delete(String path, {Object? data}) async {
    return _dio().delete('$baseURL/$path', data: data);
  }

  Future<dynamic> patch(String path, {Object? data}) async {
    return _dio().patch('$baseURL/$path', data: data);
  }

  Future<dynamic> getWithUrl(String path,
      {Map<String, dynamic>? data, Options? options}) async {
    return _dio().get(
      path,
      queryParameters: data,
      options: options,
    );
  }

  Future<dynamic> postWithUrl(String path,
      {Object? data, Options? options}) async {
    return _dio().post(
      path,
      data: data,
      options: options,
    );
  }

  Future<dynamic> putWithUrl(String path,
      {Object? data, Options? options}) async {
    return _dio().put(
      path,
      data: data,
      options: options,
    );
  }

  Future<dynamic> deleteWithUrl(String path,
      {Object? data, Options? options}) async {
    return _dio().delete(
      path,
      data: data,
      options: options,
    );
  }

  Future<dynamic> patchWithUrl(String path,
      {Object? data, Options? options}) async {
    return _dio().patch(
      path,
      data: data,
      options: options,
    );
  }
}
