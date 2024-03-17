import 'package:flutter/material.dart';
import 'package:learning_application/screens/login_page.dart';
import 'package:learning_application/screens/login_screen.dart';



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
    return MediaQuery(
        data:MediaQueryData.fromView(WidgetsBinding.instance.window),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
    routes: {
           /* RegisterPage.id: (context) => RegisterPage(),*/
            /* LoginPage.id: (context) => LoginPage(),*/
            FormPage.id:(context)=>FormPage(),
    },
          initialRoute:  FormPage.id,


        ),);
  }
}

