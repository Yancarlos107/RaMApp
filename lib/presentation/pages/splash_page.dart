// ignore_for_file: library_private_types_in_public_api

import 'dart:async';

import 'package:digital_test/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    Future.delayed(const Duration(seconds: 2), () {
      navigateToHome(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/splash.jpg',
          fit: BoxFit.cover,
          height: double.infinity,
          width: double.infinity,
        ),
      ),
    );
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }
}

void navigateToHome(BuildContext context) async {
  // Precarga todas las imágenes necesarias
  await precacheImage(const AssetImage('assets/portal.jpg'), context);
  await precacheImage(const AssetImage('assets/character.png'), context);
  await precacheImage(const AssetImage('assets/location.png'), context);
  await precacheImage(const AssetImage('assets/episodes.jpeg'), context);

  // Una vez cargadas, navega a la pantalla principal
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => const HomePage()),
  );
}
