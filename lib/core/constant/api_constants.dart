import 'package:dio/dio.dart';

class ApiConstants {
  static const String baseUrl = 'https://base-url';
  static const String videoListEndpoint = '/getVideos';

  static final BaseOptions networkOptions = BaseOptions(
    baseUrl: baseUrl,
    responseType: ResponseType.json,
    contentType: 'application/json',
    connectTimeout: const Duration(milliseconds: 10000),
  );
}
