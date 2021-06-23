import 'package:flutter/material.dart';
import 'package:my_app/core/store.dart';
import 'package:my_app/pages/cart_page.dart';
import 'package:my_app/pages/home/home_page.dart';
import 'package:my_app/pages/login_page.dart';
import 'package:my_app/utils/routes.dart';
import 'package:my_app/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

void main() {
  runApp( VxState(store: MyStore(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build (BuildContext context) {
    return MaterialApp(
      // home: MyHomePage(),
      themeMode: ThemeMode.system,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      initialRoute: MyRoutes.homeRoute,
      routes: {
        '/': (context) => LoginPage(),
        MyRoutes.homeRoute: (context) => MyHomePage(),
        MyRoutes.loginRoute: (context) => LoginPage(),
        MyRoutes.cartPage: (context) => CartPage(),

      },
    );
  }
}

