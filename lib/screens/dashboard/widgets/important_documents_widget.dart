import 'package:alumni_verification_form/utils/colors.dart';
import 'package:alumni_verification_form/utils/size.dart';
import 'package:flutter/material.dart';

List<String> importantDocument = [
  "System User Manual",
  "Frequently asked questions",
  "Terms & Conditions",
  "Privacy Policy",
  "System User Manual",
  "Frequently asked questions",
  "Terms & Conditions",
  "Privacy Policy",
  "System User Manual",
  "Frequently asked questions",
  "Terms & Conditions",
  "Privacy Policy"
];

Widget importantDocumentCardWidget(BuildContext context) {
  w = MediaQuery.of(context).size.width;
  h = MediaQuery.of(context).size.height;
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 10),
    width: w,
    height: 271,
    child: Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        side: new BorderSide(color: CustomColors.cardBorderColor, width: 2.0),
        borderRadius: BorderRadius.circular(15.0),
      ),
      color: CustomColors.cardColor,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text("Important Documents",
                  style: TextStyle(
                      color: Color.fromRGBO(
                        0,
                        0,
                        0,
                        1,
                      ),
                      fontSize: w! / 90,
                      fontWeight: FontWeight.w700)),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: importantDocument.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(importantDocument[index].characters.string,
                          style: TextStyle(
                              color: Color.fromRGBO(
                                0,
                                0,
                                0,
                                1,
                              ),
                              fontSize: w! / 90,
                              fontWeight: FontWeight.w300)),
                    );
                  }),
            ),
          ],
        ),
      ),
    ),
  );
}
