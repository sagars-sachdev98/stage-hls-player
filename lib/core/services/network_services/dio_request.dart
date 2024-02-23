import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:stage_hls_assignment/core/constant/api_constants.dart';

class Request {
  static Dio createApiClient({Function()? onError}) {
    final BaseOptions networkOptions = ApiConstants.networkOptions;
    Dio dio = Dio(networkOptions);

    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        // Do something before request is sent
        return handler.next(options);
      },
      onResponse: (response, handler) {
        // Do something with response data
        return handler.next(response);
      },
      onError: (e, handler) {
        // Do something with response error
        if (onError != null) {
          onError();
        }

        // You can customize the error handling based on the DioExceptionType
        if (e.type == DioExceptionType.connectionTimeout ||
            e.type == DioExceptionType.receiveTimeout) {
          // Handle timeout errors
          if (kDebugMode) {
            print('Request Timeout: $e');
          }
        } else if (e.type == DioExceptionType.badResponse) {
          // Handle non-2xx HTTP response errors
          if (kDebugMode) {
            print('HTTP Error Response: $e');
          }
        } else {
          // Handle other DioExceptionType
          if (kDebugMode) {
            print('Dio Error: $e');
          }
        }

        return handler.reject(e);
      },
    ));

    return dio;
  }
}
