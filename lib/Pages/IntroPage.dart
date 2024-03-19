import 'package:flutter/material.dart';
import 'package:wareef/components/SplashScreenGame.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SplashScreenGame(),
    );
  }
}
