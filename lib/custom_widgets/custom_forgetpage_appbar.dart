import 'package:alumni_verification_form/utils/string.dart';
import 'package:flutter/material.dart';

class ForgetPageAppBar extends StatelessWidget implements PreferredSize{
  const ForgetPageAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor:  Color.fromRGBO(245, 245, 245, 1),
      title: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Image.asset("assets/images/Jio.png"),
            ),
            SizedBox(width: 10,),
            Text(ConstantString.careers,style: TextStyle(color: Colors.black),)
          ],
        ),
      ),
    );
  }

  @override
  // TODO: implement child
  Size get preferredSize => Size.fromHeight(70);

  @override
  // TODO: implement child
  Widget get child => throw UnimplementedError();
}
