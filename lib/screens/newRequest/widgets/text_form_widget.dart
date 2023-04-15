import 'package:flutter/material.dart';

String? validateEmployeCode(String? value) {
  if (value!.length != 8) {
    return 'Emplloye code must be of 8 digit';
  }

  return null;
}

Widget textForm(
  String hintText,
  TextEditingController textEditingController,
) {
  return TextFormField(
    validator: validateEmployeCode,
    controller: textEditingController,
    cursorColor: Color.fromRGBO(184, 184, 184, 1),
    decoration: InputDecoration(
      // suffixIcon: Icon(Icons.calendar_month_rounded,
      //     color: Color.fromRGBO(112, 112, 112, 1)),
      focusColor: Color.fromRGBO(184, 184, 184, 1),
      border: OutlineInputBorder(
          borderSide: const BorderSide(color: Color.fromRGBO(184, 184, 184, 1)),
          borderRadius: BorderRadius.circular(10)),
      hintText: hintText,
      hintStyle: const TextStyle(
          color: Color.fromRGBO(184, 184, 184, 1),
          fontWeight: FontWeight.normal,
          fontSize: 15),
      // errorText: emCodeValidate
      //     ? employeeCodeController.text.isEmpty
      //         ? 'Value Can\'t Be Empty'
      //         : employeeCodeController.text.length < 8
      //             ? 'Employe code atleast 8 numbers'
      //             : null
      //     : null,
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Color.fromRGBO(184, 184, 184, 1)),
      ),
    ),
  );
}
