import 'package:dio/dio.dart';

class DioConfig {
  static Dio createRequest() {
    var dio = Dio(BaseOptions(receiveDataWhenStatusError: true));

    // Time out
    dio.options.connectTimeout = 45 * 1000;
    dio.options.sendTimeout = 45 * 1000;
    dio.options.receiveTimeout = 45 * 1000;
    return dio;
  }
}
