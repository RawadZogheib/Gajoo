import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gajoo/api/my_api.dart';
import 'package:gajoo/api/my_session.dart';
import 'package:gajoo/globals/globals.dart' as globals;
import 'package:gajoo/widgets/PopUp/errorWarningPopup.dart';
import 'package:gajoo/widgets/code/codeDialogLogin.dart';

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
        ),
      ),
    );
  }

  _timer() async {
    // SharedPreferences localStorage = await SharedPreferences.getInstance();
    // await localStorage.clear();
    try {
      SessionManager session = SessionManager();

      print(await session.get('isLoggedIn'));
      if (await session.get('isLoggedIn') == true) {
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
    SessionManager session = SessionManager();

    try {
      print("Load login");

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


        if(body[1]== "1") {
          SessionManager session = SessionManager();
          await session.set('token', body[2]);
          await session.set('Id', body[3][0]);
          await session.set('fName', body[3][1]);
          await session.set('lName', body[3][2]);
          await session.set('userName', body[3][3]);
          await session.set('phoneNumber', body[3][4]);
          await session.set('gender', body[3][5]);
          await session.set('dateOfBirth', body[3][6]);
          await session.set('isLoggedIn', true);
          //print(await session.get('isLoggedIn'));
          Navigator.pushNamedAndRemoveUntil(
              context, '/HomePage', (route) => false);
        }else{
          showDialog(
              context: context,
              builder: (BuildContext context) => const CodeDialogLogin())
              .then((exit) {
            if (mounted) {
              setState(() {
                _nullTextCode();
              });
            }
          });
        }
      }else if (body[0] == "errorVersion") {
        if (mounted) {
          errorPopup(context, globals.errorVersion);
        }
        await session.set('isLoggedIn', false);
        Navigator.pushNamedAndRemoveUntil(
            context, '/HomePage', (route) => false);
      } else if (body[0] == "error8") {
        if (mounted) {
          warningPopup(context, globals.warning8);
        }
        await session.set('isLoggedIn', false);
        Navigator.pushNamedAndRemoveUntil(
            context, '/HomePage', (route) => false);
      } else {
        if (mounted) {
          errorPopup(context, globals.errorElse);
        }
        await session.set('isLoggedIn', false);
        Navigator.pushNamedAndRemoveUntil(
            context, '/HomePage', (route) => false);
      }
    } catch (e) {
      print(e);
      if (mounted) {
        errorPopup(context, globals.errorException);
      }
      await session.set('isLoggedIn', false);
      Navigator.pushNamedAndRemoveUntil(context, '/HomePage', (route) => false);
    }
  }

  _nullTextCode() {
    globals.sixCodeNb = null;
  }

}
