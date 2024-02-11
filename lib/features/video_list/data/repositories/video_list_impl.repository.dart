import 'package:stage_hls_assignment/features/video_list/data/models/video_list.model.dart';
import 'package:stage_hls_assignment/features/video_list/data/repositories/video_list.repository.dart';
import 'package:stage_hls_assignment/features/video_list/data/sources/video_list.source.dart';

class VideoListRepositoryImpl implements VideoListRepository {
  VideoListRepositoryImpl({required VideoListDataSource dataSource})
      : _dataSource = dataSource;

  final VideoListDataSource _dataSource;

  @override
  Future<List<VideoListModel>?> getVideos() {
    return _dataSource.getVideos();
  }
}
