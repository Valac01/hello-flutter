import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hello_flutter/pages/home_page.dart';
import 'package:hello_flutter/pages/login_page.dart';
import 'package:hello_flutter/utils/routes.dart';

void main() {
  runApp(myApp());
}

class myApp extends StatelessWidget {
  const myApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: ThemeData(
          fontFamily: GoogleFonts.raleway().fontFamily,
          primaryTextTheme: GoogleFonts.ralewayTextTheme()),
      darkTheme: ThemeData(primarySwatch: Colors.orange),
      initialRoute: "/login",
      routes: {
        MyRoutes.homeRoute: (context) => HomePage(),
        MyRoutes.loginRoute: (context) => LoginPage(),
      },
    );
  }
}
