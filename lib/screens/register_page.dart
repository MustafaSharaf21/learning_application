import 'package:flutter/material.dart';
import 'package:learning_application/screens/register_page_2.dart';
import '../models/header_painater.dart';
import 'package:learning_application/models/buildInputDecoration.dart';

class RegisterPage extends StatefulWidget {
  static String id = "RegisterPage";

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController password = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();
  bool secureText = true,secureText2 = true;
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
        child:ListView(
          children: [Form(
          key: _formkey,
          child: Column(
            children:[
              FullHeaderPainter(HeaderText: "Register"),
              const SizedBox(height: 200,),
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 10,
                  left: 30,
                  right: 30,
                ),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: buildInputDecoration(Icons.person, "Full Name"),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter an name';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10, left: 30, right: 30),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: buildInputDecoration(Icons.email, "Email"),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter an email';
                    }
                    if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                        .hasMatch(value)) {
                      return 'Enter a valid Email';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10, left: 30, right: 30),
                child: TextFormField(
                  obscureText: secureText,
                  controller: password,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            secureText = !secureText;
                          });
                        },
                        icon: Icon(secureText
                            ? Icons.visibility_off
                            : Icons
                            .visibility /*,color: _colorAnimation.value,*/)),
                    hintText: "Password",
                    prefixIcon: const Icon(Icons.lock),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide:
                      const BorderSide(color: Color(0xFF9100BA), width: 1),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(
                        color: Colors.grey,
                        width: 1,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(
                        color: Colors.grey,
                        width: 1,
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter a Password';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10, left: 30, right: 30),
                child: TextFormField(
                  obscureText: secureText2,
                  controller: confirmpassword,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            secureText2 = !secureText2;
                          });
                        },
                        icon: Icon(secureText2
                            ? Icons.visibility_off
                            : Icons
                            .visibility /*,color: _colorAnimation.value,*/)),
                    hintText: "confirmpassword",
                    prefixIcon: const Icon(Icons.lock),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide:
                      const BorderSide(color: Color(0xFF9100BA), width: 1),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(
                        color: Colors.grey,
                        width: 1,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(
                        color: Colors.grey,
                        width: 1,
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Re-enter password';
                    }
                    print(password.text);

                    print(confirmpassword.text);

                    if (password.text != confirmpassword.text) {
                      return "Enter the password correctly";
                    }

                    return null;
                  },
                ),
              ),
              const SizedBox(height: 20),
              Align(
                child: IconButton(
                  color: Colors.red,
                  style: IconButton.styleFrom(
                    shape: const OvalBorder(),
                    backgroundColor: const Color(0xFF9100BA),
                  ),
                  onPressed: () {
                    if (_formkey.currentState!.validate()) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                            return RegisterPage2();
                          }));
                    }
                  },
                  icon: const Icon(
                    Icons.east_sharp,
                    size: 25,
                    color: Colors.grey,
                  ),
                ),
              ),
              const SizedBox(height: 30),
                     ],
                 ),
               ),
             ],
          ),
        ),
    );
  }
}
