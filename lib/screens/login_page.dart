import 'package:flutter/material.dart';
import 'package:learning_application/screens/register_page.dart';
import 'package:learning_application/models/header_painater.dart';
import 'package:learning_application/models/buildInputDecoration.dart';

import '../widgets/constants.dart';

class LoginPage extends StatefulWidget {
  static String id = " LoginPage";
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool secureText = true;
  TextEditingController password = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        decoration:const  BoxDecoration(
        gradient: LinearGradient(
        colors: [
        Colors.white,
        Color(0xFFE0B5EA),],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft
                    ),
                  ),
        child: ListView(
           children: [ Form(
               key: _formkey,
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                 FullHeaderPainter(HeaderText:"Login"),
                 const  SizedBox(height: 150,),
                 Padding(
                  padding: const EdgeInsets.only(bottom: 10,left:30,right:30),
                  child: TextFormField(
                   keyboardType: TextInputType.text,
                   decoration:buildInputDecoration(Icons.email,"Email"),
                   validator: ( value){
                   if(value!.isEmpty)
                   {
                    return 'Enter an email';
                   }
                   if(!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)){
                    return 'Enter a valid Email';
                  }
                  return null;
                },
              ),
            ),
                 Padding(
                  padding: const EdgeInsets.only(bottom: 10,left:30,right:30),
                  child: TextFormField(
                    obscureText: secureText,
                    controller: password,
                    keyboardType: TextInputType.visiblePassword,
                    decoration:InputDecoration(
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              secureText = !secureText;
                            });
                          },
                          icon: Icon(
                              secureText ? Icons.visibility_off : Icons.visibility/*,color: _colorAnimation.value,*/)),
                      hintText: "Password",
                      prefixIcon:const Icon(Icons.lock),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide:const  BorderSide(
                            color:Color(0xFF9100BA),
                            width: 1
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide:const  BorderSide(
                          color: Colors.grey,
                          width: 1,
                        ),
                      ),
                      enabledBorder:OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide:const  BorderSide(
                          color: Colors.grey,
                          width: 1,
                        ),
                      ),
                    ),
                    validator: ( value){
                      if(value!.isEmpty)
                      {
                        return 'Enter a Password';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 50),
                GestureDetector(
                    onTap: (){
                      if (_formkey.currentState!.validate()){
                        return;
                      }
                    },
                    child:Padding(padding:const EdgeInsets.symmetric(vertical:0.0 ,horizontal:80.0 ) ,
                      child:Container(
                        height: 40,
                        width: 150,
                        decoration: const BoxDecoration(
                            color:  Kcolor,
                            borderRadius: BorderRadius.all(Radius.circular(30),)
                        ),
                        child:const Center(child: Text("Login",
                          style: TextStyle(color: Colors.white,
                            fontSize:25,
                            fontWeight:FontWeight.w500,
                            fontFamily: 'Cairo',
                          ),), ),
                      ),)
                ),
                const SizedBox(height: 10),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("If you don't have an account?",
                        style: TextStyle(color: Colors.grey,
                          fontSize: 15,
                          fontWeight:FontWeight.w700,
                          fontFamily: 'Cairo',)),
                  ],
                ),
                const SizedBox(height: 10),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context,MaterialPageRoute(builder: (context){
                      return RegisterPage();
                    }));

                  },
                  child:const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Register",
                        style: TextStyle(color: Kcolor,fontSize: 18,
                          fontWeight:FontWeight.w500,
                          fontFamily: 'Cairo',), ),
                    ],

                  ),

                ),
              ],
            ),
          )],
        ),
      ),

    );
  }
}








/*

import 'package:flutter/material.dart';
import '../models/animated_text_field.dart';
import '../models/header_painater.dart';


class LoginPage extends StatefulWidget {
  static String id = "LoginPage";

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {

    var size=MediaQuery.of(context).size;
    return Scaffold(

      backgroundColor: Color(0xFFE2BDE7),
      body:Form(
          key: formKey,
          child:ListView(
          children: [
            Container(
              height: 750,
              child: Column(
                children: [
                  Stack(
                       alignment: AlignmentDirectional.center,
                       clipBehavior: Clip.none,
                       children: [
                         CustomPaint(
                             painter: HeaderPainter(),
                             child:  SizedBox(
                                width:size.width ,
                                height: size.height/4,
                                child:const Center(
                                   child:Text("LOGIN",
                                   style: TextStyle(
                                   fontSize:60,
                                   color:Colors.white,
                                   fontFamily: 'Nabla',
                                                   ),
                                             ),
                                           ),
                                        ),
                                 ),
                         Positioned(
                           bottom: -180,
                           child:Row(
                           children: [
                               Container(
                                  width: 200,
                                  height: 200,
                                  clipBehavior: Clip.antiAlias,
                                  decoration:  BoxDecoration(
                                          borderRadius: BorderRadius.circular(1000)),
                                          child: Image.asset('assets/images/login.png',
                                          fit: BoxFit.cover,
                                                           ),
                                                         ),
                                                      ],
                                                   ),
                                                ),
                           ],),
                  const SizedBox(height: 200),
                  AnimatedTextField(
                    primaryColor:Colors.white,
                    beginColor:Colors.grey,
                    endColor: Colors.white,
                    label:"Username",
                    icon:Icons.email,
                    duration:const Duration(microseconds: 300),
                  ),
                  AnimatedTextFieldPassword(
                    primaryColor: const Color(0xFFACE5EE),
                    beginColor:Colors.grey,
                    endColor:const Color(0xFFACE5EE),
                    label:"Password",
                    icon:Icons.lock,
                    duration:const Duration(microseconds: 300),

                  ),
                  const SizedBox(height: 45,),
                  GestureDetector(
                      onTap: (){
                       if (formKey.currentState!.validate()){
                          return;
                        }else{
                          print("object");
                        }

                      },
                      child:Padding(padding:const EdgeInsets.symmetric(vertical:0.0 ,horizontal:80.0 ) ,
                        child:Container(
                          height: 40,
                          width: 150,
                          decoration: const BoxDecoration(
                              color: Color(0xFF9100BA),
                              borderRadius: BorderRadius.all(Radius.circular(30),)
                          ),
                          child:const Center(child: Text("Login",
                            style: TextStyle(color: Colors.white,
                              fontSize:25,
                              fontWeight:FontWeight.w500,
                              fontFamily: 'Cairo',
                            ),), ),
                        ),)
                  ),
                  const SizedBox(height: 10),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("If you don't have an account?",
                          style: TextStyle(color: Colors.grey,
                              fontSize: 15,
                              fontWeight:FontWeight.w700,
                             fontFamily: 'Cairo',)),
                    ],
                  ),
                  const SizedBox(height: 10),
                  GestureDetector(
                    onTap: (){
                      */
/*Navigator.push(context,MaterialPageRoute(builder: (context){
                        return RegisterPage();
                      }));*//*

                    },

                    child:const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Register",
                          style: TextStyle(color: Color(0xFF9100BA),fontSize: 18,
                              fontWeight:FontWeight.w500,
                            fontFamily: 'Cairo',), ),
                      ],

                    ),

                  ),
                         ],
                        ),
                     ),
                   ],
      ),
      ),
    );
  }
}






*/
