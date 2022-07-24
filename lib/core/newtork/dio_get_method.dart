import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:newarchitecture/core/newtork/dio_config.dart';

class DioGetRequest {
  // GET REQUEST CONFIGRATION
  static getData({required String url, Map<String, dynamic>? header}) async {
    dynamic response;
    try {
      Response res = await DioConfig.createRequest()
          .get(url, options: Options(headers: header));
      response = res;
      return response;
    } on DioErrorType catch (e) {
      if (e == DioErrorType.connectTimeout ||
          e == DioErrorType.sendTimeout ||
          e == DioErrorType.receiveTimeout) {
        response = "timeoutError";
        return response;
      } else {
        response = "internetError";
        return response;
      }
    }
  }
}
