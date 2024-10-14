import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:news_app/feature/screens/Navigation_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: EasySplashScreen(
        logo: Image.asset('assets/images/news.jpeg'),
        logoWidth: 120,
        backgroundColor: Colors.white,
        showLoader: true,
        loaderColor: Colors.red,
        loadingText: const Text('Loading...'),
        durationInSeconds: 3,
        navigator: const NavigationScreen(),
      ),
    );
  }
}
