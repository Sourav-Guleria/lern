import 'package:alumni_verification_form/utils/size.dart';
import 'package:flutter/material.dart';

Widget exhaustedRequestDialogContent(
    String? title, String? subtitle, BuildContext context) {
  h = MediaQuery.of(context).size.height;
  w = MediaQuery.of(context).size.height;
  return ListTile(
    title: Text(title!,
        textAlign: TextAlign.center,
        style: TextStyle(
            color: Color.fromRGBO(
              0,
              0,
              0,
              1,
            ),
            fontSize: w! / 60,
            fontWeight: FontWeight.w700)),
    subtitle: Text(subtitle!,
        textAlign: TextAlign.center,
        style: TextStyle(
            color: Color.fromRGBO(
              0,
              0,
              0,
              1,
            ),
            fontSize: w! / 60,
            fontWeight: FontWeight.w700)),
  );
}
