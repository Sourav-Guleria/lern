import 'package:alumni_verification_form/custom_widgets/custom_appbar.dart';
import 'package:alumni_verification_form/screens/newRequest/new_request_page.dart';
import 'package:alumni_verification_form/utils/colors.dart';
import 'package:alumni_verification_form/utils/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Dasboard extends StatefulWidget {
  const Dasboard({super.key});

  @override
  State<Dasboard> createState() => _DasboardState();
}

class _DasboardState extends State<Dasboard> {
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
  @override
  Widget build(BuildContext context) {
    w = MediaQuery.of(context).size.width;
    h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: const AppBarWidget(),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 40, horizontal: 30),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Flexible(
                      child: cardWidget("Total Verifications Requested", "23")),
                  Flexible(
                      child: cardWidget("Verifications in last 15 days", "12")),
                  Flexible(
                      child: InkWell(
                    child: cardWidget("Create New Request", ""),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => NewRequestPage()),
                      );
                    },
                  )),
                ],
              ),
              Container(
                height: 300,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Flexible(flex: 2, child: last10VarificationWidget()),
                    Flexible(child: importantDocumentCardWidget()),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget cardWidget(String text1, String text2) {
    w = MediaQuery.of(context).size.width;
    h = MediaQuery.of(context).size.height;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      width: w,
      height: 212,
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          side: new BorderSide(color: CustomColors.cardBorderColor, width: 2.0),
          borderRadius: BorderRadius.circular(15.0),
        ),
        color: CustomColors.cardColor,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 26, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Text(text1,
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
              text2.isNotEmpty
                  ? Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Text(text2,
                          style: TextStyle(
                              color: Color.fromRGBO(
                                0,
                                0,
                                0,
                                1,
                              ),
                              fontSize: w! / 25,
                              fontWeight: FontWeight.w700)),
                    )
                  : const Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Icon(
                        Icons.add_circle_outline,
                        color: CustomColors.textBlackColor,
                        size: 58,
                        weight: 0.5,
                      ))
            ],
          ),
        ),
      ),
    );
  }

  Widget last10VarificationWidget() {
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

  Widget importantDocumentCardWidget() {
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
}

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
