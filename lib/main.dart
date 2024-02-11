import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stage_hls_assignment/core/presentation/views/splash.view.dart';
import 'package:stage_hls_assignment/core/services/navigation_services/navigation_service.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      routes: NavigationService.generateRoute(),
      home: const SplashView(),
      theme: ThemeData(
        primaryColor: const Color(0xff151515),
        appBarTheme: const AppBarTheme(backgroundColor: Color(0xffDF1D3A),iconTheme: IconThemeData(color: Color(0xff151515))),
        iconTheme: const IconThemeData(color: Color(0xff151515)),
        iconButtonTheme: IconButtonThemeData(
            style: ButtonStyle(
                iconColor: MaterialStateProperty.all(const Color(0xff151515)))),
        scaffoldBackgroundColor: const Color(0xff151515),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
