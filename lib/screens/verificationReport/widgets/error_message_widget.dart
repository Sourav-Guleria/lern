import 'package:flutter/material.dart';

Widget errorMessageWidget(String? title, String? subtitle) {
  return ListTile(
    title: Text(title!),
    subtitle: Text(subtitle!),
  );
}
