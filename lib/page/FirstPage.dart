import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gajoo/api/my_api.dart';
import 'package:gajoo/api/my_session.dart';
import 'package:gajoo/globals/globals.dart' as globals;
import 'package:gajoo/widgets/PopUp/errorWarningPopup.dart';

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
      if (globals.isLoggedIn == true) {
        _verifc();
      } else {
        Navigator.pushNamedAndRemoveUntil(
            context, '/HomePage', (route) => false);
      }
      // Future.delayed(const Duration(seconds: 3), () {
      //   Navigator.pushNamedAndRemoveUntil(context, '/HomePage', (route) => false);
      // });
    } catch (e) {
      print(e);
    }
  }

  _verifc() async {
    try {
      print("hey");

      var data = {
        'version': globals.version,
        'email': await SessionManager().get('email'),
        'password': await SessionManager().get('password'),
      };

      var res =
          await CallApi().postData(data, '/Login/Control/(Control)Login.php');
      print(res.body);
      List<dynamic> body = json.decode(res.body);

      if (body[0] == "success") {
        await SessionManager().set('token', body[1]);
        await SessionManager().set('Id', body[2][0]);
        await SessionManager().set('fName', body[2][1]);
        await SessionManager().set('lName', body[2][2]);
        await SessionManager().set('userName', body[2][3]);
        await SessionManager().set('email', body[2][4]);
        await SessionManager().set('password', globals.passwordLogin);
        await SessionManager().set('phoneNumber', body[2][5]);
        await SessionManager().set('gender', body[2][6]);
        await SessionManager().set('dateOfBirth', body[2][7]);
        globals.isLoggedIn = true;

        Navigator.pushNamedAndRemoveUntil(
            context, '/HomePage', (route) => false);
      } else if (body[0] == "errorVersion") {
        if (mounted) {
          ErrorPopup(context, globals.errorVersion);
        }
        globals.isLoggedIn = false;
        Navigator.pushNamedAndRemoveUntil(
            context, '/HomePage', (route) => false);
      } else if (body[0] == "error8") {
        if (mounted) {
          WarningPopup(context, globals.warning8);
        }
        globals.isLoggedIn = false;
        Navigator.pushNamedAndRemoveUntil(
            context, '/HomePage', (route) => false);
      } else {
        if (mounted) {
          ErrorPopup(context, globals.errorElse);
        }
        globals.isLoggedIn = false;
        Navigator.pushNamedAndRemoveUntil(
            context, '/HomePage', (route) => false);
      }
    } catch (e) {
      print(e);
      if (mounted) {
        ErrorPopup(context, globals.errorException);
      }
      globals.isLoggedIn = false;
      Navigator.pushNamedAndRemoveUntil(
          context, '/HomePage', (route) => false);
    }
  }
}
