import 'package:flutter/material.dart';
import '../models/header_painater.dart';
import 'input_deco.daet.dart';

class RegisterPage extends StatefulWidget {
  static String id = " FormPage";
  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<RegisterPage> {

  late String name,email,phone;

  //TextController to read text entered in text field
  TextEditingController password = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();
  TextEditingController _dateController =TextEditingController();
  DateTime date=DateTime.now();
  bool secureText = true;

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xFFE2BDE7),
      body: Center(
        child: SingleChildScrollView(
          child: Form(
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
                          child:Text("Register",
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
                    decoration: buildInputDecoration(Icons.person,"Full Name"),
                    validator: ( value){
                      if(value!.isEmpty)
                      {
                        return 'Please Enter Name';
                      }
                      return null;
                    },
                    onSaved: ( value){
                      name =  name;
                    },
                  ),
                ),
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
                Padding(
                  padding: const EdgeInsets.only(bottom: 10,left:30,right:30),
                  child: TextFormField(
                    controller: confirmpassword,
                    obscureText: true,
                    keyboardType: TextInputType.text,
                    decoration:buildInputDecoration(Icons.lock,"Confirm Password"),
                    validator: ( value){
                      if(value!.isEmpty)
                      {
                        return 'Please re-enter password';
                      }
                      print(password.text);

                      print(confirmpassword.text);

                      if(password.text!=confirmpassword.text){
                        return "Password does not match";
                      }

                      return null;
                    },

                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10,left:30,right:30),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    decoration:buildInputDecoration(Icons.phone,"Phone No"),
                    validator: ( value){
                      if(value!.isEmpty)
                      {
                        return 'Please enter phone no ';
                      }
                      return null;
                    },
                    onSaved: ( value){
                      phone =  phone;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10,left:30,right:30),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: buildInputDecoration(Icons.home,"Address"),
                    validator: ( value){
                      if(value!.isEmpty)
                      {
                        return 'Please Enter Address';
                      }
                      return null;
                    },
                    onSaved: ( value){
                      name =  name;
                    },
                  ),
                ),
                Padding(
              padding: const EdgeInsets.only(bottom: 10,left:30,right:30),
                  child:Row(
                    mainAxisAlignment:MainAxisAlignment.center,
                    children: [
                    Column(
                      children: [
                        ElevatedButton.icon(
                              onPressed:(){
                                _selectDate();
                                      } ,
                                 icon:const  Icon(Icons.calendar_month,),
                                 label:const Text('Date of birth',
                                   style: TextStyle(
                                       color: Colors.grey,
                                       fontFamily:'Cairo'
                                         ),),
                               style:ElevatedButton.styleFrom(
                                 primary:const Color(0xFF9100BA),
                                 minimumSize:const  Size(150,50),
                                  ),
                               ),
                           Text('${date.day}/${date.month}/${date.year}',
                              style:const TextStyle(
                              fontFamily:'Cairo',
                              fontSize: 18,
                              ),
                            ),
                      ],

                    ),
                    const SizedBox(width: 20,),
                      Column(
                        children: [
                          ElevatedButton.icon(
                            onPressed:(){
                              _selectDate();
                            } ,
                            icon:const  Icon(Icons.calendar_month,),
                            label:const Text('Date of birth',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontFamily:'Cairo'
                              ),),
                            style:ElevatedButton.styleFrom(
                              primary:const Color(0xFF9100BA),
                              minimumSize:const  Size(150,50),
                            ),
                          ),
                          Text('${date.day}/${date.month}/${date.year}',
                            style:const TextStyle(
                              fontFamily:'Cairo',
                              fontSize: 18,
                            ),
                          ),
                        ],

                      ),

                  ],),


                ),
                const SizedBox(height:50),
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
                        child:const Center(child: Text("Register",
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
                    Text("I'm already a member",
                        style: TextStyle(color: Colors.grey,
                          fontSize: 15,
                          fontWeight:FontWeight.w700,
                          fontFamily: 'Cairo',)),
                  ],
                ),
                const  SizedBox(height: 50,),

              ],
            ),
          ),
        ),
      ),
    );
  }
  Future<void>_selectDate()async{
    DateTime? _picked=await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate:DateTime(2100) ,
    );
    if(_picked!=null)
    {setState((){
      date=_picked;
      /*_dateController.text=_picked.toString();*/

    });}
  }
  /*String formattedDate(_dateController){
    var formDate=DateTime.fromMicrosecondsSinceEpoch( _dateController.seconde*1000);
    return DateFormat('dd-MM-yyyy').format(formDate);
  }*/
}






