import 'package:alumni_verification_form/screens/loginPages/loginpage.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
class LoginWidget extends StatefulWidget {
  const LoginWidget({Key? key}) : super(key: key);

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      desktop: (BuildContext context) => LoginPage(),
      mobile: (BuildContext context)=> Container(),
    );
  }
}
