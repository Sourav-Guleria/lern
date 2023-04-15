import 'package:alumni_verification_form/custom_widgets/custom_appbar.dart';
import 'package:alumni_verification_form/screens/verificationReport/widgets/alumni_name_row_widget.dart';
import 'package:alumni_verification_form/screens/verificationReport/widgets/button_widget.dart';
import 'package:alumni_verification_form/screens/verificationReport/widgets/error_message_widget.dart';
import 'package:alumni_verification_form/screens/verificationReport/widgets/report_detail_widget.dart';
import 'package:alumni_verification_form/screens/verificationReport/widgets/request_number_row_widget.dart';
import 'package:alumni_verification_form/utils/colors.dart';
import 'package:alumni_verification_form/utils/size.dart';
import 'package:flutter/material.dart';

class VerificationReportPage extends StatefulWidget {
  const VerificationReportPage({super.key});

  @override
  State<VerificationReportPage> createState() => _VerificationReportPageState();
}

class _VerificationReportPageState extends State<VerificationReportPage> {
  List<VarificationData> verificationData = [
    VarificationData(
        particulars: "Date of Joining",
        detailEntered: "10-Feb-2021",
        verificationResult: true),
    VarificationData(
        particulars: "Date of Exit",
        detailEntered: "10-Feb-2023",
        verificationResult: true),
    VarificationData(
        particulars: "Company Name",
        detailEntered: "Reliance Jio Infocomm Ltd",
        verificationResult: true),
    VarificationData(
        particulars: "Designation",
        detailEntered: "Asst Manager",
        verificationResult: true),
    VarificationData(
        particulars: "Separation Reason",
        detailEntered: "Resignation",
        verificationResult: false),
  ];

  @override
  Widget build(BuildContext context) {
    w = MediaQuery.of(context).size.width;
    h = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: CustomColors.cardColor,
      appBar: AppBarWidget(),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 40, horizontal: 300),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Verification Report",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color.fromRGBO(
                        0,
                        0,
                        0,
                        1,
                      ),
                      fontSize: 19,
                      fontWeight: FontWeight.w700)),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                // height: 483,
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        requestNumberRowWidget(context),
                        SizedBox(
                          height: 20,
                        ),
                        alumniNamerRowWidget(context),
                        reportDetailWidget(context),
                        // errorMessageWidget(
                        //     "Looks like you entered wrong data, please check & try again",
                        //     "You have exhausted 1/10 verification attempts"),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text("Result: ",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: w! / 90,
                                    fontWeight: FontWeight.w500)),
                            Text("Partial Match",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: CustomColors.orangeColor,
                                    fontSize: w! / 90,
                                    fontWeight: FontWeight.w500)),
                          ],
                        ),
                      ],
                    ),
                  ),
                  elevation: 10,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              buttonWidget("New Request", context),
            ],
          ),
        ),
      ),
    );
  }
}

class VarificationData {
  String particulars, detailEntered;
  bool verificationResult;

  VarificationData(
      {required this.particulars,
      required this.detailEntered,
      required this.verificationResult});
}
