import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';

import 'package:newarchitecture/core/constants/api_base_urls.dart';
import 'package:newarchitecture/core/newtork/dio_config.dart';

class GetCurrencyService {
  // GET REQUEST CONFIGRATION
  static Future<dynamic> getData() async {
    try {
      Response res = await DioConfig.createRequest().get(BaseUrls.baseUrls);

      // IF RESPONSE ARE OK RETURN TO CERTAIN BLOC/CUBIT
      if (res.statusCode == HttpStatus.ok) {
        return res.data;
      }
    } catch (e) {
      // IF RESPONSE ARE UNSUCCESSFULLY RETURNED TO CERTAIN BLOC/CUBIT
      if (e == DioErrorType.connectTimeout ||
          e == DioErrorType.sendTimeout ||
          e == DioErrorType.receiveTimeout) {
        return "timeout";
      } else {
        return "internet";
      }
    }
  }
}
