import 'package:alumni_verification_form/screens/dashboard/dashboard_screen.dart';
import 'package:alumni_verification_form/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ResponsiveDashboard extends StatefulWidget {
  const ResponsiveDashboard({super.key});

  @override
  State<ResponsiveDashboard> createState() => _ResponsiveDashboardState();
}

class _ResponsiveDashboardState extends State<ResponsiveDashboard> {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      desktop: (BuildContext context) => Dasboard(),
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
