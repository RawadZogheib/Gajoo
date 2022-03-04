import 'package:flutter/material.dart';
import 'package:gajoo/page/CalendarPage.dart';
import 'package:gajoo/page/CalenderPage2.dart';
import 'package:gajoo/page/HomePage.dart';
import 'package:gajoo/page/Login.dart';
import 'package:gajoo/page/Registration.dart';
import 'package:gajoo/widgets/other/Teacher.dart';
import 'package:gajoo/page/forgetPassword.dart';
import 'package:gajoo/page/forgetPassword2.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //return Sizer(
    //builder: (context, orientation, deviceType) {
    return MaterialApp(
        title: 'Gajoo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        //home: FirstPage(),
        initialRoute: '/CalendarPage',
        routes: {
          '/HomePage': (context) => HomePage(),
          '/CalendarPage': (context) => CalenderPage(),
          '/Login': (context) => login(),
          '/Registration': (context) => registration(),
          '/forgetPassword': (context) => forgetPass(),
          '/forgetPassword2': (context) => forgetPass2(),
          '/Teacher': (context) => Teacher(),
        });
    //});
  }
}
