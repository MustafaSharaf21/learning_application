import 'package:flutter/material.dart';
import 'package:learning_application/screens/register_page.dart';

import '../models/header_painater.dart';
import 'input_deco.daet.dart';

class FormPage extends StatefulWidget {
  static String id = " FormPage";
  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {

  late String name,email,phone;
  bool secureText = true;
  //TextController to read text entered in text field
  TextEditingController password = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xFFE2BDE7),
      body: Center(
        child: ListView(

          children: [Form(
            key: _formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
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
                      bottom: -120,
                      child:Row(
                        children: [
                          Container(
                            width: 150,
                            height: 150,
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
               const  SizedBox(height: 150,),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10,left:30,right:30),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    decoration:buildInputDecoration(Icons.email,"Email"),
                    validator: ( value){
                      if(value!.isEmpty)
                      {
                        return 'Please a Enter';
                      }
                      if(!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)){
                        return 'Please a valid Email';
                      }
                      return null;
                    },
                    onSaved: (value){
                      email = email;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10,left:30,right:30),
                  child: TextFormField(
                    obscureText: secureText,
                    controller: password,
                    keyboardType: TextInputType.text,
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
                      prefixIcon: Icon(Icons.lock),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(
                            color:Color(0xFF9100BA),
                            width: 1
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(
                          color: Colors.blue,
                          width: 1,

                        ),
                      ),
                      enabledBorder:OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(
                          color: Colors.blue,
                          width: 1,
                        ),
                      ),
                    ),
                    validator: ( value){
                      if(value!.isEmpty)
                      {
                        return 'Please a Enter Password';
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

                 Navigator.push(context,MaterialPageRoute(builder: (context){
                        return RegisterPage();
                      }));

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
                const SizedBox(height: 10),

              ],
            ),
          )],
        ),
      ),
    );
  }
}