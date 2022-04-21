
import 'dart:convert';
import 'dart:io';
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

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  String? _emailLogin;
  String? _passwordLogin;

  Color _colEmail = globals.blue; //email
  Color _colEmail_1 = globals.blue_1;
  Color _colEmail_2 = globals.blue_2;

  Color _colPass = globals.blue; //password
  Color _colPass_1 = globals.blue_1;
  Color _colPass_2 = globals.blue_2;

  String _errTxtEmail = ''; //email error
  Color _colErrTxtEmail = globals.transparent;
  String _errTxtPass = ''; //password error
  Color _colErrTxtPass = globals.transparent;
  String _errTxt = ''; //else error
  Color _colErrTxt = globals.transparent;

  var _oneClick = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //_oneClick = 0;
    _clearLogin();
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
                            style: TextStyle(
                                fontSize: 40.0, color: Colors.black),
                          ),
                        ),
                        Padding(
                            padding: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width * 0.05,
                                top: 18.0,
                                right: MediaQuery.of(context).size.width * 0.05,
                                bottom: 8.0),
                            child: SizedBox(
                              width: 400,
                              height: 55,
                              child: myTextInput(
                                  textString: "Enter Your Email Address",
                                  labelText: 'Enter Your Email Address',
                                  colBlue: _colEmail,
                                  colBlue_1: _colEmail_1,
                                  colBlue_2: _colEmail_2,
                                  textInputAction: TextInputAction.next,
                                  spaceAllowed: false,
                                  obscure: false,
                                  onChange: (value) {
                                    _emailLogin = value;
                                  }),
                            )),
                        myErrorText(
                            errorText: _errTxtEmail, color: _colErrTxtEmail),
                        Padding(
                          padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * 0.05,
                              top: 8.0,
                              right: MediaQuery.of(context).size.width * 0.05,
                              bottom: 8.0),
                          child: SizedBox(
                            width: 500,
                            height: 50,
                            child: myTextInput(
                              textString: "Enter Your Password",
                              labelText: 'Enter Your Password',
                              colBlue: _colPass,
                              colBlue_1: _colPass_1,
                              colBlue_2: _colPass_2,
                              maxLines: 1,
                              textInputAction: TextInputAction.none,
                              spaceAllowed: false,
                              obscure: true,
                              onChange: (value) {
                                _passwordLogin = value;
                                //print(globals.Login);
                              },
                            ),
                          ),
                        ),
                        myErrorText(
                            errorText: _errTxtPass, color: _colErrTxtPass),
                        Padding(
                          padding: const EdgeInsets.all(28.0),
                          child: InkWell(
                            child: btn(btnText: "Submit"),
                            onTap: () {
                              try {
                                if (_oneClick == 0) {
                                  _loginCtrl();
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
                        myErrorText(errorText: _errTxt, color: _colErrTxt),
                        Padding(
                          padding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height * 0.001),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(18.0),
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
                                padding: const EdgeInsets.all(18.0),
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

  _loginCtrl() async {
    _oneClick = 1;
    bool isEmpty = false;

    _errTxtEmail = '';
    _colErrTxtEmail = globals.transparent;
    _errTxtPass = '';
    _colErrTxtPass = globals.transparent;
    _errTxt = '';
    _colErrTxt = globals.transparent;

    if (_emailLogin != null && _emailLogin != '') {
      if (mounted) {
        setState(() {
          _colEmail = Colors.blue.shade50;
          _colEmail_1 = Colors.blue.shade900;
          _colEmail_2 = Colors.blue.shade900.withOpacity(0.5);
        });
      }
    } else {
      isEmpty = true;
      if (mounted) {
        setState(() {
          _colEmail = Colors.red.shade50;
          _colEmail_1 = Colors.red.shade900;
          _colEmail_2 = Colors.red.shade900.withOpacity(0.5);
          _errTxtEmail = globals.warning7;
          _colErrTxtEmail = globals.red_1;
          WarningPopup(context, globals.warning7);
        });
      }
    }

    if (_passwordLogin != null && _passwordLogin != '') {
      if (mounted) {
        setState(() {
          _colPass = Colors.blue.shade50;
          _colPass_1 = Colors.blue.shade900;
          _colPass_2 = Colors.blue.shade900.withOpacity(0.5);
        });
      }
    } else {
      isEmpty = true;
      if (mounted) {
        setState(() {
          _colPass = Colors.red.shade50;
          _colPass_1 = Colors.red.shade900;
          _colPass_2 = Colors.red.shade900.withOpacity(0.5);
          _errTxtPass = globals.warning7;
          _colErrTxtPass = globals.red_1;
          WarningPopup(context, globals.warning7);
        });
      }
    }

    if (isEmpty == false) {
      await _verifc();
    } else {
      //do nothing
    }
    _oneClick = 0;
  }

  _verifc() async {
    _errTxt = '';

    try {
      var data = {
        'version': globals.version,
        'email': _emailLogin,
        'password': _passwordLogin,
      };

      var res =
          await CallApi().postData(data, '/Login/Control/(Control)Login.php');
      debugPrint(res.body);
      List<dynamic> body = json.decode(res.body);

      if (body[0] == "success") {


        if(body[1]== "1") {
          SessionManager session = SessionManager();
          await session.set('token', body[2]);
          await session.set('Id', body[3][0]);
          await session.set('fName', body[3][1]);
          await session.set('lName', body[3][2]);
          await session.set('userName', body[3][3]);
          await session.set('email', _emailLogin);
          await session.set('password', _passwordLogin);
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
      } else if (body[0] == "errorVersion") {
        if (mounted) {
          setState(() {
            _errTxt = "Your version: " +
                globals.version +
                "\n" +
                globals.errorVersion;
            _colErrTxt = globals.red_1;
            ErrorPopup(context, globals.errorVersion);
          });
        }
      } else if (body[0] == "error8") {
        _colEmail = Colors.red.shade50;
        _colEmail_1 = Colors.red.shade900;
        _colEmail_2 = Colors.red.shade900.withOpacity(0.5);
        _colPass = Colors.red.shade50;
        _colPass_1 = Colors.red.shade900;
        _colPass_2 = Colors.red.shade900.withOpacity(0.5);
        if (mounted) {
          setState(() {
            _errTxt = globals.warning8;
            _colErrTxt = globals.red_1;
            WarningPopup(context, globals.warning8);
          });
        }
      } else {
        if (mounted) {
          setState(() {
            _errTxt = globals.errorElse;
            _colErrTxt = globals.red_1;
            ErrorPopup(context, globals.errorElse);
          });
        }
      }
    } catch (e) {
      debugPrint(e.toString());
      if (mounted) {
        setState(() {
          _errTxt = globals.errorException;
          _colErrTxt = globals.red_1;
          ErrorPopup(context, globals.errorException);
        });
      }
    }
  }

  _back() {
    exit(0);
  }

  _clearLogin(){
    _emailLogin = null;
    _passwordLogin = null;
  }

  _nullLogin() {
    if (mounted) {
      setState(() {
        _clearLogin();

        _errTxtEmail = '';
        _errTxtPass = '';
        _errTxt = '';
        _colEmail = globals.blue; //email
        _colEmail_1 = globals.blue_1;
        _colEmail_2 = globals.blue_2;
        _colPass = globals.blue; //password
        _colPass_1 = globals.blue_1;
        _colPass_2 = globals.blue_2;
      });
    }
  }

  _nullTextCode() {
    globals.sixCodeNb = null;
  }
}
