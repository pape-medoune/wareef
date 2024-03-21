import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wareef/Pages/Detail.dart';
import 'package:wareef/Pages/HomePage.dart';
import 'package:wareef/Pages/IntroPage.dart';
import 'package:wareef/Pages/addTask.dart';
import 'package:wareef/Pages/editTask.dart';
import 'package:wareef/auth/Register.dart';
import 'package:wareef/auth/login.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo', 
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0x00020206),
      ),
      home: Register(),
      routes: {
        "/home": (_) => HomePage(),
        "/login": (_) => Login(),
        "/register": (_) => Register(),
      },
    );
  }
}

class AuthenticationWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else {
          if (snapshot.hasData) {
            // Utilisateur connecté
            return HomePage();
          } else {
            // Utilisateur non connecté
            return Register();
          }
        }
      },
    );
  }
}