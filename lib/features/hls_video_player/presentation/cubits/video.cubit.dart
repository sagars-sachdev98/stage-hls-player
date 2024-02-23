import 'package:chewie/chewie.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stage_hls_assignment/core/utils/enum/attribute_type.enum.dart';
import 'package:stage_hls_assignment/features/hls_video_player/data/repositories/video.repository.dart';
import 'package:stage_hls_assignment/features/hls_video_player/presentation/cubits/video.state.dart';
import 'package:stage_hls_assignment/features/hls_video_player/utils/hls_parser.dart';
import 'package:video_player/video_player.dart';

class VideoCubit extends Cubit<VideoState> {
  VideoCubit({required this.repository, required this.url})
      : super(VideoInitialState()) {
    emit(VideoLoadingState());
    attributes = {};
    _fetchVideoData().then((value) => initVideoServices());
  }

  late VideoPlayerController videoPlayerController =
      VideoPlayerController.networkUrl(Uri.parse(url));

  late ChewieController chewieController;
  Duration? startAt;
  final VideoRepository repository;
  String? videoManifest;
  final String url;
  List<String> resolutions = [];
  Map<AttributeType, List<String>>? attributes;
  String currentResolution = "Auto";
  Map<AttributeType, String> patterns = {
    AttributeType.resolution: HlsParser.regexpResolutions,
    AttributeType.bandwidth: HlsParser.regexpBandwidth,
  };

  Map<AttributeType, List<String>>? _getAttributesFromManifest(String url) {
    String? data = videoManifest;
    if (data != null) {
      return HlsParser.extractFromManifest(data, patterns);
    }
    return null; // Return null if data fetching fails
  }

  Future<void> _fetchVideoData() async {
    // Perform asynchronous operation to fetch video data
    videoManifest = await repository.getVideoManifestFromUrl(url);
    attributes = _getAttributesFromManifest(url);

    if (attributes != null) {
      attributes?.forEach((attribute, values) {
        if (attribute == AttributeType.resolution) {
          resolutions.addAll(values);
          resolutions = HlsParser.sortResolutions(resolutions);
          resolutions.insert(0, "Auto");
          if (kDebugMode) {
            print('$attribute: $resolutions');
          }
        } else {
          if (kDebugMode) {
            print('$attribute: $values');
          }
        }
      });
    } else {
      if (kDebugMode) {
        print('Failed to fetch and extract attributes.');
      }
    }

    // Once all operations are done, return
    return;
  }

  void initVideoServices() {
    chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
      startAt: startAt,
      fullScreenByDefault: true,
      aspectRatio: _getAspectRatio(),
      autoPlay: true,
      autoInitialize: true,
    
      additionalOptions: (context) {
        return <OptionItem>[
          OptionItem(
            onTap: () { 
              Navigator.pop(context);
              showBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  // Return the content of the bottom sheet
                  return SizedBox(
                    height: 200, 
                    child: ListView(
                        children: resolutions
                            .map((resolution) => ListTile(
                                  title: Row(
                                    children: [
                                      if (currentResolution == resolution)
                                        const Icon(Icons.check)
                                      else
                                        const SizedBox(
                                          width: 20,
                                        ),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      Text(resolution),
                                    ],
                                  ),
                                  onTap: () async {
                                    emit(VideoLoadingState());
                                    _pauseVideo();
                                    await _updateResolution(resolution);

                                    emit(VideoLoadedState(
                                        videoData: attributes ?? {}));
                                    // _playVideo();
                                    if (context.mounted) {
                                      Navigator.pop(context);
                                    }
                                  },
                                ))
                            .toList()),
                  );
                },
              );
            },
            iconData: Icons.hd_outlined,
            title: 'Resolutions',
          ),
        ];
      },
    );

    emit(VideoLoadedState(videoData: attributes ?? {}));
  }

  void _playVideo() {
    chewieController.play();
  }

  void _pauseVideo() {
    chewieController.pause();
  }

  Future<Duration> _getCurrentPosition() async {
    return await videoPlayerController.position ?? Duration.zero;
  }

  Future<void> _updateResolution(String newResolution) async {
    if (currentResolution != newResolution) {
      Duration currentDuration = await _getCurrentPosition();

      videoPlayerController = VideoPlayerController.networkUrl(Uri.parse(
          HlsParser.appendResolutionToUrl(url, newResolution.split("x").last)));

      chewieController = chewieController.copyWith(
          startAt: currentDuration,
          videoPlayerController: videoPlayerController);

      currentResolution = newResolution;
    }
    return;
  }

  double _getAspectRatio() {
    double videoContainerRatio = 0.5;

    double videoRatio = videoPlayerController.value.aspectRatio;

    if (videoRatio < videoContainerRatio) {
      ///for tall videos, we just return the inverse of the controller aspect ratio
      return videoContainerRatio / videoRatio;
    } else {
      ///for wide videos, divide the video AR by the fixed container AR
      ///so that the video does not over scale

      return videoRatio / videoContainerRatio;
    }
  }
}
