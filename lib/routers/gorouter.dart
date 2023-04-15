import 'package:alumni_verification_form/screens/loginPages/loginpage.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MyRouter {
  GoRouter router = GoRouter(
      routes: [
        GoRoute(  path: '/',
           name: 'home',
          pageBuilder: (context, state) {
            return  MaterialPage(child: LoginPage());
          },
        ),
        // GoRoute(  path: '/',
        // name: 'login',
        // pageBuilder: (context, state) {
        //   return const MaterialPage(child: Mylpage());
        // },

        // GoRoute(  path: '/',
        // name: 'Productdetails',
        // pageBuilder: (context, state) {
        //   return MaterialPage(child: ProductDetails(model: Widget));
        // },
        // )
      ]
  );
}
