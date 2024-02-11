import 'package:equatable/equatable.dart';
import 'package:stage_hls_assignment/core/utils/enum/attribute_type.enum.dart';

abstract class VideoState extends Equatable {}

class VideoInitialState extends VideoState {
  @override
  List<Object?> get props => ['VideoInitialState'];
}

class VideoLoadingState extends VideoState {
  @override
  List<Object?> get props => ['VideoLoadingState'];
}

class VideoErrorState extends VideoState {
  VideoErrorState(this.errorMessage);

  final String errorMessage;
  @override
  List<Object?> get props => [errorMessage];
}

class VideoLoadedState extends VideoState {
  final Map<AttributeType, List<String>> videoData;

  VideoLoadedState({required this.videoData});

  @override
  List<Object?> get props => [videoData];
}
