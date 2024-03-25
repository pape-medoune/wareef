import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart'; 
import 'package:wareef/auth/login.dart';
import 'package:wareef/auth/register.dart';

class OnBoardingIntro extends StatefulWidget {
  const OnBoardingIntro({super.key});

  @override
  _OnBoardingIntroState createState() => _OnBoardingIntroState();
}

class _OnBoardingIntroState extends State<OnBoardingIntro> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OnBoardingSlider(
        finishButtonText: 'Register',
        onFinish: () {
          Navigator.push(
            context,
            CupertinoPageRoute(
              builder: (context) => const Register(),
            ),
          );
        },
        finishButtonStyle: const FinishButtonStyle(
          backgroundColor: Color.fromARGB(255, 2, 137, 96),
        ),
        skipTextButton: GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Login(),
                ));
          },
          child: const Text(
            'Passer',
            style: TextStyle(
              fontSize: 16,
              color: Color.fromARGB(255, 2, 137, 96),
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        trailing: const Text(
          'Login',
          style: TextStyle(
            fontSize: 16,
            color: Color.fromARGB(255, 2, 137, 96),
            fontWeight: FontWeight.w600,
          ),
        ),
        trailingFunction: () {
          Navigator.push(
            context,
            CupertinoPageRoute(
              builder: (context) => const Login(),
            ),
          );
        },
        controllerColor: const Color.fromARGB(255, 2, 137, 96),
        totalPage: 3,
        headerBackgroundColor:Color(0x00020206),
        pageBackgroundColor: Color(0x00020206),
        background: [
          Image.asset(
            'assets/images/20945830-removebg-preview.png',
            height: 400,
          ),
          Image.asset(
            'assets/images/20944169-removebg-preview.png',
            height: 400,
          ),
          Image.asset(
            'assets/images/img1-removebg-preview.png',
            height: 400,
          ),
        ],
        speed: 1.8,
        pageBodies: [
          Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 430,
                ),
                Text(
                  'WAREEF ?...',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color.fromARGB(255, 2, 137, 96),
                    fontSize: 24.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Une application qui n\'a jamais existé pour gérer efficacement vos tâches journalières?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
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
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 430,
                ),
                Text(
                  'Toutes en un endroit.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color.fromARGB(255, 2, 137, 96),
                    fontSize: 24.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Avec Samay SAS, suivre, planifier, ... mes tâches avec beaucoup plus de facilité',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
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
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 480,
                ),
                Text(
                  'Comment faire?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color.fromARGB(255, 2, 137, 96),
                    fontSize: 24.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'S\'inscrire dés maintenant.\n C\'est par ici',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  '👇🏿👇🏿👇🏿',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color.fromARGB(255, 2, 137, 96),
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
