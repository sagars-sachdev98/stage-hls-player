import 'package:dio/dio.dart';
import 'package:stage_hls_assignment/core/services/network_services/dio_request.dart';
import 'package:stage_hls_assignment/core/services/network_services/http_service.dart';

// final apiRestServiceProvider = Provider<HttpService>((ref) => ApiRestService());

class ApiRestService implements HttpService {
  @override
  Future<List<Map<String, dynamic>>> handleGetRequestList(String endPoint,
      {Map<String, dynamic> queryParameters = const {},
      Function()? onError}) async {
    Response? response;

    Dio? dio = Request.createApiClient(onError: onError);

    response = await dio.get(
      endPoint,
      queryParameters: queryParameters,
    );
    List<Map<String, dynamic>> apiResponse = response.data != null
        ? (response.data as List).map((e) => e as Map<String, dynamic>).toList()
        : [];
    return apiResponse;
  }

  @override
  Future<Response> handleGetRequest(String endPoint,
      {Map<String, dynamic> queryParameters = const {},
      Function()? onError}) async {


    Dio? dio = Request.createApiClient(onError: onError);

   final response = await dio.get(
      endPoint,
      queryParameters: queryParameters,
    );

    return response;
  }
}
