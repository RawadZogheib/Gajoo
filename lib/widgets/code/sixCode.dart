import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gajoo/api/my_api.dart';
import 'package:gajoo/globals/globals.dart' as globals;
import 'package:gajoo/widgets/button/myButton.dart';
import 'package:gajoo/widgets/textInput/myErrorText.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'myCode.dart';

class SixCode extends StatefulWidget {
  const SixCode({Key? key}) : super(key: key);

  @override
  _SixCodeState createState() => _SixCodeState();
}

class _SixCodeState extends State<SixCode> {
  String _errCode = '';
  Color _colErrCode = globals.transparent;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.only(top: 18.0),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 28.0),
              child: Text(
                "Message Sent, check your email",
                style: TextStyle(
                  color: Colors.blueAccent,
                ),
              ),
            ),
            myCode(
              keybType: const TextInputType.numberWithOptions(decimal: true),
              onChange: (value) {
                globals.sixCodeNb = value;
              },
            ),
            myErrorText(errorText: _errCode, color: _colErrCode),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Row(
                children: [
                  Row(
                    children: [
                      InkWell(
                        child: const Text(
                          "Resend Code",
                          style: TextStyle(color: Colors.blue),
                        ),
                        onTap: () {
                          _resendCode();
                        },
                      ),
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: InkWell(
                child: btn(btnText: 'Send'),
                onTap: () {
                  _checkCode();
                },
              ),
            ),
          ],
        ),
      )
    ]);
  }

  _checkCode() async {
    String? _email;
    _errCode = '';
    try {
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      _email = localStorage.getString('email');
      var data = {
        'version': globals.version,
        'code': globals.sixCodeNb,
        'email': _email
      };

      var res = await CallApi()
          .postData(data, '/Registration/Control/(Control)checkCode.php');
      debugPrint(res.body);
      List<dynamic> body = json.decode(res.body);

      if (body[0] == "success") {
        Navigator.pushNamedAndRemoveUntil(context, '/Login', (route) => false);
      } else if (body[0] == "codeFailed") {
        setState(() {
          _errCode = globals.codeFailed;
          _colErrCode = globals.red_1;
        });
      } else if (body[0] == "error7") {
        setState(() {
          _errCode = globals.warning7;
          _colErrCode = globals.red_1;
        });
      }
    } catch (e) {
      _errCode = globals.errorException;
      _colErrCode = globals.red_1;
    }
  }

  _resendCode() async {
    String? _email;
    _errCode = "";
    _colErrCode = globals.transparent;

    SharedPreferences localStorage = await SharedPreferences.getInstance();
    _email = localStorage.getString('email');
    var data = {
      'version': globals.version,
      'email': _email,
    };

    var res = await CallApi()
        .postData(data, '/Login/Control/(Control)resendMail.php');
    debugPrint(res.body);
    List<dynamic> body = json.decode(res.body);

    if (body[0] == "error2_5") {
      _errCode = globals.warning2_5;
      _colErrCode = globals.red_1;
    } else if (body[0] == "codeException") {
      _errCode = globals.codeException;
      _colErrCode = globals.red_1;
    } else if (body[0] == "error7") {
      _errCode = globals.warning7;
      _colErrCode = globals.red_1;
    } else {
      setState(() {
        _errCode = globals.errorElse;
        _colErrCode = globals.red_1;
      });
    }
  }
}