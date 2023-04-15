

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget textFormEmail(
String hint ,
TextEditingController textEditingController
){
 return TextFormField(
  keyboardType: TextInputType.emailAddress,
  validator: ValidateEmail,
  controller: textEditingController,
  decoration: InputDecoration(
   focusColor: Color.fromRGBO(184, 184, 184, 1),
   border: OutlineInputBorder(
       borderSide: const BorderSide(
           color:
           Color.fromRGBO(184, 184, 184, 1)),
       borderRadius: BorderRadius.circular(10)),
   hintText: hint,
   hintStyle: const TextStyle(
       color: Color.fromRGBO(184, 184, 184, 1),
       fontWeight: FontWeight.normal,
       fontSize: 15),
   focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: const BorderSide(
        color: Color.fromRGBO(184, 184, 184, 1)),
   ),
  ),
 );
}
String? ValidateEmail(value) {
 if (value.isEmpty){
  return "Required";
 }else if(!RegExp(r"^[a-zA-Z\d]*[@][a-z]*[\.][a-z]*$").hasMatch(value)){
  return "Invalid email Address";
 }else{
  return null;
 }
}
