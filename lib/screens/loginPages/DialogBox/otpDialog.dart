import 'package:alumni_verification_form/screens/loginPages/DialogBox/successSignupDialog.dart';
import 'package:alumni_verification_form/screens/loginPages/widgets/otpbox.dart';
import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

import '../../../utils/colors.dart';
class ShowDialogOTP extends StatefulWidget {
  const ShowDialogOTP({Key? key}) : super(key: key);

  @override
  State<ShowDialogOTP> createState() => _ShowDialogOTPState();
}

class _ShowDialogOTPState extends State<ShowDialogOTP> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _fieldOne = TextEditingController();
  final TextEditingController _fieldTwo = TextEditingController();
  final TextEditingController _fieldThree = TextEditingController();
  final TextEditingController _fieldFour = TextEditingController();
  String? _otp;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(30),
      width: MediaQuery.of(context).size.width/2,
      height: 501,
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Text("Please enter verification code",style: TextStyle(fontSize: 21,fontWeight: FontWeight.w700)),
             Padding(
               padding: const EdgeInsets.fromLTRB(0, 10, 0, 30),
               child: Text("We have sent the code on the Email ID provided by you",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w700,color: CustomColors.fieldBorderColor)),
             ),
            Row(

              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 39, 0),
                  child: OtpInput(_fieldOne, true),
                ), // auto focus
                Padding(
                  padding: const EdgeInsets.only(right: 39),
                  child: OtpInput(_fieldTwo, false),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 39),
                  child: OtpInput(_fieldThree, false),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 39),
                  child: OtpInput(_fieldFour, false),
                )
              ],
            ),

            // ElevatedButton(
            //     onPressed: () {
            //       setState(() {
            //         _otp = _fieldOne.text +
            //             _fieldTwo.text +
            //             _fieldThree.text +
            //             _fieldFour.text;
            //       });
            //     },
            //
            //     child: const Text('Submit')),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 60),
                  child: Text("Expires in  ",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w700,color: CustomColors.buttonBlueColor)),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 50),
                  child: InkWell(child: Text("Resend  code",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w700,color: CustomColors.buttonBlueColor))),
                ),
                Text("Attempts 0/3",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w700,color: CustomColors.buttonBlueColor)),



              ],
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(30, 200, 30, 0),
                child: SizedBox(

                    width: 414,
                    height: 43,

                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor:
                          CustomColors.buttonBlueColor) ,

    onPressed: () {
    showDialog(
        context: context,
        builder: (BuildContext) {
          return const AlertDialog(
            content: ShowDialogCongratulation(),

          );
        });
        setState(() {
          _otp = _fieldOne.text +
              _fieldTwo.text +
              _fieldThree.text +
              _fieldFour.text;
        });
      },
                      child: const Text(
                        "Submit",
                        style: TextStyle(
                            fontSize: 20,

                            color: Colors.white),
                      ),

                    )
                ),
              ),
            ),




          ],

        ),
      ),
    );
  }
}
