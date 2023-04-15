import 'package:alumni_verification_form/screens/loginPages/DialogBox/otpDialog.dart';
import 'package:alumni_verification_form/utils/colors.dart';
import 'package:flutter/material.dart';

class ShowDialogLogin extends StatefulWidget {
  const ShowDialogLogin({Key? key}) : super(key: key);

  @override
  State<ShowDialogLogin> createState() => _ShowDialogLoginState();
}

class _ShowDialogLoginState extends State<ShowDialogLogin> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController agencyNameController = TextEditingController();
  final TextEditingController confirmPassController = TextEditingController();
  final TextEditingController mobileNoController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  late final String? validatepass;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(30),
      width: MediaQuery.of(context).size.width / 2,
      height: 501,
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "New User Registration",
              style: TextStyle(fontSize: 21, fontWeight: FontWeight.w700),
              textAlign: TextAlign.left,
            ),
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 20, 0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: "Agency Name* ",
                        // suffixIcon: Icon(Icons.calendar_month_rounded,
                        //     color: Color.fromRGBO(112, 112, 112, 1)),
                        focusColor: const Color.fromRGBO(184, 184, 184, 1),
                        border: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Color.fromRGBO(184, 184, 184, 1)),
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      controller: agencyNameController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "field cannot be empty";
                        } else if (!RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                          return "Please Enter Alphabet";
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Mobile Number*",
                      // suffixIcon: Icon(Icons.calendar_month_rounded,
                      //     color: Color.fromRGBO(112, 112, 112, 1)),
                      focusColor: const Color.fromRGBO(184, 184, 184, 1),
                      border: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color.fromRGBO(184, 184, 184, 1)),
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    controller: mobileNoController,
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "field cannot be empty";
                      } else if (!RegExp(r"[0-9]$").hasMatch(value)) {
                        return "Enter number";
                      } else if (value.length != 10) {
                        return "number should be 10 digit";
                      } else {
                        return null;
                      }
                    },
                  ),
                )
              ],
            ),
            Container(
              padding: const EdgeInsets.only(top: 20),
              child: TextFormField(
                // onChanged: (val){
                //   BlocProvider.of<LoginBloc>(context).add(LoginTextChangedEvent(Email.text, Pass.text));
                // },
                controller: emailController,
                decoration: InputDecoration(
                  hintText: "Email-ID",
                  // suffixIcon: Icon(Icons.calendar_month_rounded,
                  //     color: Color.fromRGBO(112, 112, 112, 1)),
                  focusColor: const Color.fromRGBO(184, 184, 184, 1),
                  border: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Color.fromRGBO(184, 184, 184, 1)),
                      borderRadius: BorderRadius.circular(10)),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "field cannot be empty";
                  } else if (!RegExp(r"^[a-zA-Z0-9]*[@][a-zA-Z]*[\.][a-zA-Z]*$")
                      .hasMatch(value)) {
                    return "Enter valid email address";
                  } else {
                    return null;
                  }
                },
              ),
            ),
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 20, 20, 0),
                    child: TextFormField(
                      // onChanged: (val){
                      //   BlocProvider.of<LoginBloc>(context).add(LoginTextChangedEvent(Email.text, Pass.text));
                      // },
                      controller: passwordController,

                      decoration: InputDecoration(
                        hintText: "Password",
                        // suffixIcon: Icon(Icons.calendar_month_rounded,
                        //     color: Color.fromRGBO(112, 112, 112, 1)),
                        focusColor: const Color.fromRGBO(184, 184, 184, 1),
                        border: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Color.fromRGBO(184, 184, 184, 1)),
                            borderRadius: BorderRadius.circular(10)),
                      ),

                      obscureText: true,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "field cannot be empty";
                        } else if (value.length <= 8) {
                          return 'password must be 8 digit';
                        } else if (!RegExp(
                                r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$")
                            .hasMatch(value)) {
                          return ("Enter valid pass");
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: TextFormField(
                      // onChanged: (val){
                      //   BlocProvider.of<LoginBloc>(context).add(LoginTextChangedEvent(Email.text, Pass.text));
                      // },
                      decoration: InputDecoration(
                        hintText: "Confirm Password",
                        // suffixIcon: Icon(Icons.calendar_month_rounded,
                        //     color: Color.fromRGBO(112, 112, 112, 1)),
                        focusColor: const Color.fromRGBO(184, 184, 184, 1),
                        border: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Color.fromRGBO(184, 184, 184, 1)),
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      controller: confirmPassController,
                      obscureText: true,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "field cannot be empty";
                        } else if (value.length <= 8) {
                          return 'password must be 8 digit';
                          // ignore: unrelated_type_equality_checks
                        } else if (value !=
                            passwordController.text.toString()) {
                          return ("Password does not match");
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                )
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(top: 10),
              child: Text(
                "More info",
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: CustomColors.redColor),
                textAlign: TextAlign.left,
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
                child: SizedBox(
                    width: 414,
                    height: 43,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: CustomColors.buttonBlueColor),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          showDialog(
                              context: context,
                              builder: (BuildContext) {
                                return const AlertDialog(
                                  content: ShowDialogOTP(),
                                );
                              });
                        }
                      },
                      child: const Text(
                        "Confirm",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
