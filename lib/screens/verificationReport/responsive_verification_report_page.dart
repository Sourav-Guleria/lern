import 'package:alumni_verification_form/screens/verificationReport/verification_report_page.dart';
import 'package:alumni_verification_form/utils/colors.dart';
import 'package:flutter/material.dart';

import 'package:responsive_builder/responsive_builder.dart';

class ResponsiveVerificationReport extends StatefulWidget {
  const ResponsiveVerificationReport({super.key});

  @override
  State<ResponsiveVerificationReport> createState() =>
      _ResponsiveVerificationReportState();
}

class _ResponsiveVerificationReportState
    extends State<ResponsiveVerificationReport> {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      desktop: (BuildContext context) => VerificationReportPage(),
      tablet: (BuildContext context) => Container(
        child: Center(
          child: Text("Tablet Dashboard",
              style: TextStyle(
                  color: CustomColors.textBlueColor,
                  fontSize: 19,
                  fontWeight: FontWeight.w700)),
        ),
      ),
      mobile: (BuildContext context) => Center(
        child: Text("Mobile Dashboard",
            style: TextStyle(
                color: CustomColors.textBlueColor,
                fontSize: 19,
                fontWeight: FontWeight.w700)),
      ),
    );
  }
}
