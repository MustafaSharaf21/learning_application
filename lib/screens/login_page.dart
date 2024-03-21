import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:learning_application/screens/register_page.dart';
import 'package:learning_application/models/header_painater.dart';
import 'package:learning_application/models/buildInputDecoration.dart';
import '../widgets/constants.dart';
import 'home_page.dart';

class LoginPage extends StatefulWidget {
  static String id = " LoginPage";
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>with SingleTickerProviderStateMixin{
  bool secureText = true;
  TextEditingController password = TextEditingController();
  TextEditingController email = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        decoration:const  BoxDecoration(
          gradient: LinearGradient(
              colors: [
                Colors.white,
                Color(0xFFE0F5EC),],//Color(0xFFBCF3E2)
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
                     keyboardType: TextInputType.emailAddress,
                     controller: email,
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
                        labelText:"password",
                        hintText: "Password",
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              secureText = !secureText;
                            });
                          },
                          icon: Icon(
                              secureText ? Icons.visibility_off : Icons.visibility/*,color: _colorAnimation.value,*/)),
                        prefixIcon:const  Icon(Icons.lock),
                        focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide:const   BorderSide(
                            color:Kcolor,
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
                        if(value.length<6){
                         return 'Password must be greater than six characters';
                        }
                        return null;
                      },
                    ),
                  ),
                const SizedBox(height: 50),
                GestureDetector(
                    onTap: (){
                      if (_formkey.currentState!.validate()){
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                              return HomePage();
                            }));
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
                       Text("Login with Facebook or Google",
                           style: TextStyle(color: Colors.grey,
                             fontSize: 15,
                             fontWeight:FontWeight.w700,
                             fontFamily: 'Cairo',)),
                     ],
                   ),
                const SizedBox(height: 10),
               Padding(
               padding: const EdgeInsets.only(left:100,right:100),
               child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                     children: [
                      Container(
                        width: 60,
                        height: 40,
                        decoration: BoxDecoration(
                      border: Border.all(color: Colors.blueGrey),
                      borderRadius: BorderRadius.circular(10),
                    ),
                        child:GestureDetector(
                        onTap: (){
                          print("object");
                               },
                        child: const Icon(FontAwesomeIcons.facebook,
                          color:Color(0xFF1877f2),
                                       ),
                                    ),
                               ),
                      Container(
                       width: 60,
                       height: 40,
                       decoration: BoxDecoration(
                          border: Border.all(color: Colors.blueGrey),
                          borderRadius: BorderRadius.circular(10),
                      ),
                       child:GestureDetector(
                        onTap: (){
                          print("object");
                                },
                        child: const Icon(FontAwesomeIcons.google,
                                        color:Color(0xFFdb4437),
                                      ),
                                    ),
                                  ),
                               ],
                            ),
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
            ),
           ],
         ),
       ),
    );
  }
}







