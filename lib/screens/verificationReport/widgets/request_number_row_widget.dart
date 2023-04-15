import 'package:alumni_verification_form/utils/colors.dart';
import 'package:alumni_verification_form/utils/size.dart';
import 'package:flutter/material.dart';

class LastRequeatsData {
  String field1, field2;

  LastRequeatsData({
    required this.field1,
    required this.field2,
  });
}

List<LastRequeatsData> lastRequeatsData = [
  LastRequeatsData(
    field1: "AV2022-98-0976",
    field2: "11223344",
  ),
];

Widget requestNumberRowWidget(BuildContext context) {
  w = MediaQuery.of(context).size.width;
  h = MediaQuery.of(context).size.height;
  return Table(
    columnWidths: {2: FlexColumnWidth(1)},
    children: [
      ...lastRequeatsData.asMap().entries.map((students) {
        return TableRow(children: [
          Text("Request Number",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: w! / 90,
                  fontWeight: FontWeight.w500)),
          Text(students.value.field1,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: w! / 90,
                  fontWeight: FontWeight.w300)),
          Text("Alumni Code",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: w! / 90,
                  fontWeight: FontWeight.w500)),
          Text(students.value.field2,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: w! / 90,
                  fontWeight: FontWeight.w300)),
        ]);
      }),
    ],
  );
}
