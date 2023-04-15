import 'dart:convert';

import 'package:alumni_verification_form/custom_widgets/custom_appbar.dart';
import 'package:alumni_verification_form/screens/NewRequest/widgets/calender_widget.dart';
import 'package:alumni_verification_form/screens/NewRequest/widgets/rich_text_widget.dart';
import 'package:alumni_verification_form/screens/NewRequest/widgets/text_form_widget.dart';
import 'package:alumni_verification_form/screens/verificationReport/verification_report_page.dart';
import 'package:alumni_verification_form/services/apicall/check_alumni_api_call.dart';
import 'package:alumni_verification_form/services/apicall/master_api_call.dart';
import 'package:alumni_verification_form/services/models/check_alumni_api_model.dart';
import 'package:alumni_verification_form/services/models/master_api_model.dart';

import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:intl/intl.dart';

class NewRequestPage extends StatefulWidget {
  const NewRequestPage({super.key});

  @override
  State<NewRequestPage> createState() => _NewRequestPageState();
}

class _NewRequestPageState extends State<NewRequestPage> {
  MasterApiModel? agencyMasterApiModel = MasterApiModel();
  MasterApiModel? companyNameMasterApiModel = MasterApiModel();
  MasterApiModel? desiginationMasterApiModel = MasterApiModel();
  MasterApiModel? seprationReasonmasterApiModel = MasterApiModel();
  CheckAlumniApiModel? checkAlumniApiModel = CheckAlumniApiModel();
  bool isChecked = false;
  bool nextPressed = false;
  final agencyNameController = TextEditingController();
  final employeeCodeController = TextEditingController();
  final dateOfBirthController = TextEditingController();
  final dateOfJoiningController = TextEditingController();
  final dateofExitController = TextEditingController();
  final jioCompanyNameController = TextEditingController();
  final desiginationController = TextEditingController();
  final seperationReasonController = TextEditingController();
  bool validate = false;

  String query = "";
  String agencyMasterName = "agency";
  String campanyMasterName = "company";
  String desiginationMasterName = "designation";
  String seprationReasonMasterName = "saparationreason";
  final emplooyCodeFormKey = GlobalKey<FormState>();
  final verifyFormKey = GlobalKey<FormState>();

  //String selectval = "Please select";

  List agencySearchList = [];
  List companyNameSearchList = [];
  List desiginationSearchList = [];
  List seprationReasonSearchList = [];
  //List<MasterRecords>? test = [];

  @override
  void initState() {
    MasterApiCall(query: query, masterName: agencyMasterName).fetchData();

    setData(agencyMasterApiModel, query, agencyMasterName, agencySearchList);
    //getData();
    super.initState();
  }

  setData(MasterApiModel? model, String q, String masterName, List list) async {
    model = await MasterApiCall(query: q, masterName: masterName).fetchData();

    for (int i = 0; i < model!.data!.masterRecords!.length; i++) {
      list.add(model.data?.masterRecords![i].name.toString());
    }
  }

  getData() async {
    CheckAlumniApiCall(
        agencyName: agencyNameController.text.toString(),
        dob: dateOfBirthController.text.toString(),
        employeeCode: employeeCodeController.text.toString());
    checkAlumniApiModel = await CheckAlumniApiCall(
            agencyName: agencyNameController.text.toString(),
            dob: dateOfBirthController.text.toString(),
            employeeCode: employeeCodeController.text.toString())
        .fetchData();
  }

  void next() {
    if (emplooyCodeFormKey.currentState!.validate()) {
      setState(() {
        getData();
        MasterApiCall(query: query, masterName: campanyMasterName).fetchData();
        MasterApiCall(query: query, masterName: seprationReasonMasterName)
            .fetchData();
        MasterApiCall(query: query, masterName: desiginationMasterName)
            .fetchData();
        nextPressed = !nextPressed;
        setData(companyNameMasterApiModel, query, campanyMasterName,
            companyNameSearchList);
        setData(desiginationMasterApiModel, query, desiginationMasterName,
            desiginationSearchList);
        setData(seprationReasonmasterApiModel, query, seprationReasonMasterName,
            seprationReasonSearchList);
      });
    }
  }

