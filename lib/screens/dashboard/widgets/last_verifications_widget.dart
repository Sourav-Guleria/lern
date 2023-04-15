import 'package:alumni_verification_form/utils/colors.dart';
import 'package:alumni_verification_form/utils/size.dart';
import 'package:flutter/material.dart';

class LastRequeatsData {
  String requestDate, alumniCode, veerificationStatus, verificationResult;
  int no;

  LastRequeatsData(
      {required this.requestDate,
      required this.no,
      required this.alumniCode,
      required this.veerificationStatus,
      required this.verificationResult});
}

List<LastRequeatsData> lastRequeatsData = [
  LastRequeatsData(
      no: 1,
      alumniCode: "55882018",
      requestDate: "7-Mar-23",
      veerificationStatus: "Clear",
      verificationResult: "View"),
  LastRequeatsData(
      no: 2,
      alumniCode: "55882019",
      requestDate: "8-Mar-23",
      veerificationStatus: "Partial Match",
      verificationResult: "View"),
  LastRequeatsData(
      no: 3,
      alumniCode: "55882020",
      requestDate: "9-Mar-23",
      veerificationStatus: "Failed, Not Found",
      verificationResult: "View"),
  LastRequeatsData(
      no: 4,
      alumniCode: "55882021",
      requestDate: "9-Mar-23",
      veerificationStatus: "Failed, Active",
      verificationResult: "View"),
  LastRequeatsData(
      no: 5,
      alumniCode: "55882022",
      requestDate: "9-Mar-23",
      veerificationStatus: "Partial Match",
      verificationResult: "View"),
  LastRequeatsData(
      no: 6,
      alumniCode: "558820123",
      requestDate: "9-Mar-23",
      veerificationStatus: "Failed, Active ",
      verificationResult: "View"),
  LastRequeatsData(
      no: 7,
      alumniCode: "55882024",
      requestDate: "9-Mar-23",
      veerificationStatus: "Failed, Not Found",
      verificationResult: "View"),
  LastRequeatsData(
      no: 8,
      alumniCode: "55882025",
      requestDate: "9-Mar-23",
      veerificationStatus: "Clear",
      verificationResult: "View"),
  LastRequeatsData(
      no: 9,
      alumniCode: "55882026",
      requestDate: "9-Mar-23",
      veerificationStatus: "Failed, Not Match",
      verificationResult: "View"),
  LastRequeatsData(
      no: 10,
      alumniCode: "55882027",
      requestDate: "9-Mar-23",
      veerificationStatus: "Failed, Active ",
      verificationResult: "View"),
];

Widget last10VarificationWidget(BuildContext context) {
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Last 10 verifications",
                style: TextStyle(
                    color: Color.fromRGBO(
                      0,
                      0,
                      0,
                      1,
                    ),
                    fontSize: w! / 90,
                    fontWeight: FontWeight.w700)),
            Expanded(
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: SingleChildScrollView(
                  child: DataTable(
                      columns: [
                        DataColumn(
                          label: Flexible(
                            child: Text(
                              '#',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                        DataColumn(
                          label: Flexible(
                            child: Text(
                              'Request Date',
                              style: TextStyle(
                                  fontSize: w! / 90,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                        DataColumn(
                          label: Flexible(
                            child: Text(
                              'Alumni Code',
                              style: TextStyle(
                                  fontSize: w! / 90,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                        DataColumn(
                          label: Flexible(
                            child: Text(
                              'Verification Status',
                              style: TextStyle(
                                  fontSize: w! / 90,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                        DataColumn(
                          label: Flexible(
                            child: Text(
                              'Verification Result',
                              style: TextStyle(
                                  fontSize: w! / 90,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                      ],

                      //     ...students.asMap().entries.map(
                      //       (student) {
                      rows: [
                        ...lastRequeatsData.asMap().entries.map((students) {
                          return DataRow(cells: [
                            DataCell(Center(
                                child: Text(students.value.no.toString(),
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w300)))),
                            DataCell(Center(
                                child: Text(students.value.requestDate,
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w300)))),
                            DataCell(Center(
                                child: Text(students.value.alumniCode,
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w300)))),
                            DataCell(Center(
                                child: Text(
                                    students.value.veerificationStatus
                                        .toString(),
                                    style: TextStyle(
                                        // color: CustomColors.greyColor,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w300)))),
                            DataCell(Center(
                                child: Text(students.value.verificationResult,
                                    style: TextStyle(
                                        color: CustomColors.textBlueColor,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500)))),
                          ]);
                        })
                      ]),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
