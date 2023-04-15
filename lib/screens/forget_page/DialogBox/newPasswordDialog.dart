import 'package:alumni_verification_form/screens/NewRequest/widgets/text_form_widget.dart';
import 'package:alumni_verification_form/utils/size.dart';
import 'package:flutter/material.dart';

import '../../../utils/string.dart';

class NewPasswordDialog extends StatefulWidget {
  TextEditingController resetPassword;
  TextEditingController comfirmPassword;
  NewPasswordDialog(
      {required this.resetPassword, required this.comfirmPassword, Key? key})
      : super(key: key);

  @override
  State<NewPasswordDialog> createState() => _NewPasswordDialogState();
}

class _NewPasswordDialogState extends State<NewPasswordDialog> {
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return SizedBox(
      height: MediaQuery.of(context).size.height / 1.7,
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Reset Password',
              style: TextStyle(
                  fontSize: w! / 85,
                  color: Color.fromRGBO(24, 22, 22, 1)),
            ),
            SizedBox(
              height: 20,
            ),
            textForm('Enter New Password', widget.resetPassword),
            SizedBox(
              height: 35,
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: "Confirm Password",
                hintStyle: const TextStyle(
                    color: Color.fromRGBO(184, 184, 184, 1),
                    fontWeight: FontWeight.normal,
                    fontSize: 15),
                // suffixIcon: Icon(Icons.calendar_month_rounded,
                //     color: Color.fromRGBO(112, 112, 112, 1)),
                focusColor: const Color.fromRGBO(184, 184, 184, 1),
                border: OutlineInputBorder(
                    borderSide: const BorderSide(
                        color: Color.fromRGBO(184, 184, 184, 1)),
                    borderRadius: BorderRadius.circular(10)),
              ),
              controller: widget.comfirmPassword,
              validator: (value) {
                if (value!.isEmpty) {
                  return "field cannot be empty";
                } else if (value != widget.resetPassword.text) {
                  return "Password Not Match";
                }
              },
            ),
            SizedBox(
              height: 57,
            ),
            Center(
              child: Container(
                  width: w! / 10,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            Color.fromRGBO(3, 53, 243, 1),
                      ),
                      onPressed: () {
                        if (formKey.currentState!.validate()) {}
                      },
                      child: Text(ConstantString.submit))),
            )
          ],
        ),
      ),
    );
  }
}
