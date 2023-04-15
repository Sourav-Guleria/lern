import 'package:flutter/material.dart';

Widget richText(String text) {
  return RichText(
    text: TextSpan(
        text: text,
        style: const TextStyle(
            color: Color.fromRGBO(
              0,
              0,
              0,
              1,
            ),
            fontSize: 19,
            fontWeight: FontWeight.w500),
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          const TextSpan(
              text: ' *',
              style: TextStyle(
                  color: Colors.red, fontSize: 19, fontWeight: FontWeight.w500))
        ]),
  );
}
