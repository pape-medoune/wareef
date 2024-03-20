import 'package:flutter/material.dart';
import 'package:wareef/components/splash_screen_game.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SplashScreenGame(),
    );
  }
}
