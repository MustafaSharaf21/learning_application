import 'package:flutter/material.dart';
import 'package:learning_application/screens/home_page.dart';
import 'package:learning_application/screens/login_page.dart';
import 'package:learning_application/screens/register_page.dart';
import 'package:learning_application/screens/register_page_2.dart';
import 'package:learning_application/screens/splash_page.dart';



void main() {
  runApp(const LearningApplication());
}

class LearningApplication extends StatefulWidget {
  const LearningApplication({super.key});
  @override
  State<LearningApplication> createState() => _LearningApplicationState();
}

class _LearningApplicationState extends State<LearningApplication> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor:const  Color(0xFF399679
            ),
        ),
      ),
      debugShowCheckedModeBanner: false,
        routes: {
         RegisterPage.id: (context) => RegisterPage(),
         RegisterPage2.id: (context) => RegisterPage2(),
         LoginPage.id: (context) => LoginPage(),
         HomePage.id:(context)=> HomePage(),
         SplashPage.id:(context)=> SplashPage(),
        },
      initialRoute:SplashPage.id,


    );
  }
}

