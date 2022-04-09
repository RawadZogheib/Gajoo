import 'package:flutter/material.dart';
import 'package:gajoo/page/CalendarPage.dart';
import 'package:gajoo/page/FirstPage.dart';
import 'package:gajoo/page/HomePage.dart';
import 'package:gajoo/page/LikedTeachersPage.dart';
import 'package:gajoo/page/Login.dart';
import 'package:gajoo/page/MyAudio.dart';
import 'package:gajoo/page/MyCourses.dart';
import 'package:gajoo/page/MySettings.dart';
import 'package:gajoo/page/PaymentPage.dart';
import 'package:gajoo/page/Registration.dart';
import 'package:gajoo/page/Teacher.dart';
import 'package:gajoo/page/forgetPassword.dart';
import 'package:gajoo/page/forgetPassword2.dart';
import 'package:gajoo/page/testPage.dart';
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
        initialRoute: '/TestPage',
        routes: {
          '/FirstPage': (context) => const FirstPage(),
          '/HomePage': (context) => const HomePage(),
          '/Login': (context) => const Login(),
          '/Registration': (context) => const registration(),
          '/forgetPassword': (context) => const forgetPass(),
          '/forgetPassword2': (context) => const forgetPass2(),
          '/MyCourses': (context) => const MyCourses(),
          '/LikedTeachersPage': (context) => LikedTeachersPage(),
          '/MyAudio': (context) => const MyAudio(),
          '/PaymentPage': (context) => const PaymentPage(),
          '/MySettings': (context) => const MySettings(),
          '/TestPage': (context) => const TestPage(),
        });
    //});
  }
}
