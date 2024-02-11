import 'package:chewie/chewie.dart';
import 'package:flutter/widgets.dart';

class HlsVideoPlayer extends StatelessWidget {
  const HlsVideoPlayer({super.key, required this.chewieController});
  final ChewieController chewieController;
  @override
  Widget build(BuildContext context) {
    return Chewie(controller: chewieController);
  }
}
