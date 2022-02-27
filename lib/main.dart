import 'package:flutter/material.dart';
import 'package:gajoo/page/HomePage.dart';
import 'package:gajoo/page/Login.dart';
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
        initialRoute: '/Login',
        routes: {
          '/Login': (context) => login(),
        });
    //});
  }
}
