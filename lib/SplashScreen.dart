import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:restaurant/tabScreen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EasySplashScreen(
      backgroundColor: Colors.orangeAccent,
      logo: Image.asset(
        'lib/images/img.png',
      ),
      title: const Text(
        "Fast Food",
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
      ),
      navigator: const TabScreens(),
      durationInSeconds: 10,
      logoWidth: 100,
      showLoader: true,
      loadingText: const Text("Loading..."),
    );
  }
}
