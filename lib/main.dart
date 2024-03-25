import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wareef/Pages/OnBoardingIntro.dart'; 
import 'package:wareef/Pages/tasks_list.dart';
import 'package:wareef/auth/login.dart'; 
import 'package:wareef/core.dart';
import 'package:wareef/services/task_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<TaskService>(
          create: (context) => TaskService(),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: const Color(0x00020206),
        ),
        home: const IntroPage(),
        routes: {
          "/home": (_) => const HomePage(),
          "/login": (_) => const Login(),
          "/register": (_) => const Register(),
          "/onboarding": (_) => const OnBoardingIntro(),
        },
      ),
    );
  }
}
