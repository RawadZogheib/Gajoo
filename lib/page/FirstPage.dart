import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gajoo/api/my_session.dart';
import 'package:gajoo/globals/globals.dart' as globals;
import 'package:shared_preferences/shared_preferences.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  _FirstPage createState() => _FirstPage();
}

class _FirstPage extends State<FirstPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _timer();
  }

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    var height;
    return Scaffold(
      backgroundColor: globals.blue2,
      body: Container(
        alignment: Alignment.center,
        child: const Image(
          image: AssetImage('Assets/HomePage/logo.png'),
          fit: BoxFit.cover,
          height: 200,
          width: 200,
        ),
      ),
    );
  }

  _timer() async {
    // SharedPreferences localStorage = await SharedPreferences.getInstance();
    // await localStorage.clear();
    try {
      globals.isLoggedIn = await SessionManager().containsKey('token');
      Future.delayed(const Duration(seconds: 3), () {
        Navigator.pushNamedAndRemoveUntil(context, '/HomePage', (route) => false);
      });
    } catch (e) {
      print(e);
    }
  }
}