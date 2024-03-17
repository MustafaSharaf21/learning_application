import 'package:flutter/material.dart';

InputDecoration buildInputDecoration(IconData icons,String hinttext) {
  return InputDecoration(
    hintText: hinttext,
    prefixIcon: Icon(icons),
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
        color: Colors.blue,
        width: 1,

      ),
    ),
    enabledBorder:OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide:const BorderSide(
        color: Colors.blue,
        width: 1,
      ),
    ),
  );
}




