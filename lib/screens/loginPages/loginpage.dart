import 'package:alumni_verification_form/screens/dashboard/dashboard_screen.dart';

import 'package:alumni_verification_form/screens/forget_page/forget_page.dart';
import 'package:alumni_verification_form/screens/loginPages/widgets/text_form.dart';
import 'package:alumni_verification_form/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/login/loginbloc.dart';
import '../../blocs/login/loginevent.dart';
import '../../blocs/login/loginstate.dart';
import '../../utils/string.dart';
import '../../utils/style.dart';
import 'DialogBox/signupDialog.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController Email = TextEditingController();
  final TextEditingController Pass = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool value = false;
  double? h;
  double? w;
  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(245, 245, 245, 1),
        title: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Image.asset("assets/images/Jio.png"),
              ),
              const SizedBox(
                width: 10,
              ),
              const Text(
                ConstantString.careers,
                style: TextStyle(color: Colors.black),
              )
            ],
          ),
        ),
      ),
      backgroundColor: const Color.fromRGBO(245, 245, 245, 1),
      body: Container(
        margin: const EdgeInsets.all(73),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 2,
              child: Center(
                child: RichText(
                  text: TextSpan(
                      text: "Welcome to \n",
                      style: TextStyle(
                          color: const Color.fromRGBO(
                            0,
                            0,
                            0,
                            1,
                          ),
                          fontSize: w! / 40,
                          fontWeight: FontWeight.w500),
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        TextSpan(
                            text: 'Jio Alumni Verification',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: w! / 30,
                                fontWeight: FontWeight.w900))
                      ]),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Center(
                child: Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    side: new BorderSide(
                        color: CustomColors.fieldBorderColor, width: 2.0),
                    borderRadius: BorderRadius.circular(0),
                  ),
                  margin: const EdgeInsets.symmetric(horizontal: 30),
                  child: Container(
                      width: MediaQuery.of(context).size.width / 2.5,
                      height: 501,
                      // height: MediaQuery.of(context).size.height / 2,
                      // padding: const EdgeInsets.all(30),
                      // margin: const EdgeInsets.symmetric(vertical: 60),
                      //
                      //  decoration: BoxDecoration(
                      //      color: Colors.white,
                      //
                      //      border: Border.all(
                      //        color: const Color.fromRGBO(184, 184, 184, 1).withOpacity(0.4),
                      //        width: 4
                      //      )),

                      child: Container(
                        margin: const EdgeInsets.all(30),
                        child: Form(
                            key: _formKey,
                            child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(30, 0, 30, 0),
                                    child: TextFormField(
                                      onChanged: (val) {
                                        BlocProvider.of<LoginBloc>(context).add(
                                            LoginTextChangedEvent(
                                                Email.text, Pass.text));
                                      },
                                      controller: Email,
                                      decoration: InputDecoration(
                                        hintText: "Login-ID",
                                        // suffixIcon: Icon(Icons.calendar_month_rounded,
                                        //     color: Color.fromRGBO(112, 112, 112, 1)),
                                        focusColor: const Color.fromRGBO(
                                            184, 184, 184, 1),
                                        border: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: Color.fromRGBO(
                                                    184, 184, 184, 1)),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                      ),
                                      keyboardType: TextInputType.emailAddress,
                                      // validator: (value) {
                                      //   if (value!.isEmpty) {
                                      //     return "field cannot be empty";
                                      //   } else if (!RegExp(
                                      //       r"^[a-zA-Z0-9]*[@][a-zA-Z]*[\.][a-zA-Z]*$")
                                      //       .hasMatch(value)) {
                                      //     return "Enter valid email address";
                                      //   } else {
                                      //     return null;
                                      //   }
                                      // },
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(30, 0, 30, 0),
                                    child: TextFormField(
                                      onChanged: (val) {
                                        BlocProvider.of<LoginBloc>(context).add(
                                            LoginTextChangedEvent(
                                                Email.text, Pass.text));
                                      },
                                      controller: Pass,
                                      decoration: InputDecoration(
                                        hintText: "Password",
                                        // suffixIcon: Icon(Icons.calendar_month_rounded,
                                        //     color: Color.fromRGBO(112, 112, 112, 1)),
                                        focusColor: const Color.fromRGBO(
                                            184, 184, 184, 1),
                                        border: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: Color.fromRGBO(
                                                    184, 184, 184, 1)),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                      ),
                                      obscureText: true,

                                      // validator: (value) {
                                      //   if (value!.isEmpty) {
                                      //     return "field cannot be empty";
                                      //   } else if (value.length <= 8) {
                                      //     return 'password must be 8 digit';
                                      //   } else if (!RegExp(
                                      //       r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$")
                                      //       .hasMatch(value)) {
                                      //     return ("Enter valid pass");
                                      //   } else {
                                      //     return null;
                                      //   }
                                      // },
                                    ),
                                  ),
                                  BlocBuilder<LoginBloc, LoginState>(
                                    builder: (context, state) {
                                      if (state is LoginErrorState) {
                                        return Text(state.errormessage,
                                            style: const TextStyle(
                                                color: Colors.red,
                                                fontSize: 12));
                                      } else {
                                        return Container();
                                      }
                                    },
                                  ),
                                  BlocBuilder<LoginBloc, LoginState>(
                                      builder: (context, state) {
                                    return SizedBox(
                                        width: 340,
                                        height: 35,
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  CustomColors.buttonBlueColor),
                                          onPressed: () {
                                            // if (_formKey.currentState!.validate()) {
                                            //  Navigator.push(context, MaterialPageRoute(builder: (context)=>Dasboard()));
                                            // }
                                            if (state is LoginValidState) {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          Dasboard()));
                                            }
                                          },
                                          child: const Text(
                                            "Login",
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.white),
                                          ),
                                        ));
                                  }),
                                   Padding(
                                    padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                                    child: InkWell(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      ForgetPasswordPage()));
                                        },
                                        child: Text(
                                      "Forgot Your Password",
                                      style: TextStyle(
                                          color: Colors.red, fontSize: 12),
                                    )),
                                  ),
                                  const Divider(
                                    color: CustomColors.fieldBorderColor,
                                    thickness: 1,
                                  ),
                                  Center(
                                      // child: BlocBuilder<LoginBloc, LoginState>(
                                      //   builder: (context, state) {
                                      //     return
                                      child: SizedBox(
                                    // decoration: BoxDecoration(
                                    //   borderRadius: BorderRadius.all(20),
                                    //   border: Border.all(
                                    //     width: 3,
                                    //     color: Colors.green,
                                    //     style: BorderStyle.solid,
                                    //   ),
                                    // ),
                                    width: 240,
                                    height: 35,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        showDialog(
                                            context: context,
                                            builder: (BuildContext) {
                                              return const AlertDialog(
                                                content: ShowDialogLogin(),
                                              );
                                            });
                                      },
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: const Color.fromRGBO(
                                              83, 150, 60, 1)),
                                      child: const Text('Create a new account'),
                                    ),
                                  )
                                      // },
                                      // ),
                                      ),
                                ])),
                      )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
