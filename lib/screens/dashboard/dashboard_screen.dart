import 'package:alumni_verification_form/custom_widgets/custom_appbar.dart';
import 'package:alumni_verification_form/screens/dashboard/widgets/card_widget.dart';
import 'package:alumni_verification_form/screens/dashboard/widgets/exhausted_request_dialog_content_widget.dart';
import 'package:alumni_verification_form/screens/dashboard/widgets/important_documents_widget.dart';
import 'package:alumni_verification_form/screens/dashboard/widgets/last_verifications_widget.dart';
import 'package:alumni_verification_form/screens/loginPages/DialogBox/successSignupDialog.dart';
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
                      child: cardWidget(
                          "Total Verifications Requested", "23", context)),
                  Flexible(
                      child: cardWidget(
                          "Verifications in last 15 days", "12", context)),
                  Flexible(
                      child: InkWell(
                    child: cardWidget("Create New Request", "", context),
                    onTap: () {
                      // showDialog(
                      //     context: context,
                      //     builder: (BuildContext) {
                      //       return AlertDialog(
                      //         content: exhaustedRequestDialogContent(
                      //             "Oops! Looks like you have exhausted your verification requests for the day.",
                      //             "Please try again tomorrow!",
                      //             context),
                      //       );
                      //     });
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
                    Flexible(flex: 2, child: last10VarificationWidget(context)),
                    Flexible(child: importantDocumentCardWidget(context)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
