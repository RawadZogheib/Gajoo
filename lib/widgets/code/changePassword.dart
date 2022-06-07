
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gajoo/api/my_api.dart';
import 'package:gajoo/api/my_session.dart';
import 'package:gajoo/widgets/PopUp/errorWarningPopup.dart';
import 'package:gajoo/widgets/button/myButton.dart';
import 'package:gajoo/widgets/textInput/myErrorText.dart';
import 'package:gajoo/widgets/textInput/myTextInput.dart';
import 'package:gajoo/globals/globals.dart' as globals;

RegExp passExp = RegExp(
    r"^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[*.!@#$%^&:,?_-]).{8,}$");


class changePassword extends StatefulWidget {
  const changePassword({Key? key}) : super(key: key);

  @override
  _changePasswordState createState() => _changePasswordState();
}

class _changePasswordState extends State<changePassword> {

  String password1 = '';
  String password2 = '';
  String password3 = '';
  String errTxt = '';
  Color colErrTxt = globals.transparent;

  String errPassword1 = '';
  Color colErrPassword1 = globals.transparent;
  String errPassword2 = '';
  Color colErrPassword2 = globals.transparent;
  String errPassword3 = '';
  Color colErrPassword3 = globals.transparent;

  Color colPassword1 = globals.blue;
  Color colPassword1_1 = globals.blue_1;
  Color colPassword1_2 = globals.blue_2;
  Color colPassword2 = globals.blue;
  Color colPassword2_1 = globals.blue_1;
  Color colPassword2_2 = globals.blue_2;
  Color colPassword3 = globals.blue;
  Color colPassword3_1 = globals.blue_1;
  Color colPassword3_2 = globals.blue_2;


  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
            children: [
          Padding(
            padding: const EdgeInsets.only(top: 18.0),
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(bottom: 28.0),
                  child: Text(
                    "Change Your Password",
                    style: TextStyle(
                      color: Colors.blueAccent,
                    ),
                  ),
                ),
                myTextInput2(
                    initialValue: "",
                    textString: "Enter your password",
                    labelText: "Enter your password",
                    spaceAllowed: false,
                    enterAllowed: false,
                    obscure: true,
                    maxLines: 1,
                    colBlue: colPassword1,
                    colBlue_1: colPassword1_1,
                    colBlue_2: colPassword1_2,
                    onChange: (value){
                      password1 = value;
                    },
                ),
                const SizedBox(
                  height: 5,
                ),
                myErrorText(errorText: errPassword1, color: colErrPassword1),
                const SizedBox(
                  height: 5,
                ),
                myTextInput2(
                    initialValue: '',
                    textString: "Enter your New Password",
                    labelText: "Enter your New Password",
                    spaceAllowed: false,
                    enterAllowed: false,
                    obscure: true,
                    maxLines: 1,
                    colBlue: colPassword2,
                    colBlue_1: colPassword2_1,
                    colBlue_2: colPassword2_2,
                    onChange: (value){
                      password2 = value;
                    },
                ),
                const SizedBox(
                  height: 5,
                ),
                myErrorText(errorText: errPassword2, color: colErrPassword2),
                const SizedBox(
                  height: 5,
                ),
                myTextInput2(
                    initialValue: '',
                    textString: "reEnter your New Password",
                    labelText: "reEnter your New Password",
                    spaceAllowed: false,
                    enterAllowed: false,
                    obscure: true,
                    maxLines: 1,
                    colBlue: colPassword3,
                    colBlue_1: colPassword3_1,
                    colBlue_2: colPassword3_2,
                    onChange: (value){
                      password3 = value;
                    },
                ),
                const SizedBox(
                  height: 5,
                ),
                myErrorText(errorText: errPassword3, color: colErrPassword3),
                const SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Container(
                      child: InkWell(
                        child: btn(btnText: 'Send'),
                        onTap: () {
                          //print(globals.sixCodeNb);
                          _check();
                        },
                      )),
                ),
              ],
            ),
          )
        ])
    );
  }


  _check() async {
    bool isEmpty = false;

    errPassword1 = '';
    colErrPassword1 = globals.transparent;
    errPassword2 = '';
    colErrPassword2 = globals.transparent;
    errPassword3 = '';
    colErrPassword3 = globals.transparent;

    print(password1);
    print(password2);
    print(password3);

    if (password1 != '' && password1 != null && password1 != 'null') {
      setState(() {
        colPassword1 = globals.blue;
        colPassword1_1 = globals.blue_1;
        colPassword1_2 = globals.blue_2;
      });
    } else {
      isEmpty = true;
      setState(() {
        colPassword1 = Colors.red.shade50;
        colPassword1_1 = Colors.red.shade900;
        colPassword1_2 = Colors.red.shade900.withOpacity(0.5);
        errPassword1 = globals.warning7;
        colErrPassword1 = globals.red_1;
      });
    }

    if (password2 != '' && password2 != null && password2 != 'null') {
      setState(() {
        colPassword2 = globals.blue;
        colPassword2_1 = globals.blue_1;
        colPassword2_2 = globals.blue_2;
      });
    } else {
      isEmpty = true;
      setState(() {
        colPassword2 = Colors.red.shade50;
        colPassword2_1 = Colors.red.shade900;
        colPassword2_2 = Colors.red.shade900.withOpacity(0.5);
        errPassword2 = globals.warning7;
        colErrPassword2 = globals.red_1;
      });
    }

    if (password3 != '' && password3 != null && password3 != 'null') {
      setState(() {
        colPassword3 = globals.blue;
        colPassword3_1 = globals.blue_1;
        colPassword3_2 = globals.blue_2;
      });
    } else {
      isEmpty = true;
      setState(() {
        colPassword3 = Colors.red.shade50;
        colPassword3_1 = Colors.red.shade900;
        colPassword3_2 = Colors.red.shade900.withOpacity(0.5);
        errPassword3 = globals.warning7;
        colErrPassword3 = globals.red_1;
      });
    }

    if (isEmpty == false) {
      if (password2.length < 8) {
        setState(() {
          colPassword3 = Colors.blue.shade50;
          colPassword3_1 = Colors.blue.shade900;
          colPassword3_2 = Colors.blue.shade900.withOpacity(0.5);
          errPassword3 = "";
          colErrPassword2 = globals.transparent;

          colPassword2 = Colors.red.shade50;
          colPassword2_1 = Colors.red.shade900;
          colPassword2_2 = Colors.red.shade900.withOpacity(0.5);
          errPassword2 = globals.warning2_3;
          colErrPassword2 = globals.red_1;
          warningPopup(context, globals.warning2_3);
        });
      } else if (!passExp.hasMatch(password2)) {
        setState(() {
          colPassword3 = Colors.blue.shade50;
          colPassword3_1 = Colors.blue.shade900;
          colPassword3_2 = Colors.blue.shade900.withOpacity(0.5);
          errPassword3 = "";
          colErrPassword2 = globals.transparent;

          colPassword2 = Colors.red.shade50;
          colPassword2_1 = Colors.red.shade900;
          colPassword2_2 = Colors.red.shade900.withOpacity(0.5);
          errPassword2 = globals.warning2_3;
          colErrPassword2 = globals.red_1;
          warningPopup(context, globals.warning2_3);
        });
      } else if (password2 != password3) {
        setState(() {
          colPassword2 = globals.blue;
          colPassword2_1 = globals.blue_1;
          colPassword2_2 = globals.blue_2;
          errPassword2 = "";
          colErrPassword2 = globals.transparent;

          colPassword3 = Colors.red.shade50;
          colPassword3_1 = Colors.red.shade900;
          colPassword3_2 = Colors.red.shade900.withOpacity(0.5);
          errPassword3 = globals.error3;
          colErrPassword3 = globals.red_1;
          errorPopup(context, globals.error3);

        });
      }else {
        _checkCurrentPass();
      }
    }

  }


  _checkCurrentPass() async{

    errTxt = "";

    try {
      var data = {
        'version': globals.version,
        'account_Id': await SessionManager().get("Id"),
        'password': password1,
        'password2': password2,
        'password3': password3
      };

      var res = await CallApi()
          .postData(data, '/Settings/Control/(Control)getAndChangePassword.php');
      print(res.body);
      List<dynamic> body = json.decode(res.body);

      //print(body[1]);
      //print("welcome");
      //print(body[0]);
      if (body[0] == "success") {
        await SessionManager().set('password', password2);
        print(SessionManager().get('password'));

        successPopup(context, "Your Password have been changed Successfully");
        Navigator.pushNamedAndRemoveUntil(context, '/MySettings', (route) => false);

      } else if (body[0] == "errorToken") {
        if (mounted) {
          setState(() {
            errTxt = globals.errorToken;
            colErrTxt = globals.red_1;
            errorPopup(context, globals.errorToken);
          });
        }
      } else if (body[0] == "errorVersion") {
        if (mounted) {
          setState(() {
            errTxt = "Your version: " +
                globals.version +
                "\n" +
                globals.errorVersion;
            colErrTxt = globals.red_1;
            errorPopup(context, globals.errorVersion);
          });
        }
      } else if (body[0] == "error7") {
        setState(() {
          colErrTxt = globals.red_1;
          errTxt = globals.warning7;
          warningPopup(context, globals.warning7);
        });
      } else if (body[0] == "error4") {
        setState(() {
          colErrTxt = globals.red_1;
          errTxt = globals.error4;
          warningPopup(context, globals.error4);
        });
      } else if (body[0] == "error3") {
        setState(() {
          colPassword1 = Colors.red.shade50;
          colPassword1_1 = Colors.red.shade900;
          colPassword1_2 = Colors.red.shade900.withOpacity(0.5);
          errPassword1 = globals.error3;
          colErrPassword1 = globals.red_1;
          warningPopup(context, globals.error3);
        });
      }else if (body[0] == "error2_3") {
        setState(() {
          colPassword1 = Colors.red.shade50;
          colPassword1_1 = Colors.red.shade900;
          colPassword1_2 = Colors.red.shade900.withOpacity(0.5);
          errPassword1 = globals.warning2_3;
          colErrPassword1 = globals.red_1;
          warningPopup(context, globals.warning2_3);
        });
      }else {
        if (mounted) {
          setState(() {
            errTxt = globals.errorElse;
            colErrTxt = globals.red_1;
            errorPopup(context, globals.errorElse);
          });
        }
      }
    } catch (e) {
      print(e);
      if (mounted) {
        setState(() {
          errTxt = globals.errorException;
          colErrTxt = globals.red_1;
          errorPopup(context, globals.errorException);
        });
      }
    }
  }


}
