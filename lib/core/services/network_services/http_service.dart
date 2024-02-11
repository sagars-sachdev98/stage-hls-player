import 'package:dio/dio.dart';

abstract class HttpService {
  Future<Response> handleGetRequest(String endPoint,
      {Map<String, dynamic> queryParameters = const {}, Function()? onError});

  Future<List<Map<String, dynamic>>?> handleGetRequestList(String endPoint,
      {Map<String, dynamic> queryParameters = const {}, Function()? onError});

  // Future<Response> handlePostRequest(String endPoint, dynamic data,
  //     {Map<String, dynamic> queryParameters = const {}, Function()? onError});

  // Future<Response> handlePostRequestList(String endPoint, List<dynamic>? data,
  //     {Map<String, dynamic> queryParameters = const {}, Function()? onError});

  // Future<Response> handlePutRequest(String endPoint,
  //     {Map<String, dynamic>? data,
  //     Map<String, dynamic> queryParameters = const {},
  //     Function()? onError});

  // Future<Response> handleDeleteRequest(String endPoint,
  //     {Map<String, dynamic> queryParameters = const {}, Function()? onError});
}
