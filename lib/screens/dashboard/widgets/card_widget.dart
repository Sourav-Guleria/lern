import 'package:alumni_verification_form/utils/colors.dart';
import 'package:alumni_verification_form/utils/size.dart';
import 'package:flutter/material.dart';

Widget cardWidget(String text1, String text2, BuildContext context) {
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
