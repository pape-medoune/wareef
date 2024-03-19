import 'package:flutter/material.dart';
import 'package:flame_splash_screen/flame_splash_screen.dart';
import 'package:wareef/Pages/HomePage.dart';
import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:wareef/auth/login.dart';

class SplashScreenGame extends StatefulWidget {
  const SplashScreenGame({Key? key}) : super(key: key);

  @override
  SplashScreenGameState createState() => SplashScreenGameState();
}

class SplashScreenGameState extends State<SplashScreenGame> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          // FlameSplashScreen(
          //   showBefore: (BuildContext context) {
          //     return const Text(
          //       'WAREËF',
          //       style: TextStyle(
          //         fontSize: 50,
          //         color: Colors.white,
          //       ),
          //     );
          //   },
          //   showAfter: (BuildContext context) {
          //     return
          //     // const Text(
          //     //  "🤫",
          //     //   style: TextStyle(
          //     //     fontSize: 45,
          //     //     color: Colors.white,
          //     //   ),
          //     // );
          //     CircularProgressIndicator();
          //   },
          //   theme: FlameSplashTheme.dark,
          //   onFinish: (BuildContext context) {
          //     Navigator.pushReplacement(
          //       context,
          //       MaterialPageRoute(
          //         builder: (context) => const Login(),
          //       ),
          //     );
          //   },
          // ),
          FlutterSplashScreen.fadeIn(
        backgroundColor: Color(0x00020206),
        onInit: () {
          debugPrint("On Init");
        },
        onEnd: () {
          debugPrint("On End");
        },
        childWidget: SizedBox(
          height: 200,
          width: 200,
          child: const Text(
            'WAREËF',
            style: TextStyle(
              fontSize: 50,
              color: Colors.white,
            ),
          ),
        ),
        onAnimationEnd: () => debugPrint("On Fade In End"),
        nextScreen: const Login(),
      ),
    );
  }
}
