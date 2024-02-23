import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stage_hls_assignment/features/video_list/data/repositories/video_list.repository.dart';
import 'package:stage_hls_assignment/features/video_list/presentation/cubits/videoList.state.dart';

class VideoListCubit extends Cubit<VideoListState> {
  VideoListCubit({required this.repository})
      : super(const VideoListState(videoList: [])) {
    _fetchVideoListDetails();
  }
  final VideoListRepository repository;

  Future<void> _fetchVideoListDetails() async {
    try {
      
      final result = await repository.getVideos();
      emit(VideoListState(videoList: result ?? []));
    } catch (e) {
      emit(VideoListState(videoList: const [], errorMessage: e.toString()));
    }
  }
}
