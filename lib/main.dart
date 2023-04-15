import 'package:alumni_verification_form/blocs/login/loginbloc.dart';
import 'package:alumni_verification_form/routers/%20gorouter.dart';
import 'package:alumni_verification_form/screens/loginPages/loginpage.dart';
import 'package:alumni_verification_form/screens/loginPages/loginpagewidget.dart';
import 'package:alumni_verification_form/screens/newRequest/new_request_page.dart';
import 'package:alumni_verification_form/screens/verificationReport/verification_report_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return
        // MaterialApp.router(
        //     debugShowCheckedModeBanner: false,
        //     routeInformationParser: MyRouter().router.routeInformationParser,
        //     routerDelegate:MyRouter().router.routerDelegate ,
        //   );

        MultiBlocProvider(
            providers: [
          BlocProvider<LoginBloc>(
            create: (BuildContext context) => LoginBloc(),
          ),
        ],
            child: MaterialApp(
                title: 'Alumni Verification Portal',
                theme: ThemeData(
                  primarySwatch: Colors.blue,
                  fontFamily: 'JioType',
                ),
                debugShowCheckedModeBanner: false,
                home: const NewRequestPage()
                //LoginPage(),
                ));

    //   MaterialApp(
    //   title: 'AVP',
    //   theme: ThemeData(
    //     primarySwatch: Colors.blue,
    //     fontFamily: 'JioType',
    //   ),
    //   debugShowCheckedModeBanner: false,
    //   home: const LoginPage(),
    // );
  }
}
