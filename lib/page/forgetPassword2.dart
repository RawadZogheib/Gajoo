import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gajoo/api/my_api.dart';
import 'package:gajoo/api/my_session.dart';
import 'package:gajoo/globals/globals.dart' as globals;
import 'package:gajoo/widgets/button/myButton.dart';
import 'package:gajoo/widgets/other/errorAlertDialog.dart';
import 'package:gajoo/widgets/textInput/myErrorText.dart';
import 'package:gajoo/widgets/textInput/myTextInput.dart';

class ForgetPass2 extends StatefulWidget {
  const ForgetPass2({Key? key}) : super(key: key);

  @override
  _ForgetPass2State createState() => _ForgetPass2State();
}

class _ForgetPass2State extends State<ForgetPass2> {
  //new Password
  String? _newPassword;
  String? _newPassword2;

  //Regula Expression for password
  final RegExp _passExp =
      RegExp(r"^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[*.!@#$%^&:,?_-]).{8,}$");

  //textInput Color
  Color _colPass = globals.blue; //newPassword
  Color _colPass_1 = globals.blue_1;
  Color _colPass_2 = globals.blue_2;

  Color _colPass2 = globals.blue; //newPassword2
  Color _colPass2_1 = globals.blue_1;
  Color _colPass2_2 = globals.blue_2;

  //Error TextInput
  String _errPass = '';
  Color _colErrPass = globals.transparent;
  String _errPass2 = '';
  Color _colErrPass2 = globals.transparent;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => _back(),
      child: Scaffold(
        backgroundColor: globals.whiteBlue,
        body: ListView(
          children: [
            Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Enter your New Password to continue'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: myTextInput(
                      textString: "Enter Your New Password",
                      labelText: 'Enter Your New Password',
                      colBlue: _colPass,
                      colBlue_1: _colPass_1,
                      colBlue_2: _colPass_2,
                      textInputAction: TextInputAction.next,
                      spaceAllowed: false,
                      obscure: true,
                      maxLines: 1,
                      onChange: (value) {
                        _newPassword = value;
                      }),
                ),
                myErrorText(errorText: _errPass, color: _colErrPass),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: myTextInput(
                      textString: "reEnter Your New Password",
                      labelText: 'reEnter Your New Password',
                      colBlue: _colPass2,
                      colBlue_1: _colPass2_1,
                      colBlue_2: _colPass2_2,
                      textInputAction: TextInputAction.next,
                      spaceAllowed: false,
                      obscure: true,
                      maxLines: 1,
                      onChange: (value) {
                        _newPassword2 = value;
                      }),
                ),
                myErrorText(errorText: _errPass2, color: _colErrPass2),
                Padding(
                  padding: const EdgeInsets.all(28.0),
                  child: InkWell(
                    child: btn(btnText: "Submit"),
                    onTap: () {
                      try {
                        _verifPass();
                      } catch (e) {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) => ErrorAlertDialog(
                                message: globals.errorException));
                      }
                    },
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  _verifPass() {
    _errPass = '';
    _errPass2 = '';
    bool isEmpty = false;

    if (_newPassword != null && _newPassword != '') {
      setState(() {
        _colPass = Colors.blue.shade50;
        _colPass_1 = Colors.blue.shade900;
        _colPass_2 = Colors.blue.shade900.withOpacity(0.5);
      });
    } else {
      isEmpty = true;
      setState(() {
        _colPass = Colors.red.shade50;
        _colPass_1 = Colors.red.shade900;
        _colPass_2 = Colors.red.shade900.withOpacity(0.5);
        _errPass = globals.warning7;
        _colErrPass = globals.red_1;
      });
    }

    if (_newPassword2 != null && _newPassword2 != '') {
      setState(() {
        _colPass2 = Colors.blue.shade50;
        _colPass2_1 = Colors.blue.shade900;
        _colPass2_2 = Colors.blue.shade900.withOpacity(0.5);
      });
    } else {
      isEmpty = true;
      setState(() {
        _colPass2 = Colors.red.shade50;
        _colPass2_1 = Colors.red.shade900;
        _colPass2_2 = Colors.red.shade900.withOpacity(0.5);
        _errPass2 = globals.warning7;
        _colErrPass2 = globals.red_1;
      });
    }

    if (isEmpty == false) {
      if (!_passExp.hasMatch(_newPassword!)) {
        setState(() {
          _colPass = globals.red;
          _colPass_1 = globals.red_1;
          _colPass_2 = globals.red_2;
          _colErrPass = globals.red_1;
          _errPass = globals.warning2_3;
        });
      } else if (_newPassword!.length < 8) {
        setState(() {
          _colPass = globals.red;
          _colPass_1 = globals.red_1;
          _colPass_2 = globals.red_2;
          _colErrPass = globals.red_1;
          _errPass = globals.warning2_3;
        });
      } else if (_newPassword != _newPassword2) {
        setState(() {
          _colPass2 = globals.red;
          _colPass2_1 = globals.red_1;
          _colPass2_2 = globals.red_2;
          _colErrPass2 = globals.red_1;
          _errPass2 = globals.error3;
        });
      } else {
        _checkPass();
      }
    }
  }

  _checkPass() async {
    _errPass = '';
    _errPass2 = '';
    _colErrPass = globals.transparent;
    _colErrPass2 = globals.transparent;

    String? _emailForgetPass;
    SessionManager session = SessionManager();
    _emailForgetPass = await session.get('email');

    try {
      var data = {
        'version': globals.version,
        'email': _emailForgetPass,
        'password': _newPassword,
        'repassword': _newPassword2,
      };

      var res = await CallApi()
          .postData(data, '/Login/Control/(Control)checkNewPassword.php');
      debugPrint(res.body);

      List<dynamic> body = json.decode(res.body);

      if (body[0] == "success") {
        Navigator.pushNamedAndRemoveUntil(context, '/Login', (route) => false);
      } else if (body[0] == "error2_3") {
        setState(() {
          _colPass = globals.red;
          _colPass_1 = globals.red_1;
          _colPass_2 = globals.red_2;
          _colErrPass = globals.red_1;
          _errPass = globals.warning2_3;
        });
      } else if (body[0] == "error3") {
        setState(() {
          _colPass2 = globals.red;
          _colPass2_1 = globals.red_1;
          _colPass2_2 = globals.red_2;
          _colErrPass2 = globals.red_1;
          _errPass2 = globals.error3;
        });
      } else if (body[0] == "error7") {
        setState(() {
          _colErrPass2 = globals.red_1;
          _errPass2 = globals.warning7;
        });
      }
    } catch (e) {
      debugPrint(e.toString());
      setState(() {
        _errPass2 = globals.errorException;
        _colErrPass2 = globals.red_1;
      });
    }
  }

  _back() {
    _errPass = '';
    _colErrPass = globals.transparent;
    _colPass = Colors.blue.shade50;
    _colPass_1 = Colors.blue.shade900;
    _colPass_2 = Colors.blue.shade900.withOpacity(0.5);

    _errPass2 = '';
    _colErrPass2 = globals.transparent;
    _colPass2 = Colors.blue.shade50;
    _colPass2_1 = Colors.blue.shade900;
    _colPass2_2 = Colors.blue.shade900.withOpacity(0.5);

    _newPassword = null;
    _newPassword2 = null;
  }
}