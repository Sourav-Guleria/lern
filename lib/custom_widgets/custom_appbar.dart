import 'package:alumni_verification_form/custom_widgets/custom_searcbar.dart';
import 'package:alumni_verification_form/utils/colors.dart';
import 'package:alumni_verification_form/utils/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    w = MediaQuery.of(context).size.width;
    h = MediaQuery.of(context).size.height;
    return AppBar(
      backgroundColor: const Color.fromRGBO(245, 245, 245, 1),
      // leading: Row(
      //   children: [
      //     Flexible(
      //         child: Padding(
      //       padding: const EdgeInsets.symmetric(horizontal: 10),
      //       child: Icon(
      //         Icons.arrow_back_ios,
      //         color: CustomColors.textBlackColor,
      //       ),
      //     )),
      //     Image.asset(
      //       "assets/images/Jio.png",
      //       fit: BoxFit.contain,
      //     ),
      //   ],
      // ),

      title: Row(
        children: [
          Flexible(
              child: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.arrow_back_ios,
              color: CustomColors.textBlackColor,
            ),
          )),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.only(right: 20, left: 10),
              child: Image.asset(
                "assets/images/Jio.png",
                fit: BoxFit.contain,
              ),
            ),
          ),
          const Expanded(
            child: Text("Alumni Verification Form",
                style: TextStyle(
                    color: Color.fromRGBO(
                      0,
                      0,
                      0,
                      1,
                    ),
                    fontSize: 16,
                    fontWeight: FontWeight.bold)),
          ),
          Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: SearchBar(),
              )),
          const SizedBox(
            width: 200,
          )
        ],
      ),
      // ignore: prefer_const_literals_to_create_immutables
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: IconButton(
              icon: Icon(
                Icons.account_circle,
                color: CustomColors.textBlackColor,
                size: 34,
              ),
              onPressed: () {}

              // Scaffold.of(context).openEndDrawer(),
              // tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              ),
        ),
        // const Center(
        //   child: Text(
        //     "Home",
        //     style: TextStyle(
        //         color: Color.fromRGBO(
        //           0,
        //           0,
        //           0,
        //           1,
        //         ),
        //         fontSize: 12,
        //         fontWeight: FontWeight.w700),
        //   ),
        // ),
        // InkWell(
        //   onTap: () {
        //     // dialog();
        //     // showGeneralDialog(
        //     //   context: context,
        //     //   // barrierColor: Colors.black54,
        //     //   //  barrierDismissible: true,
        //     //   // barrierLabel: 'Label',
        //     //   pageBuilder: (_, __, ___) {
        //     //     return Container(
        //     //       margin: EdgeInsets.all(30),
        //     //       child: Align(
        //     //         alignment: Alignment.topRight,
        //     //         child: Container(
        //     //           color: Colors.blue,
        //     //           child: FlutterLogo(size: 150),
        //     //         ),
        //     //       ),
        //     //     );
        //     //   },
        //     // );

        //     // showDialog(
        //     //     context: context,
        //     //     builder: (BuildContext) {
        //     //       return AlertDialog(content: dialog());
        //     //     });
        //   },
        //   child: const Padding(
        //       padding: EdgeInsets.all(15.0),
        //       child: Icon(
        //         Icons.account_circle,
        //         color: CustomColors.textBlackColor,
        //         size: 34,
        //       )
        //       // CircleAvatar(
        //       //   backgroundImage: NetworkImage(
        //       //     "https://www.gravatar.com/avatar/205e460b479e2e5b48aec07710c08d50.jpg",
        //       //   ),
        //       // )
        //       ),
        // )
      ],
    );
  }

  Widget endDarawar() {
    return endDarawar();
  }

  Widget dialog() {
    return Dialog(
      alignment: Alignment.topRight,
      child: Container(
        height: 200,
        width: w! / 10,
        child: Column(
          children: [
            const Padding(
                padding: EdgeInsets.all(15.0),
                child: Icon(
                  Icons.account_circle,
                  color: CustomColors.textBlackColor,
                  size: 34,
                )),
            SizedBox(
              height: 20,
            ),
            const Padding(
                padding: EdgeInsets.all(15.0),
                child: Icon(
                  Icons.logout,
                  color: CustomColors.textBlackColor,
                  size: 34,
                )),
          ],
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(70.0);
}
