import 'package:flutter/material.dart';
import 'package:stage_hls_assignment/core/services/navigation_services/navigation_service.dart';
import 'package:stage_hls_assignment/features/video_list/presentation/views/videoList.view.dart';

class SplashView extends StatefulWidget {
  static String routeName = "/splash_screen";
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 1000), () {
      NavigationService.goNextFinishAll(context, VideoListView.routeName);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body:  Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("assets/icons/logo.png"),
          ],
        ),
      ),
    );
  }
}
