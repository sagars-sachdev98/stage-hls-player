import 'package:equatable/equatable.dart';
import 'package:stage_hls_assignment/features/video_list/data/models/video_list.model.dart';

class VideoListState extends Equatable {
  final List<VideoListModel> videoList;
  final String errorMessage;
  
  const VideoListState({required this.videoList, this.errorMessage = ""});

  @override
  List<Object?> get props => [videoList];
}
