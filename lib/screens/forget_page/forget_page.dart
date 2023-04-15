import 'dart:async';

import 'package:alumni_verification_form/screens/NewRequest/widgets/rich_text_widget.dart';
import 'package:alumni_verification_form/screens/NewRequest/widgets/text_form_widget.dart';
import 'package:alumni_verification_form/screens/forget_page/DialogBox/newPasswordDialog.dart';
import 'package:alumni_verification_form/screens/forget_page/widgets/text_form_email.dart';
import 'package:alumni_verification_form/utils/string.dart';
import 'package:flutter/material.dart';

import '../../custom_widgets/custom_forgetpage_appbar.dart';
import '../../utils/size.dart';
import '../../utils/style.dart';
import '../loginPages/widgets/otpbox.dart';

class ForgetPasswordPage extends StatefulWidget {
  const ForgetPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgetPasswordPage> createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController _fieldOne = TextEditingController();
  TextEditingController _fieldTwo = TextEditingController();
  TextEditingController _fieldThree = TextEditingController();
  TextEditingController _fieldFour = TextEditingController();
  TextEditingController _resetPassword = TextEditingController();
  TextEditingController _confirmPassword = TextEditingController();

  bool newPassword = false;
  String? otp;
  bool isChecked = false;
  bool isOtpSend = false;
  bool showOtp = true;
  int start = 130;
  bool wait = false;
  Timer? countdownTimer;
  Duration myDuration = Duration(minutes: 2,seconds: 10);

  void setCountDown() {
    final reduceSecondsBy = 1;
    setState(() {
      final seconds = myDuration.inSeconds - reduceSecondsBy;
      if (seconds < 0) {
        countdownTimer!.cancel();
      } else {
        myDuration = Duration(seconds: seconds);
      }
    });
  }

  void startTimer1() {
    countdownTimer =
        Timer.periodic(Duration(seconds: 1), (_) => setCountDown());
  }

  void startTimer(){
     const onsec = Duration(seconds: 1);
     Timer _timer = Timer.periodic(onsec, (timer) {
       if (start == 0){
         setState(() {
           timer.cancel();
           wait=true;
         });
       }else{
         setState(() {
           start--;
         });
       }
     });
  }

  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;

    String strDigits(int n) => n.toString().padLeft(2, '0');
    final hours = strDigits(myDuration.inHours.remainder(24));
    final minutes = strDigits(myDuration.inMinutes.remainder(60));
    final seconds = strDigits(myDuration.inSeconds.remainder(60));

    return Scaffold(
      backgroundColor: Color.fromRGBO(245, 245, 245, 1),
      appBar: ForgetPageAppBar(),
      body: Container(
        margin: EdgeInsets.all(73),
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
                          color: Color.fromRGBO(
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
                child: Form(
                  key: formkey,
                  child: Card(
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                            color: Color.fromRGBO(184, 184, 184, 1),
                            width: 2.0),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Container(
                        margin: EdgeInsets.all(30),
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height / 1.7,
                          child:

                          isOtpSend ?
                              NewPasswordDialog(resetPassword: _resetPassword,comfirmPassword: _confirmPassword,)
                              :
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // const SizedBox(
                              //   height: 133,
                              // ),
                               Text(
                                ConstantString.registerEmail,
                                style: TextStyle(
                                    fontSize: w! /85,
                                    color: Color.fromRGBO(
                                        4, 22, 22, 1),
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 17,
                              ),
                              textFormEmail("verification@agency.com", email),
                              // TextFormField(
                              //   keyboardType: TextInputType.emailAddress,
                              //   validator: validateEmail,
                              //   controller: email,
                              //   decoration: InputDecoration(
                              //     // suffixIcon: Icon(Icons.calendar_month_rounded,
                              //     //     color: Color.fromRGBO(112, 112, 112, 1)),
                              //     focusColor: Color.fromRGBO(184, 184, 184, 1),
                              //     border: OutlineInputBorder(
                              //         borderSide: const BorderSide(
                              //             color:
                              //                 Color.fromRGBO(184, 184, 184, 1)),
                              //         borderRadius: BorderRadius.circular(10)),
                              //     hintText: "verification@agency.com",
                              //     hintStyle: const TextStyle(
                              //         color: Color.fromRGBO(184, 184, 184, 1),
                              //         fontWeight: FontWeight.normal,
                              //         fontSize: 15),
                              //     focusedBorder: OutlineInputBorder(
                              //       borderRadius: BorderRadius.circular(10),
                              //       borderSide: const BorderSide(
                              //           color: Color.fromRGBO(184, 184, 184, 1)),
                              //     ),
                              //   ),
                              // ),
                              SizedBox(height: 20,),
                              isChecked
                                  ? Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const SizedBox(
                                          height: 27,
                                        ),
                                        Text(
                                            "Enter OTP sent on Email",
                                            style: TextStyle(
                                                fontSize: w! /85,
                                                color: Color.fromRGBO(
                                                    4, 22, 22, 1),
                                                fontWeight: FontWeight.bold)),
                                        SizedBox(
                                          height: 50,
                                        ),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Padding(padding: EdgeInsets.only(right: 39),
                                              child: OtpInput(_fieldOne,true),
                                              ),
                                            ),
                                            Expanded(
                                              child: Padding(padding: EdgeInsets.only(right: 39),
                                                child: OtpInput(_fieldTwo,false),
                                              ),
                                            ),
                                            Expanded(
                                              child: Padding(padding: EdgeInsets.only(right: 39),
                                                child: OtpInput(_fieldThree,false),
                                              ),
                                            ),
                                            Expanded(
                                              child: Padding(padding: EdgeInsets.only(right: 39),
                                                child: OtpInput(_fieldFour,false),
                                              ),
                                            ),

                                          ],
                                        ),
                                        SizedBox(height: 17,),
                                        Row(
                                          children: [
                                            Expanded(child: Text('Expires in $minutes:$seconds',style: TextStyle(color: Color.fromRGBO(53, 53, 243, 1),),)),
                                            //Expanded(child: Text("Expires in 02:$start",style: TextStyle(color: Color.fromRGBO(53, 53, 243, 1),),)),
                                            SizedBox(width: 220,),
                                            Expanded(child: Text("Resend code",style: TextStyle(color: Color.fromRGBO(53, 53, 243, 1),),)),

                                          ],
                                        ),
                                        SizedBox(
                                          height: 60,
                                        ),
                                        Center(
                                          child: Container(
                                              width: w!/10,
                                              child: ElevatedButton(
                                                  style: ElevatedButton.styleFrom(
                                                    backgroundColor:
                                                    Color.fromRGBO(3, 53, 243, 1),
                                                  ),
                                                  onPressed: () {
                                                    setState(() {
                                                      otp = _fieldOne.text +
                                                          _fieldTwo.text +
                                                          _fieldThree.text +
                                                          _fieldFour.text;

                                                      isOtpSend = true;
                                                    });
                                                  },
                                                  child: Text(ConstantString.submit))),
                                        )
                                      ],
                                    )
                                  : Center(
                                child: Container(
                                    width: w!/10,
                                    child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor:
                                          Color.fromRGBO(3, 53, 243, 1),
                                        ),
                                        onPressed: () {
                                          if (formkey.currentState!
                                              .validate()) {

                                            setState(() {
                                              isChecked = true;
                                              startTimer();
                                              startTimer1();
                                            });
                                            //
                                          }
                                        },
                                        child: Text(ConstantString.submit))),
                              ),
                              const SizedBox(
                                height: 40,
                              ),

                            ],
                          ),


                        ),
                      )),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
