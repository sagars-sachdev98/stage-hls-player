
import 'dart:io';

import 'package:stage_hls_assignment/core/services/network_services/http_service.dart';
import 'package:stage_hls_assignment/features/hls_video_player/data/repositories/video.repository.dart';

class VideoRepositoryImpl implements VideoRepository {
  VideoRepositoryImpl(this._httpService);
  final HttpService _httpService;

  @override
  Future<String?> getVideoManifestFromUrl(String url) async {
    try {
      final response = await _httpService.handleGetRequest(url);
      if (response.statusCode == HttpStatus.ok) {
        String data = response.data;
        return data;
      } else {
        print('Failed to fetch data from URL: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('Error fetching data from URL: $e');
      return null;
    }
  }
}
