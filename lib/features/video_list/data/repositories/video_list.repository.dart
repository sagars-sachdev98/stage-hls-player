import 'package:stage_hls_assignment/features/video_list/data/models/video_list.model.dart';

abstract class VideoListRepository {
  Future<List<VideoListModel>?> getVideos();
}