import 'package:flutter/material.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';

class OnBoardingIntro extends StatefulWidget {
  const OnBoardingIntro({Key? key}) : super(key: key);

  @override
  _OnBoardingIntroState createState() => _OnBoardingIntroState();
}

class _OnBoardingIntroState extends State<OnBoardingIntro> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: OnBoardingSlider(
            finishButtonText: 'Register',
            onFinish: () {
              Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (context) => const RegisterPage(),
                ),
              );
            },
            finishButtonStyle: FinishButtonStyle(
              backgroundColor: kDarkBlueColor,
            ),
            skipTextButton: Text(
              'Skip',
              style: TextStyle(
                fontSize: 16,
                color: kDarkBlueColor,
                fontWeight: FontWeight.w600,
              ),
            ),
            trailing: Text(
              'Login',
              style: TextStyle(
                fontSize: 16,
                color: kDarkBlueColor,
                fontWeight: FontWeight.w600,
              ),
            ),
            trailingFunction: () {
              Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (context) => const LoginPage(),
                ),
              );
            },
            controllerColor: kDarkBlueColor,
            totalPage: 3,
            headerBackgroundColor: Colors.white,
            pageBackgroundColor: Colors.white,
            background: [
              Image.asset(
                'assets/slide_1.png',
                height: 400,
              ),
              Image.asset(
                'assets/slide_2.png',
                height: 400,
              ),
              Image.asset(
                'assets/slide_3.png',
                height: 400,
              ),
            ],
            speed: 1.8,
            pageBodies: [
              Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    const SizedBox(
                      height: 480,
                    ),
                    Text(
                      'On your way...',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: kDarkBlueColor,
                        fontSize: 24.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'to find the perfect looking Onboarding for your app?',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black26,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    const SizedBox(
                      height: 480,
                    ),
                    Text(
                      'You’ve reached your destination.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: kDarkBlueColor,
                        fontSize: 24.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Sliding with animation',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black26,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    const SizedBox(
                      height: 480,
                    ),
                    Text(
                      'Start now!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: kDarkBlueColor,
                        fontSize: 24.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Where everything is possible and customize your onboarding.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black26,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