  List getSuggestions(List list, String query) {
    List matches = [];
    matches.addAll(list);
    matches.retainWhere((s) => s.toLowerCase().contains(query.toLowerCase()));
    return matches;
  }

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.black;
      }
      return Colors.black;
    }

    return Scaffold(
      appBar: const AppBarWidget(),
      body: FutureBuilder(
          future: setData(
              agencyMasterApiModel, query, agencyMasterName, agencySearchList),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      const SizedBox(
                        height: 40,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 50),
                        child: Text("New Verification Request",
                            style: TextStyle(
                                color: Color.fromRGBO(
                                  0,
                                  0,
                                  0,
                                  1,
                                ),
                                fontSize: 19,
                                fontWeight: FontWeight.w700)),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(70, 30, 70, 40),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                const Flexible(
                                  flex: 2,
                                  child: Text(
                                      "Company for whom verification is needed",
                                      style: TextStyle(
                                          color: Color.fromRGBO(
                                            0,
                                            0,
                                            0,
                                            1,
                                          ),
                                          fontSize: 19,
                                          fontWeight: FontWeight.w500)),
                                ),
                                Flexible(
                                  flex: 2,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: searchField("ABCD Pvt Ltd",
                                        agencyNameController, agencySearchList),
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: Checkbox(
                                    checkColor: Colors.white,
                                    fillColor:
                                        MaterialStateProperty.resolveWith(
                                            getColor),
                                    value: isChecked,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        agencyNameController.text.isEmpty
                                            ? validate = true
                                            : validate = false;
                                        if (!validate) {
                                          isChecked = value!;
                                        }
                                      });
                                    },
                                  ),
                                ),
                                const Expanded(
                                  child: Text(
                                      "I hereby declare that before seeking this verification, due written consent is taken from the person for release of this information. In case of any dispute or liability, you will be solely responsible",
                                      style: TextStyle(
                                          color: Color.fromRGBO(
                                            0,
                                            0,
                                            0,
                                            1,
                                          ),
                                          fontSize: 19,
                                          fontWeight: FontWeight.w300)),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            if (isChecked == true)
                              Form(
                                key: emplooyCodeFormKey,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Divider(),
                                    const SizedBox(
                                      height: 25,
                                    ),
                                    const Text("Basic Details",
                                        style: TextStyle(
                                            color:
                                                Color.fromRGBO(63, 98, 220, 1),
                                            fontSize: 19,
                                            fontWeight: FontWeight.w700)),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      // ignore: prefer_const_literals_to_create_immutables
                                      children: [
                                        richText("Alumni Employee Code"),
                                        Flexible(
                                          flex: 1,
                                          child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: textForm("123456",
                                                  employeeCodeController)),
                                        ),
                                        const Spacer(),
                                        richText("Alumni Date of Birth'"),
                                        Flexible(
                                          flex: 1,
                                          child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: CalederWidget(
                                                textEditingController:
                                                    dateOfBirthController,
                                              )),
                                        )
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 30,
                                    ),
                                    if (nextPressed == false)
                                      ElevatedButton(
                                        child: const Text('Next'),
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor:
                                              Color.fromRGBO(53, 53, 243, 1),
                                        ),
                                        onPressed: () {
                                          next();
                                        },
                                      ),
                                    const SizedBox(
                                      height: 25,
                                    ),
                                  ],
                                ),
                              ),
                            if (isChecked == true && nextPressed == true)
                              FutureBuilder(
                                  future: setData(
                                      desiginationMasterApiModel,
                                      query,
                                      desiginationMasterName,
                                      desiginationSearchList),
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState ==
                                        ConnectionState.done) {
                                      return Form(
                                        key: verifyFormKey,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Divider(),
                                            const SizedBox(
                                              height: 25,
                                            ),
                                            const Text("Verification Details",
                                                style: TextStyle(
                                                    color: Color.fromRGBO(
                                                        63, 98, 220, 1),
                                                    fontSize: 19,
                                                    fontWeight:
                                                        FontWeight.w700)),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            const Text(
                                                "Refer Service letter submitted by employee to fill details below",
                                                style: TextStyle(
                                                    color: Color.fromRGBO(
                                                      0,
                                                      0,
                                                      0,
                                                      1,
                                                    ),
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w300)),
                                            Container(
                                              margin: EdgeInsets.only(left: 70),
                                              child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        richText("Alumni Name"),
                                                        const SizedBox(
                                                          width: 10,
                                                        ),
                                                        Text(
                                                            checkAlumniApiModel!
                                                                .data!
                                                                .finalResponse!
                                                                .name
                                                                .toString(),
                                                            // checkAlumniApiModel!
                                                            //     .data![1].name
                                                            //     .toString(),
                                                            style: const TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 19,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700)),
                                                        Spacer(),
                                                        richText(
                                                            "Date of Joining"),
                                                        Flexible(
                                                          flex: 1,
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(8.0),
                                                            child:
                                                                CalederWidget(
                                                              textEditingController:
                                                                  dateOfJoiningController,
                                                            ),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        richText(
                                                            "Date of Exit"),
                                                        const SizedBox(
                                                          width: 10,
                                                        ),
                                                        Flexible(
                                                          flex: 1,
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(8.0),
                                                            child:
                                                                CalederWidget(
                                                              textEditingController:
                                                                  dateofExitController,
                                                            ),
                                                          ),
                                                        ),
                                                        const Spacer(),
                                                        richText(
                                                            "Company Name"),
                                                        Flexible(
                                                          flex: 1,
                                                          child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(8.0),
                                                              child: searchField(
                                                                  "Reliance Jio Infocomm Ltd",
                                                                  jioCompanyNameController,
                                                                  companyNameSearchList)),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        richText('Designation'),
                                                        const SizedBox(
                                                          width: 10,
                                                        ),
                                                        Flexible(
                                                          flex: 1,
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(8.0),
                                                            child: searchField(
                                                                "Asst Manager",
                                                                desiginationController,
                                                                desiginationSearchList),
                                                          ),
                                                        ),
                                                        Spacer(),
                                                        richText(
                                                            "Separation Reason"),
                                                        Flexible(
                                                          flex: 1,
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(8.0),
                                                            child: searchField(
                                                                "Resignation",
                                                                seperationReasonController,
                                                                seprationReasonSearchList),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                    Row(
                                                      // ignore: prefer_const_literals_to_create_immutables
                                                      children: [
                                                        const Spacer(),
                                                        const Text(
                                                          "As per Company policy, we do not verify Salary Details.",
                                                          style: TextStyle(
                                                              color: Colors.red,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w300,
                                                              fontSize: 19),
                                                        )
                                                      ],
                                                    ),
                                                    const SizedBox(
                                                      height: 50,
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        ElevatedButton(
                                                          child: Text('Verify'),
                                                          style: ElevatedButton
                                                              .styleFrom(
                                                            backgroundColor:
                                                                Color.fromRGBO(
                                                                    53,
                                                                    53,
                                                                    243,
                                                                    1),
                                                          ),
                                                          onPressed: () {
                                                            Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                  builder:
                                                                      (context) =>
                                                                          VerificationReportPage()),
                                                            );
                                                          },
                                                        ),
                                                      ],
                                                    ),
                                                    //  dropDownWidget(),
                                                    const SizedBox(
                                                      height: 30,
                                                    ),
                                                    // dropDownWidget(),
                                                    // const SizedBox(
                                                    //   height: 30,
                                                    // ),
                                                  ]),
                                            ),
                                          ],
                                        ),
                                      );
                                    } else {
                                      return const Center(
                                        child: CircularProgressIndicator(),
                                      );
                                    }
                                  }),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }

  Widget searchField(
      String hintText, TextEditingController textEditingController, List list) {
    return TypeAheadField(
        textFieldConfiguration: TextFieldConfiguration(
          decoration: InputDecoration(
            // suffixIcon: Icon(Icons.calendar_month_rounded,
            //     color: Color.fromRGBO(112, 112, 112, 1)),
            focusColor: Color.fromRGBO(184, 184, 184, 1),
            border: OutlineInputBorder(
                borderSide:
                    const BorderSide(color: Color.fromRGBO(184, 184, 184, 1)),
                borderRadius: BorderRadius.circular(10)),
            hintText: hintText,
            hintStyle: const TextStyle(
                color: Color.fromRGBO(184, 184, 184, 1),
                fontWeight: FontWeight.normal,
                fontSize: 15),
            errorText: validate ? 'Value Can\'t Be Empty' : null,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide:
                  const BorderSide(color: Color.fromRGBO(184, 184, 184, 1)),
            ),
          ),
          controller: textEditingController,
        ),
        suggestionsCallback: (pattern) async {
          return await getSuggestions(
            list,
            pattern,
          );
        },
        transitionBuilder: (context, suggestionsBox, controller) {
          return suggestionsBox;
        },
        itemBuilder: (context, suggestion) {
          return ListTile(
            title: Text(suggestion),
          );
        },
        onSuggestionSelected: (suggestion) {
          textEditingController.text = suggestion;
        });
  }
}
