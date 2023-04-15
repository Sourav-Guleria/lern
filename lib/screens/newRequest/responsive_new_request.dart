import 'package:alumni_verification_form/screens/newRequest/new_request_page.dart';
import 'package:flutter/material.dart';

import 'package:responsive_builder/responsive_builder.dart';

class ResponsiveNewRequest extends StatefulWidget {
  const ResponsiveNewRequest({super.key});

  @override
  State<ResponsiveNewRequest> createState() => _ResponsiveNewRequestState();
}

class _ResponsiveNewRequestState extends State<ResponsiveNewRequest> {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      desktop: (BuildContext context) => NewRequestPage(),
      tablet: (BuildContext context) => Container(),
      mobile: (BuildContext context) => Container(),
    );
  }
}
