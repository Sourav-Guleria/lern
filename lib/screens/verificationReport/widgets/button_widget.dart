import 'package:alumni_verification_form/utils/colors.dart';
import 'package:alumni_verification_form/utils/size.dart';
import 'package:flutter/material.dart';

Widget buttonWidget(String text, BuildContext context) {
  w = MediaQuery.of(context).size.width;
  h = MediaQuery.of(context).size.height;
  return ElevatedButton(
    onPressed: () {},
    style: ElevatedButton.styleFrom(
        backgroundColor: CustomColors.buttonBlueColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
    child: Text(text,
        textAlign: TextAlign.center,
        style: TextStyle(
            color: CustomColors.buttonTextColor,
            fontSize: w! / 95,
            fontWeight: FontWeight.w300)),
  );
}
