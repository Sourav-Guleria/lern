import 'package:alumni_verification_form/utils/colors.dart';
import 'package:alumni_verification_form/utils/size.dart';
import 'package:flutter/material.dart';

Widget reportDetailWidget(BuildContext context) {
  w = MediaQuery.of(context).size.width;
  h = MediaQuery.of(context).size.height;
  return Container(
    margin: EdgeInsets.symmetric(horizontal: w! / 20, vertical: 30),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Divider(
          color: CustomColors.greyColor,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Table(
            // columnWidths: {2: FlexColumnWidth(1)},
            children: [
              TableRow(children: [
                Center(
                  child: Text("Particulars",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: w! / 90,
                          fontWeight: FontWeight.w500)),
                ),
                Center(
                  child: Text("Detail Entered",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: w! / 90,
                          fontWeight: FontWeight.w500)),
                ),
                Center(
                  child: Text("Verification Result",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: w! / 90,
                          fontWeight: FontWeight.w500)),
                ),
              ]),
            ],
          ),
        ),
        // ListTile(
        //   leading: Text("Particulars",
        //       style: TextStyle(
        //           color: Colors.black,
        //           fontSize: w! / 90,
        //           fontWeight: FontWeight.w500)),
        //   title: Center(
        //     child: Text("Detail Entered",
        //         style: TextStyle(
        //             color: Colors.black,
        //             fontSize: w! / 90,
        //             fontWeight: FontWeight.w500)),
        //   ),
        //   trailing: Text("Verification Result",
        //       style: TextStyle(
        //           color: Colors.black,
        //           fontSize: w! / 90,
        //           fontWeight: FontWeight.w500)),
        // ),
        Divider(
          color: CustomColors.greyColor,
        ),
        Table(
          columnWidths: {2: FlexColumnWidth(1)},
          children: [
            ...verificationData.asMap().entries.map((students) {
              return TableRow(children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  child: Center(
                    child: Text(students.value.particulars,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: w! / 90,
                            fontWeight: FontWeight.w300)),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  child: Center(
                    child: Text(students.value.detailEntered,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: w! / 90,
                            fontWeight: FontWeight.w300)),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                  child: students.value.verificationResult == true
                      ? Center(
                          child: Icon(
                            Icons.check_circle,
                            color: CustomColors.greenColor,
                            size: w! / 70,
                          ),
                        )
                      : Center(
                          child: Icon(
                            Icons.cancel,
                            color: CustomColors.redColor,
                            size: w! / 70,
                          ),
                        ),
                ),
              ]);
            }),
          ],
        ),
        // ListView.builder(
        //   shrinkWrap: true,
        //   itemCount: verificationData.length,
        //   itemBuilder: (context, index) {
        //     return Padding(
        //         padding: const EdgeInsets.symmetric(vertical: 5),
        //         child: ListTile(
        //           leading: Flexible(
        //             child: Text(verificationData[index].particulars,
        //                 style: TextStyle(
        //                     color: Colors.black,
        //                     fontSize: w! / 90,
        //                     fontWeight: FontWeight.w300)),
        //           ),
        //           title: Center(
        //             child: Flexible(
        //               child: Text(verificationData[index].detailEntered,
        //                   style: TextStyle(
        //                       color: Colors.black,
        //                       fontSize: w! / 90,
        //                       fontWeight: FontWeight.w300)),
        //             ),
        //           ),
        //           trailing: Flexible(
        //               child: verificationData[index].verificationResult == true
        //                   ? Icon(
        //                       Icons.check_circle,
        //                       color: CustomColors.greenColor,
        //                       size: w! / 70,
        //                     )
        //                   : Icon(
        //                       Icons.cancel,
        //                       color: CustomColors.redColor,
        //                       size: w! / 70,
        //                     )),
        //         ));
        //   },
        // ),
      ],
    ),
  );
}

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

class VarificationData {
  String particulars, detailEntered;
  bool verificationResult;

  VarificationData(
      {required this.particulars,
      required this.detailEntered,
      required this.verificationResult});
}
