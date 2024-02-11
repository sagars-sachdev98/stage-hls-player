import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:stage_hls_assignment/core/presentation/views/base.view.dart';
import 'package:stage_hls_assignment/core/services/navigation_services/navigation_service.dart';
import 'package:stage_hls_assignment/features/hls_video_player/presentation/views/hls_video_player.view.dart';
import 'package:stage_hls_assignment/features/video_list/data/repositories/video_list_impl.repository.dart';
import 'package:stage_hls_assignment/features/video_list/data/sources/mock_video_list_impl.source.dart';
import 'package:stage_hls_assignment/features/video_list/presentation/cubits/videoList.cubit.dart';
import 'package:stage_hls_assignment/features/video_list/presentation/cubits/videoList.state.dart';

class VideoListView extends StatelessWidget {
  static String routeName = "/video_list_view";
  const VideoListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<VideoListCubit>(
      create: (context) => VideoListCubit(
        repository:
            VideoListRepositoryImpl(dataSource: MockVideolistDataSourceImpl()),
      ),
      child: const VideoListContent(),
    );
  }
}

class VideoListContent extends StatelessWidget {
  const VideoListContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView(
      child: BlocBuilder<VideoListCubit, VideoListState>(
        builder: (context, videoListState) {
          return Padding(
            padding: const EdgeInsets.all(8),
            child: GridView.builder(
              itemCount: videoListState.videoList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Number of columns
                crossAxisSpacing: 8, // Spacing between columns
                mainAxisSpacing: 8, // Spacing between rows
                childAspectRatio: 9 / 16, // Aspect ratio of each grid item
              ),
              itemBuilder: (context, index) {
                return ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(14)),
                  child: videoListState.videoList[index].thumbnail != null
                      ? InkWell(
                          onTap: () {
                            NavigationService.goNext(
                              context,
                              HlsVideoPlayerView.routeName,
                              arg: {
                                "url": videoListState.videoList[index].url,
                              },
                            );
                          },
                          child: CachedNetworkImage(
                            imageUrl:
                                videoListState.videoList[index].thumbnail!,
                            placeholder: (context, url) => Shimmer.fromColors(
                              baseColor: Colors.grey[400]!,
                              highlightColor: Colors.grey[600]!,
                              child: SizedBox(
                                width: double.infinity,
                                height: double.infinity,
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(14.0),
                                  ),
                                ),
                              ),
                            ),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                            fit: BoxFit.cover,
                          ),
                        )
                      : const SizedBox(), // or any other widget to show when thumbnail is null
                );
              },
            ),
          );
        },
      ),
    );
  }
}
