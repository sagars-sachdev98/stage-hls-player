import 'package:stage_hls_assignment/core/constant/api_constants.dart';
import 'package:stage_hls_assignment/core/services/network_services/http_service.dart';
import 'package:stage_hls_assignment/features/video_list/data/models/video_list.model.dart';
import 'package:stage_hls_assignment/features/video_list/data/sources/video_list.source.dart';

class VideoListDataSourceImpl implements VideoListDataSource {
  
  VideoListDataSourceImpl({required HttpService httpService})
      : _httpService = httpService;

  final HttpService _httpService;
  @override
  Future<List<VideoListModel>?> getVideos() async {
    final List<Map<String, dynamic>>? apiResponse =
        await _httpService.handleGetRequestList(ApiConstants.videoListEndpoint);

    return apiResponse?.map((e) => VideoListModel.fromJson(e)).toList();
  }
}
