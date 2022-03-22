import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gajoo/api/my_api.dart';
import 'package:gajoo/api/my_session.dart';
import 'package:gajoo/globals/globals.dart' as globals;
import 'package:gajoo/widgets/PopUp/errorWarningPopup.dart';
import 'package:gajoo/widgets/button/myButton.dart';
import 'package:gajoo/widgets/code/codeDialogLogin.dart';
import 'package:gajoo/widgets/other/errorAlertDialog.dart';
import 'package:gajoo/widgets/textInput/myErrorText.dart';
import 'package:gajoo/widgets/textInput/myTextInput.dart';

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> {
  Color colEmail = globals.blue; //email
  Color colEmail_1 = globals.blue_1;
  Color colEmail_2 = globals.blue_2;

  Color colPass = globals.blue; //password
  Color colPass_1 = globals.blue_1;
  Color colPass_2 = globals.blue_2;

  String errTxtEmail = ''; //email error
  Color colErrTxtEmail = globals.transparent;
  String errTxtPass = ''; //password error
  Color colErrTxtPass = globals.transparent;
  String errTxt = ''; //else error
  Color colErrTxt = globals.transparent;

  String errTxtForgetPass = '';
  Color colErrForgetPass = globals.transparent;

  var oneClick = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    oneClick = 0;
    globals.clearLogin();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => _back(),
      child: Scaffold(
        backgroundColor: globals.whiteBlue,
        body: SingleChildScrollView(
          child: Padding(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.1),
            child: Center(
              child: Container(
                width: 500,
                height: 670,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.white,
                ),
                child: Stack(
                  children: [
                    Positioned(
                      top: 5,
                      left: 5,
                      child: IconButton(
                        icon: const Icon(Icons.arrow_back),
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onPressed: () {
                          Navigator.pushNamedAndRemoveUntil(
                              context, '/HomePage', (route) => false);
                        },
                      ),
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 28.0, left: 8.0, right: 8.0, bottom: 8.0),
                          child: Container(
                            width: 300,
                            alignment: Alignment.topLeft,
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                              'Assets/HomePage/logo.png',
                              height: 95,
                              width: 300,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Text(
                            "Login",
                            style: const TextStyle(
                                fontSize: 40.0, color: Colors.black),
                          ),
                        ),
                        Padding(
                            padding: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width * 0.05,
                                top: 18.0,
                                right: MediaQuery.of(context).size.width * 0.05,
                                bottom: 8.0),
                            child: Container(
                              width: 400,
                              height: 55,
                              child: myTextInput(
                                  textString: "Enter Your Email Address",
                                  labelText: 'Enter Your Email Address',
                                  colBlue: colEmail,
                                  colBlue_1: colEmail_1,
                                  colBlue_2: colEmail_2,
                                  textInputAction: TextInputAction.next,
                                  spaceAllowed: false,
                                  obscure: false,
                                  onChange: (value) {
                                    globals.emailLogin = value;
                                  }),
                            )),
                        myErrorText(
                            errorText: errTxtEmail, color: colErrTxtEmail),
                        Padding(
                          padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * 0.05,
                              top: 8.0,
                              right: MediaQuery.of(context).size.width * 0.05,
                              bottom: 8.0),
                          child: Container(
                            width: 500,
                            height: 50,
                            child: myTextInput(
                              textString: "Enter Your Password",
                              labelText: 'Enter Your Password',
                              colBlue: colPass,
                              colBlue_1: colPass_1,
                              colBlue_2: colPass_2,
                              maxLines: 1,
                              textInputAction: TextInputAction.none,
                              spaceAllowed: false,
                              obscure: true,
                              onChange: (value) {
                                globals.passwordLogin = value;
                                //print(globals.Login);
                              },
                            ),
                          ),
                        ),
                        myErrorText(
                            errorText: errTxtPass, color: colErrTxtPass),
                        Padding(
                          padding: const EdgeInsets.all(28.0),
                          child: InkWell(
                            child: btn(btnText: "Submit"),
                            onTap: () {
                              try {
                                if (oneClick == 0) {
                                  _LoginCtrl();
                                }
                              } catch (e) {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        ErrorAlertDialog(
                                            message: globals.errorException));
                              }
                            },
                          ),
                        ),
                        myErrorText(errorText: errTxt, color: colErrTxt),
                        Padding(
                          padding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height * 0.001),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsets.all(18.0),
                                child: InkWell(
                                  child: Text(
                                    'Forget Password',
                                    style: TextStyle(
                                      color: globals.blue_1,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                  onTap: () {
                                    //_checkIfIsRegist();
                                    Navigator.pushNamedAndRemoveUntil(context,
                                        '/forgetPassword', (route) => false);
                                  },
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(18.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text("didn't have an account? "),
                                    InkWell(
                                      child: Text(
                                        "create new one",
                                        style: TextStyle(
                                          color: globals.blue_1,
                                          decoration: TextDecoration.underline,
                                        ),
                                      ),
                                      onTap: () {
                                        _nullLogin();
                                        Navigator.pushNamedAndRemoveUntil(
                                            context,
                                            '/Registration',
                                            (route) => false);
                                      },
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  _LoginCtrl() async {
    oneClick = 1;
    bool isEmpty = false;

    errTxtEmail = '';
    colErrTxtEmail = globals.transparent;
    errTxtPass = '';
    colErrTxtPass = globals.transparent;
    errTxt = '';
    colErrTxt = globals.transparent;

    if (globals.emailLogin != null && globals.emailLogin != '') {
      if (mounted) {
        setState(() {
          colEmail = Colors.blue.shade50;
          colEmail_1 = Colors.blue.shade900;
          colEmail_2 = Colors.blue.shade900.withOpacity(0.5);
        });
      }
    } else {
      isEmpty = true;
      if (mounted) {
        setState(() {
          colEmail = Colors.red.shade50;
          colEmail_1 = Colors.red.shade900;
          colEmail_2 = Colors.red.shade900.withOpacity(0.5);
          errTxtEmail = globals.warning7;
          colErrTxtEmail = globals.red_1;
          WarningPopup(context, globals.warning7);
        });
      }
    }

    if (globals.passwordLogin != null && globals.passwordLogin != '') {
      if (mounted) {
        setState(() {
          colPass = Colors.blue.shade50;
          colPass_1 = Colors.blue.shade900;
          colPass_2 = Colors.blue.shade900.withOpacity(0.5);
        });
      }
    } else {
      isEmpty = true;
      if (mounted) {
        setState(() {
          colPass = Colors.red.shade50;
          colPass_1 = Colors.red.shade900;
          colPass_2 = Colors.red.shade900.withOpacity(0.5);
          errTxtPass = globals.warning7;
          colErrTxtPass = globals.red_1;
          WarningPopup(context, globals.warning7);
        });
      }
    }

    if (isEmpty == false) {
      await _verifc();
    } else {
      //do nothing
    }
    oneClick = 0;
  }

  _verifc() async {
    errTxt = '';

    try {
      print("hey");
      // if(globals.emailLogin != null && globals.passwordLogin != null){
      // print(globals.emailLogin);
      // print(globals.passwordLogin);
      var data = {
        'version': globals.version,
        'email': globals.emailLogin,
        'password': globals.passwordLogin,
      };

      var res =
          await CallApi().postData(data, '/Login/Control/(Control)Login.php');
      print(res.body);
      List<dynamic> body = json.decode(res.body);

      //print(body[1]);
      //print("welcome");
      if (body[0] == "true") {
        showDialog(
                context: context,
                builder: (BuildContext context) => const codeDialogLogin())
            .then((exit) {
          if (mounted) {
            setState(() {
              _nullTextCode();
            });
          }
        });
      } else if (body[0] == "success") {
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
          setState(() {
            errTxt = "Your version: " +
                globals.version +
                "\n" +
                globals.errorVersion;
            colErrTxt = globals.red_1;
            ErrorPopup(context, globals.errorVersion);
          });
        }
      } else if (body[0] == "error8") {
        colEmail = Colors.red.shade50;
        colEmail_1 = Colors.red.shade900;
        colEmail_2 = Colors.red.shade900.withOpacity(0.5);
        colPass = Colors.red.shade50;
        colPass_1 = Colors.red.shade900;
        colPass_2 = Colors.red.shade900.withOpacity(0.5);
        if (mounted) {
          setState(() {
            errTxt = globals.warning8;
            colErrTxt = globals.red_1;
            WarningPopup(context, globals.warning8);
          });
        }
      } else {
        if (mounted) {
          setState(() {
            errTxt = globals.errorElse;
            colErrTxt = globals.red_1;
            ErrorPopup(context, globals.errorElse);
          });
        }
      }
    } catch (e) {
      print(e);
      if (mounted) {
        setState(() {
          errTxt = globals.errorException;
          colErrTxt = globals.red_1;
          ErrorPopup(context, globals.errorException);
        });
      }
    }
  }

  _back() {
    exit(0);
  }

  _nullLogin() {
    if (mounted) {
      setState(() {
        globals.clearLogin();

        errTxtEmail = '';
        errTxtPass = '';
        errTxt = '';
        colEmail = globals.blue; //email
        colEmail_1 = globals.blue_1;
        colEmail_2 = globals.blue_2;
        colPass = globals.blue; //password
        colPass_1 = globals.blue_1;
        colPass_2 = globals.blue_2;
      });
    }
  }

  _nullTextCode() {
    globals.sixCodeNb = null;
  }

// _checkIfIsRegist() async {
//   try {
//     var data = {
//       'version': globals.version,
//       'email': globals.emailLogin,
//     };
//
//     var res =
//         await CallApi().postData(data, 'Login/Control/(Control)Login.php');
//     print(res);
//     print(res.body);
//     //print("pppppp");
//     List<dynamic> body = json.decode(res.body);
//   }catch(e){
//
//   }
// }
}
