import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_app/pages/home_page.dart';
import 'package:my_app/pages/login_page.dart';
import 'package:my_app/pages/snack_bar.dart';
import 'package:my_app/utils/routes.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build (BuildContext context) {
    return MaterialApp(
      // home: MyHomePage(),
      themeMode: ThemeMode.light,
      theme: ThemeData(primarySwatch: Colors.deepPurple, 
      fontFamily: GoogleFonts.lato().fontFamily,
      // primaryTextTheme: GoogleFonts.latoTextTheme(),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        MyRoutes.homeRoute: (context) => MyHomePage(),
        MyRoutes.loginRoute: (context) => LoginPage(),
      },
    );
  }
}

