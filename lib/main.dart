import 'package:flutter/material.dart';
import 'package:learning_application/screens/login_page.dart';
import 'package:learning_application/screens/register_page.dart';
import 'package:learning_application/screens/register_page_2.dart';
import 'package:learning_application/widgets/constants.dart';


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
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch:Colors.purple),
        routes: {
         RegisterPage.id: (context) => RegisterPage(),
         RegisterPage2.id: (context) => RegisterPage2(),
         LoginPage.id: (context) => LoginPage(),

        },
      initialRoute:  LoginPage.id,


    );
  }
}

