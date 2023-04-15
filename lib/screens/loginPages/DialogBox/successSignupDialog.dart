import 'package:alumni_verification_form/screens/NewRequest/widgets/rich_text_widget.dart';
import 'package:alumni_verification_form/utils/colors.dart';
import 'package:flutter/material.dart';

class ShowDialogCongratulation extends StatefulWidget {
  const ShowDialogCongratulation({Key? key}) : super(key: key);

  @override
  State<ShowDialogCongratulation> createState() =>
      _ShowDialogCongratulationState();
}

class _ShowDialogCongratulationState extends State<ShowDialogCongratulation> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(30),
      width: MediaQuery.of(context).size.width / 2,
      height: 501,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(44, 201, 17, 245),
        child: Center(
          child: Column(
            children: const [
              Text(
                "Congratulations! Registration completed successfully",
                style: TextStyle(
                    color: Color.fromRGBO(24, 22, 22, 1),
                    fontSize: 21,
                    fontWeight: FontWeight.w700),
              ),
              Text(
                'Please wait while we redirect you to our home page',
                style: TextStyle(
                    color: Color.fromRGBO(0, 0, 0, 1),
                    fontSize: 16,
                    fontWeight: FontWeight.w300),
              )
            ],
          ),
        ),
      ),
    );
  }
}