import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stage_hls_assignment/core/presentation/views/base.view.dart';
import 'package:stage_hls_assignment/core/services/network_services/dio_rest_service.dart';
import 'package:stage_hls_assignment/features/hls_video_player/data/repositories/video_impl.repository.dart';
import 'package:stage_hls_assignment/features/hls_video_player/presentation/viewmodels/video.cubit.dart';
import 'package:stage_hls_assignment/features/hls_video_player/presentation/viewmodels/video.state.dart';
import 'package:stage_hls_assignment/features/hls_video_player/presentation/widgets/hls_video_palyer.dart';
import 'package:stage_hls_assignment/features/hls_video_player/presentation/widgets/loading_video_player.dart';

class HlsVideoPlayerView extends StatelessWidget {
  static String routeName = "/Hls_video_palyer_view";

  const HlsVideoPlayerView({super.key});

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    return BlocProvider<VideoCubit>(
      create: (context) => VideoCubit(
          repository: VideoRepositoryImpl(ApiRestService()), url: args['url']),
      child: const HlsVideoPlayerContent(),
    );
  }
}

class HlsVideoPlayerContent extends StatelessWidget {
  const HlsVideoPlayerContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView(
      child:
          BlocBuilder<VideoCubit, VideoState>(builder: (context, videoState) {
        if (videoState is VideoInitialState) {
          return const LoadingWidget();
        } else if (videoState is VideoLoadingState) {
         return const LoadingWidget();
        } else if (videoState is VideoLoadedState) {
          return HlsVideoPlayer(
            chewieController: context.watch<VideoCubit>().chewieController,
          );
        } else {
          return Container();
        }
      }),
    );
  }
}
