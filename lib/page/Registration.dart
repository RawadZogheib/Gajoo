
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:gajoo/api/my_api.dart';
import 'package:gajoo/globals/globals.dart' as globals;
import 'package:gajoo/widgets/PopUp/errorWarningPopup.dart';
import 'package:gajoo/widgets/button/myButton.dart';
import 'package:gajoo/widgets/Code/codeDialog.dart';
import 'package:gajoo/widgets/dateOfBirth/myDateOfBirth.dart';
import 'package:gajoo/widgets/PopUp/errorAlertDialog.dart';
import 'package:gajoo/widgets/radioButton/myRadioButton.dart';
import 'package:gajoo/widgets/textInput/myErrorText.dart';
import 'package:gajoo/widgets/textInput/myTextInput.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Registration extends StatefulWidget {
  const Registration({Key? key}) : super(key: key);

  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {

  //Regular Expressions
  final RegExp _passExp = RegExp(
      r"^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[*.!@#$%^&:,?_-]).{8,}$");
  final RegExp _exp = RegExp(r"^[a-zA-Z0-9_\.]*$", caseSensitive: false);
  final RegExp _mailExp =
  RegExp(r"[a-zA-Z0-9]+@(g|hot)mail.com$", caseSensitive: false);
  final RegExp _phoneExp = RegExp(
      r"(961|1|86|357|20|33|91|39)[0-9]{8}\b"); //lebanon, american or canada, china, cyprus, egypt, france, india, italy

  //Colors
  Color _colFName = globals.blue; //fname
  Color _colFName_1 = globals.blue_1;
  Color _colFName_2 = globals.blue_2;

  Color _colLName = globals.blue; //lname
  Color _colLName_1 = globals.blue_1;
  Color _colLName_2 = globals.blue_2;

  Color _colUserName = globals.blue; //username
  Color _colUserName_1 = globals.blue_1;
  Color _colUserName_2 = globals.blue_2;

  Color _colPass = globals.blue; //password
  Color _colPass_1 = globals.blue_1;
  Color _colPass_2 = globals.blue_2;

  Color _colRePass = globals.blue; //repassword
  Color _colRePass_1 = globals.blue_1;
  Color _colRePass_2 = globals.blue_2;

  Color _colPhoneNb = globals.blue; //phoneNumber
  Color _colPhoneNb_1 = globals.blue_1;
  Color _colPhoneNb_2 = globals.blue_2;

  Color _colEmail = globals.blue; //email
  Color _colEmail_1 = globals.blue_1;
  Color _colEmail_2 = globals.blue_2;

  Color _colRadioMale = globals.blue; // background color for gender button
  Color _colRadioMale_1 = globals.blue_1;
  Color _colRadioFem = globals.blue;
  Color _colRadioFem_1 = globals.blue_1;

  Color _colDateOfBirth = globals.blue; //dateOfBirth
  Color _colDateOfBirth_1 = globals.blue_1;
  Color _colDateOfBirth_2 = globals.blue_2;

  Color _colLanguages = globals.blue;
  Color _colLanguages_1 = globals.blue_1;
  Color _colLanguages_2 = globals.blue_2;

  Color _colCountry = globals.blue;
  Color _colCountry_1 = globals.blue_1;
  Color _colCountry_2 = globals.blue_2;


  //Error Texts And ColorErrorTexts
  String _errTxtFname = ''; // for error textFields
  Color _colErrTxtFname = globals.transparent;
  String _errTxtLname = ''; // for error textFields
  Color _colErrTxtLname = globals.transparent;
  String _errTxtUsr = ''; // for error textFields
  Color _colErrTxtUsr = globals.transparent;
  String _errTxtEmail = ''; // for error textFields
  Color _colErrTxtEmail = globals.transparent;
  String _errTxtPass = ''; // for error textFields
  Color _colErrTxtPass = globals.transparent;
  String _errTxtRepass = ''; // for error textFields
  Color _colErrTxtRepass = globals.transparent;
  String _errTxtPhone = ''; // for error textFields
  Color _colErrTxtPhone = globals.transparent;
  String _errTxtGender = '';//genderError
  Color _colErrTxtGender = globals.transparent;
  String _errTxtDate = ''; //date ErrorText
  Color _colErrTxtDate = globals.transparent;
  String _errTxt = '';
  Color _colErrTxt = globals.transparent;
  String _errTxtLang = '';
  Color _colErrTxtLang = globals.transparent;
  String _errTxtCountry = '';
  Color _colErrTxtCountry = globals.transparent;


  //Variables
  String? _email;
  String? _fName;
  String? _lName;
  String? _password;
  String? _repassword;
  String? _gender;
  String? _phoneNumber;
  String? _userName;
  final String? _isRegistered = '0'; // 0 -> false -> not registered


  String? _languages;
  String? _countries;


  final controllerLanguages = TextEditingController();
  final controllerCountries = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _clearRegist();
    _clearColor();
  }



  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => _back(),
      child: Scaffold(
        backgroundColor: globals.whiteBlue,
        body: SingleChildScrollView(
          child: Center(
            child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          'Assets/HomePage/logo.png',
                          height: 95,
                          width: 300,
                          fit: BoxFit.contain,
                        ),
                      ),

                      InkWell(
                        onTap: (){
                          Navigator.pushNamedAndRemoveUntil(
                              context, '/Login', (route) => false);
                        },
                        child: const Text(
                          "BACK",
                          style: TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.bold),
                        ),
                      ),

                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.all(28.0),
                    child: Text(
                      "Create Your Account",
                      style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * 0.3,
                              top: 8.0, right: 15.0, bottom: 8.0),
                          child: myTextInput(
                            textString: "First Name",
                            labelText: 'First Name',
                            colBlue: _colFName,
                            colBlue_1: _colFName_1,
                            colBlue_2: _colFName_2,
                            textInputAction: TextInputAction.next,
                            spaceAllowed: false,
                            obscure: false,
                            onChange: (value) {
                              _fName = value;
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.50,
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: 15.0, top: 8.0,
                              right: MediaQuery.of(context).size.width * 0.3,
                              bottom: 8.0),
                          child: myTextInput(
                            textString: "Last Name",
                            labelText: 'Last Name',
                            colBlue: _colLName,
                            colBlue_1: _colLName_1,
                            colBlue_2: _colLName_2,
                            textInputAction: TextInputAction.next,
                            spaceAllowed: true,
                            obscure: false,
                            onChange: (value) {
                              _lName = value;
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * 0.3,
                            bottom: 8.0,),
                        child: myErrorText(
                            errorText: _errTxtFname, color: _colErrTxtFname),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: 3.0,
                            bottom: 8.0,
                            right: MediaQuery.of(context).size.width * 0.3),
                        child: myErrorText(
                            errorText: _errTxtLname, color: _colErrTxtLname),
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.3,
                        top: 8.0,
                        right: MediaQuery.of(context).size.width * 0.3,
                        bottom: 8.0),
                    child: myTextInput(
                      textString: "UserName",
                      labelText: 'UserName',
                      colBlue: _colUserName,
                      colBlue_1: _colUserName_1,
                      colBlue_2: _colUserName_2,
                      textInputAction: TextInputAction.next,
                      spaceAllowed: false,
                      obscure: false,
                      onChange: (value) {
                        _userName = value;
                      },
                    ),
                  ),
                  myErrorText(errorText: _errTxtUsr, color: _colErrTxtUsr),

                  Padding(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.3,
                        top: 8.0,
                        right: MediaQuery.of(context).size.width * 0.3,
                        bottom: 8.0),
                    child: myTextInput(
                      textString: "Email Address",
                      labelText: 'Email Address',
                      colBlue: _colEmail,
                      colBlue_1: _colEmail_1,
                      colBlue_2: _colEmail_2,
                      textInputAction: TextInputAction.next,
                      spaceAllowed: false,
                      obscure: false,
                      onChange: (value) {
                        _email = value;
                      },
                    ),
                  ),
                  myErrorText(errorText: _errTxtEmail, color: _colErrTxtEmail),

                  Padding(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.3,
                        top: 8.0,
                        right: MediaQuery.of(context).size.width * 0.3,
                        bottom: 8.0),
                    child: myTextInput(
                      textString: "Password",
                      labelText: 'Password',
                      colBlue: _colPass,
                      colBlue_1: _colPass_1,
                      colBlue_2: _colPass_2,
                      maxLines: 1,
                      textInputAction: TextInputAction.next,
                      spaceAllowed: false,
                      obscure: true,
                      onChange: (value) {
                        _password = value;
                      },
                    ),
                  ),
                  myErrorText(errorText: _errTxtPass, color: _colErrTxtPass),

                  Padding(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.3,
                        top: 8.0,
                        right: MediaQuery.of(context).size.width * 0.3,
                        bottom: 8.0),
                    child: myTextInput(
                      textString: "ReEnterPassword",
                      labelText: 'ReEnterPassword',
                      colBlue: _colRePass,
                      colBlue_1: _colRePass_1,
                      colBlue_2: _colRePass_2,
                      maxLines: 1,
                      textInputAction: TextInputAction.next,
                      spaceAllowed: false,
                      obscure: true,
                      onChange: (value) {
                        _repassword = value;
                      },
                    ),
                  ),
                  myErrorText(errorText: _errTxtRepass, color: _colErrTxtRepass),
                  Padding(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.3,
                        top: 8.0,
                        right: MediaQuery.of(context).size.width * 0.3),
                    child: myTextInput(
                      textString: "Phone Number",
                      labelText: 'Phone Number',
                      keybType: const TextInputType.numberWithOptions(decimal: true),
                      colBlue: _colPhoneNb,
                      colBlue_1: _colPhoneNb_1,
                      colBlue_2: _colPhoneNb_2,
                      textInputAction: TextInputAction.done,
                      prefixText: "+",
                      spaceAllowed: false,
                      obscure: false,
                      onChange: (value) {
                        _phoneNumber = value;
                      },
                    ),
                  ),
                  myErrorText(errorText: _errTxtPhone, color: _colErrTxtPhone),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
                        child: myRadioButton(
                          text: ' Male ',
                          color: _colRadioMale,
                          color_1: _colRadioMale_1,
                          onPressed: () {
                            _gender = 'Male';
                            setState(() {
                              _colRadioMale = globals.blue_1;
                              _colRadioMale_1 = globals.blue;
                              _colRadioFem = globals.blue;
                              _colRadioFem_1 = globals.blue_1;
                            });

                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 8.0, left: 8.0, right: 8.0),
                        child: myRadioButton(
                          text: 'Female',
                          color: _colRadioFem,
                          color_1: _colRadioFem_1,
                          onPressed: () {
                            _gender = 'Female';
                            setState(() {
                              _colRadioFem = globals.blue_1;
                              _colRadioFem_1 = globals.blue;
                              _colRadioMale = globals.blue;
                              _colRadioMale_1 = globals.blue_1;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  myErrorText(errorText: _errTxtGender, color: _colErrTxtGender),

                  Padding(
                    padding:
                    EdgeInsets.only(top: 18.0,
                        left: MediaQuery.of(context).size.width * 0.3,
                        right: MediaQuery.of(context).size.width * 0.3),
                    child: const myDateOfBirth(),
                  ),
                  myErrorText(errorText: _errTxtDate, color: _colErrTxtDate),

                  Padding(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.3,
                        top: 8.0,
                        right: MediaQuery.of(context).size.width * 0.3),
                    child: Container(
                      child: languages(),
                    ),
                  ),

                  myErrorText(errorText: _errTxtLang, color: _colErrTxtLang),

                  Padding(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.3,
                        top: 8.0,
                        right: MediaQuery.of(context).size.width * 0.3),
                    child: Container(
                      child: countries(),
                    ),
                  ),

                  myErrorText(errorText: _errTxtCountry, color: _colErrTxtCountry),

                  Padding(
                    padding: const EdgeInsets.all(28.0),
                    child: InkWell(
                        child: btn(btnText: "Confirm"),
                        onTap: () {
                          _nullErr();
                        }),
                  ),

                  myErrorText(errorText: _errTxt, color: _colErrTxt),

                ],
            ),
          ),
        ),
      ),
    );
  }

  _nullErr() async {
    bool isEmpty = false;

    try {
      if (_fName != null && _fName != '') {
        setState(() {
          _colFName = globals.blue;
          _colFName_1 = globals.blue_1;
          _colFName_2 = globals.blue_2;
          _errTxtFname = '';
        });
        //color blue
        //text1.clear()
      } else {
        isEmpty = true;
        setState(() {
          _colErrTxtFname = globals.red_1;
          _colFName = globals.red;
          _colFName_1 = globals.red_1;
          _colFName_2 = globals.red_2;
          _errTxtFname = globals.warning7;
          WarningPopup(context, globals.warning7);
        });
        //color red
        //text1 = globals.error1;
      }

      if (_lName != null && _lName != '') {
        setState(() {
          _colLName = globals.blue;
          _colLName_1 = globals.blue_1;
          _colLName_2 = globals.blue_2;
          _errTxtLname = '';
        });
        //color blue
        // text2.clear()
      } else {
        isEmpty = true;
        setState(() {
          _colErrTxtLname = globals.red_1;
          _colLName = globals.red;
          _colLName_1 = globals.red_1;
          _colLName_2 = globals.red_2;
          _errTxtLname = globals.warning7;
          WarningPopup(context, globals.warning7);
        });
        //color red
        //text2 = globals.error1;
      }

      if (_userName != null && _userName != '') {
        setState(() {
          _colUserName = globals.blue;
          _colUserName_1 = globals.blue_1;
          _colUserName_2 = globals.blue_2;
          _errTxtUsr = '';
        });
      } else {
        isEmpty = true;
        setState(() {
          _colErrTxtUsr = globals.red_1;
          _colUserName = globals.red;
          _colUserName_1 = globals.red_1;
          _colUserName_2 = globals.red_2;
          _errTxtUsr = globals.warning7;
          WarningPopup(context, globals.warning7);
        });
      }

      if (_email != null && _email != '') {
        setState(() {
          _colEmail = globals.blue;
          _colEmail_1 = globals.blue_1;
          _colEmail_2 = globals.blue_2;
          _errTxtEmail = '';
        });
      } else {
        isEmpty = true;
        setState(() {
          _colErrTxtEmail = globals.red_1;
          _colEmail = globals.red;
          _colEmail_1 = globals.red_1;
          _colEmail_2 = globals.red_2;
          _errTxtEmail = globals.warning7;
          WarningPopup(context, globals.warning7);
        });
      }

      if (_password != null && _password != '') {
        setState(() {
          _colPass = globals.blue;
          _colPass_1 = globals.blue_1;
          _colPass_2 = globals.blue_2;
          _errTxtPass = '';
        });
      } else {
        isEmpty = true;
        setState(() {
          _colErrTxtPass = globals.red_1;
          _colPass = globals.red;
          _colPass_1 = globals.red_1;
          _colPass_2 = globals.red_2;
          _errTxtPass = globals.warning7;
          WarningPopup(context, globals.warning7);
        });
      }

      if (_repassword != null && _repassword != '') {
        setState(() {
          _colRePass = globals.blue;
          _colRePass_1 = globals.blue_1;
          _colRePass_2 = globals.blue_2;
          _errTxtRepass = '';
        });
      } else {
        isEmpty = true;
        setState(() {
          _colErrTxtRepass = globals.red_1;
          _colRePass = globals.red;
          _colRePass_1 = globals.red_1;
          _colRePass_2 = globals.red_2;
          _errTxtRepass = globals.warning7;
          WarningPopup(context,globals.warning7);
        });
      }

      if (_phoneNumber != null && _phoneNumber != '') {
        setState(() {
          _colPhoneNb = globals.blue;
          _colPhoneNb_1 = globals.blue_1;
          _colPhoneNb_2 = globals.blue_2;
          _errTxtPhone = '';
        });
      } else {
        isEmpty = true;
        setState(() {
          _colErrTxtPhone = globals.red_1;
          _colPhoneNb = globals.red;
          _colPhoneNb_1 = globals.red_1;
          _colPhoneNb_2 = globals.red_2;
          _errTxtPhone = globals.warning7;
          WarningPopup(context,globals.warning7);
        });
      }

      if (_gender != null && _gender != '') {
        setState(() {
          _errTxtGender = '';
        });
      } else {
        isEmpty = true;
        setState(() {
          _colErrTxtGender = globals.red_1;
          _colRadioMale = globals.red;
          _colRadioFem = globals.red;
          _colRadioMale_1 = globals.red_1;
          _colRadioFem_1 = globals.red_1;
          _errTxtGender = globals.warning7;
          WarningPopup(context, globals.warning7);
        });
      }

      if (globals.dateOfBirth != null && globals.dateOfBirth != '') {
        setState(() {
          _colErrTxtDate = globals.transparent;
          _colDateOfBirth = globals.blue;
          _colDateOfBirth_1 = globals.blue_1;
          _colDateOfBirth_2 = globals.blue_2;
        });
      } else {
        isEmpty = true;
        setState(() {
          _colErrTxtDate = globals.red_1;
          _colDateOfBirth = globals.red;
          _colDateOfBirth_1 = globals.red_1;
          _colDateOfBirth_2 = globals.red_2;
          _errTxtDate = globals.warning7;
        });
      }

      if (_languages != null && _languages != '') {
        setState(() {
          _colLanguages = globals.blue;
          _colLanguages_1 = globals.blue_1;
          _colLanguages_2 = globals.blue_2;
          _errTxtLang = '';
        });
      } else {
        isEmpty = true;
        setState(() {
          _colErrTxtLang = globals.red_1;
          _colLanguages = globals.red;
          _colLanguages_1 = globals.red_1;
          _colLanguages_2 = globals.red_2;
          _errTxtLang = globals.warning7;
          WarningPopup(context, globals.warning7);
        });
      }


      if (_countries != null && _countries != '') {
        setState(() {
          _colErrTxtCountry = globals.transparent;
          _colCountry = globals.blue;
          _colCountry_1 = globals.blue_1;
          _colCountry_2 = globals.blue_2;
        });
      } else {
        isEmpty = true;
        setState(() {
          _colErrTxtCountry = globals.red_1;
          _colCountry = globals.red;
          _colCountry_1 = globals.red_1;
          _colCountry_2 = globals.red_2;
          _errTxtCountry = globals.warning7;
          WarningPopup(context, globals.warning7);
        });
      }

      if (isEmpty == false) {
        if (!_mailExp.hasMatch(_email!)) {
          setState(() {
            _colEmail = globals.red;
            _colEmail_1 = globals.red_1;
            _colEmail_2 = globals.red_2;
            _colErrTxtEmail = globals.red_1;
            _errTxtEmail = globals.warning2_5;
            WarningPopup(context, globals.warning2_5);
          });
        } else if (_password!.length < 8) {
          setState(() {
            _colPass = globals.red;
            _colPass_1 = globals.red_1;
            _colPass_2 = globals.red_2;
            _colErrTxtPass = globals.red_1;
            _errTxtPass = globals.warning2_3;
            WarningPopup(context, globals.warning2_3);
          });
        } else if (!_passExp.hasMatch(_password!)) {
          setState(() {
            _colPass = globals.red;
            _colPass_1 = globals.red_1;
            _colPass_2 = globals.red_2;
            _colErrTxtPass = globals.red_1;
            _errTxtPass = globals.warning2_3;
            WarningPopup(context, globals.warning2_3);
          });
        } else if (_password != _repassword) {
          setState(() {
            _colRePass = globals.red;
            _colRePass_1 = globals.red_1;
            _colRePass_2 = globals.red_2;
            _colErrTxtRepass = globals.red_1;
            _errTxtRepass = globals.error3;
            ErrorPopup(context, globals.error3);
          });
        } else if (_userName!.contains(" ")) {
          setState(() {
            _colUserName = globals.red;
            _colUserName_1 = globals.red_1;
            _colUserName_2 = globals.red_2;
            _colErrTxtUsr = globals.red_1;
            _errTxtUsr = globals.warning1;
            WarningPopup(context, globals.warning1);
          });
        } else if (_userName!.length < 8) {
          setState(() {
            _colUserName = globals.red;
            _colUserName_1 = globals.red_1;
            _colUserName_2 = globals.red_2;
            _colErrTxtUsr = globals.red_1;
            _errTxtUsr = globals.warning2_1;
            WarningPopup(context, globals.warning2_1);
          });
        } else if (!_exp.hasMatch(_userName!)) {
          setState(() {
            _colUserName = globals.red;
            _colUserName_1 = globals.red_1;
            _colUserName_2 = globals.red_2;
            _colErrTxtUsr = globals.red_1;
            _errTxtUsr = globals.warning2_2;
            WarningPopup(context, globals.warning2_2);
          });
        } else if (!_phoneExp.hasMatch(_phoneNumber!)) {
          setState(() {
            _colPhoneNb = globals.red;
            _colPhoneNb_1 = globals.red_1;
            _colPhoneNb_2 = globals.red_2;
            _colErrTxtPhone = globals.red_1;
            _errTxtPhone = globals.error9;
            ErrorPopup(context, globals.error9);
          });
        } else {
          _reg(); // Calling the Function for Database
        }
      }
    } catch (e) {
      showDialog(
          context: context,
          builder: (BuildContext context) =>
              ErrorAlertDialog(message: globals.errorException));
    }
  }

  _reg() async {

    _errTxtFname = ''; // for error textFields
    _errTxtLname = ''; // for error textFields
    _errTxtUsr = ''; // for error textFields
    _errTxtEmail = ''; // for error textFields
    _errTxtPass = ''; // for error textFields
    _errTxtRepass = ''; // for error textFields
    _errTxtPhone = ''; // for error textFields
    _errTxtGender = ''; // for error textFields
    _errTxtDate = ''; // for error textFields
    _errTxt = '';   // for errorElse, errorVersion,...


    try {
      if (_email != null &&
          _fName != null &&
          _lName != null &&
          _userName != null &&
          _password != null &&
          _repassword != null &&
          globals.dateOfBirth != null &&
          _gender != null &&
          _phoneNumber != null) {
        var data = {
          'version': globals.version,
          'email': _email,
          'fname': _fName,
          'lname': _lName,
          'userName': _userName,
          'password': _password,
          'repassword': _repassword,
          'dateOfBirth': globals.dateOfBirth,
          'phoneNumber': _phoneNumber,
          'gender': _gender,
          'country': _countries,
          'language': _languages,
          'isRegistered' : _isRegistered,
        };

        var res = await CallApi()
            .postData(data, '/Registration/Control/(Control)registration.php');

        debugPrint(res.body);
        var body = json.decode(res.body);
        if (body[0] == "success") {

          SharedPreferences localStorage = await SharedPreferences.getInstance();
          localStorage.setString("Id", body[1][0]);
          localStorage.setString("email", body[1][1]);
          showDialog(
              context: context,
              builder: (BuildContext context) => const CodeDialog()).then((exit) {
            setState(() {
              _nullTextCode();
            });
          });

        } else if (body[0] == "error1") {
          setState(() {
            _colErrTxtUsr = globals.red_1;
            _colUserName = globals.red;
            _colUserName_1 = globals.red_1;
            _colUserName_2 = globals.red_2;
            _errTxtUsr = globals.warning1;
            WarningPopup(context, globals.warning1);
          });
        } else if (body[0] == "error2_1") {
          setState(() {
            _colErrTxtUsr = globals.red_1;
            _colUserName = globals.red;
            _colUserName_1 = globals.red_1;
            _colUserName_2 = globals.red_2;
            _errTxtUsr = globals.warning2_1;
            WarningPopup(context, globals.warning2_1);
          });
        } else if (body[0] == "error2_2") {
          setState(() {
            _colErrTxtUsr = globals.red_1;
            _colUserName = globals.red;
            _colUserName_1 = globals.red_1;
            _colUserName_2 = globals.red_2;
            _errTxtUsr = globals.warning2_2;
            WarningPopup(context, globals.warning2_2);
          });
        } else if (body[0] == "error2_3") {
          setState(() {
            _colPass = globals.red;
            _colPass_1 = globals.red_1;
            _colPass_2 = globals.red_2;
            _colErrTxtPass = globals.red_1;
            _errTxtPass = globals.warning2_3;
            WarningPopup(context, globals.warning2_3);
          });
        } else if (body[0] == "error2_5") {
          setState(() {
            _colEmail = globals.red;
            _colEmail_1 = globals.red_1;
            _colEmail_2 = globals.red_2;
            _colErrTxtEmail = globals.red_1;
            _errTxtEmail = globals.warning2_5;
            WarningPopup(context, globals.warning2_5);
          });
        } else if (body[0] == "error2_7") {
          setState(() {
            _colPhoneNb = globals.red;
            _colPhoneNb_1 = globals.red_1;
            _colPhoneNb_2 = globals.red_2;
            _colErrTxtPhone = globals.red_1;
            _errTxtPhone = globals.error2_7;
            ErrorPopup(context, globals.error2_7);
          });
        } else if (body[0] == "error3") {
          setState(() {
            _colRePass = globals.red;
            _colRePass_1 = globals.red_1;
            _colRePass_2 = globals.red_2;
            _colErrTxtRepass = globals.red_1;
            _errTxtRepass = globals.error3;
            ErrorPopup(context, globals.error3);
          });
        } else if (body[0] == "error4") {
          setState(() {
            _colErrTxt = globals.red_1;
            _errTxt = globals.error4;
            ErrorPopup(context, globals.error4);
          });
        } else if (body[0] == "error5") {
          setState(() {
            _colErrTxtUsr = globals.red_1;
            _colUserName = globals.red;
            _colUserName_1 = globals.red_1;
            _colUserName_2 = globals.red_2;
            _errTxtUsr = globals.warning5;
            WarningPopup(context, globals.warning5);
          });
        } else if (body[0] == "error6") {
          setState(() {
            _colErrTxtEmail = globals.red_1;
            _colEmail = globals.red;
            _colEmail_1 = globals.red_1;
            _colEmail_2 = globals.red_2;
            _errTxtEmail = globals.warning6;
            WarningPopup(context, globals.warning6);
          });
        } else if (body[0] == "error7") {
          setState(() {
            _colErrTxt = globals.red_1;
            _errTxt = globals.warning7;
            WarningPopup(context, globals.warning7);
          });
        } else if (body[0] == "errorVersion") {
          setState(() {
            _colErrTxt = globals.red_1;
            _errTxt = globals.errorVersion;
            ErrorPopup(context, globals.errorVersion);
          });
        } else {
          setState(() {
            _colErrTxt = globals.red_1;
            _errTxt = globals.errorElse;
            ErrorPopup(context, globals.errorElse);
          });
        }
      } else {
        setState(() {
          _colErrTxt = globals.red_1;
          _errTxt = 'No nulls allowed';
          ErrorPopup(context, _errTxt);
        });
      }
    } catch (e) {
      setState(() {
        _colErrTxt = globals.red_1;
        _errTxt = globals.errorException;
        ErrorPopup(context, globals.errorException);
      });
    }
  }


  _clearRegist(){
    _fName = null;
    _lName = null;
    _userName = null;
    _email = null;
    _password = null;
    _repassword = null;
    _phoneNumber = null;
    _gender = null;
    globals.dateOfBirth = null;
  }

  _back() {
    setState(() {
      _clearRegist();
    });

    Navigator.pushNamedAndRemoveUntil(context, '/Login', (route) => false);
  }


  _nullTextCode(){
    globals.sixCodeNb = null;
  }

  _clearColor() {

    _colFName = globals.blue; //fname
     _colFName_1 = globals.blue_1;
     _colFName_2 = globals.blue_2;

     _colLName = globals.blue; //lname
     _colLName_1 = globals.blue_1;
     _colLName_2 = globals.blue_2;

     _colUserName = globals.blue; //username
     _colUserName_1 = globals.blue_1;
     _colUserName_2 = globals.blue_2;

     _colPass = globals.blue; //password
     _colPass_1 = globals.blue_1;
     _colPass_2 = globals.blue_2;

     _colRePass = globals.blue; //repassword
     _colRePass_1 = globals.blue_1;
     _colRePass_2 = globals.blue_2;

     _colPhoneNb = globals.blue; //phoneNumber
     _colPhoneNb_1 = globals.blue_1;
     _colPhoneNb_2 = globals.blue_2;

     _colEmail = globals.blue; //email
     _colEmail_1 = globals.blue_1;
     _colEmail_2 = globals.blue_2;

     _colRadioMale = globals.blue; // background color for gender button
     _colRadioMale_1 = globals.blue_1;
     _colRadioFem = globals.blue;
     _colRadioFem_1 = globals.blue_1;

    colDateOfBirth = globals.blue;
    colDateOfBirth_1 = globals.blue_1;
    colDateOfBirth_2 = globals.blue_2;

     _errTxtFname = ''; // for error textFields
     _colErrTxtFname = globals.transparent;
     _errTxtLname = ''; // for error textFields
     _colErrTxtLname = globals.transparent;
     _errTxtUsr = ''; // for error textFields
     _colErrTxtUsr = globals.transparent;
     _errTxtEmail = ''; // for error textFields
     _colErrTxtEmail = globals.transparent;
     _errTxtPass = ''; // for error textFields
     _colErrTxtPass = globals.transparent;
     _errTxtRepass = ''; // for error textFields
     _colErrTxtRepass = globals.transparent;
     _errTxtPhone = ''; // for error textFields
     _colErrTxtPhone = globals.transparent;
     _errTxtGender = '';//genderError
     _colErrTxtGender = globals.transparent;
     _errTxtDate = ''; //date ErrorText
     _colErrTxtDate = globals.transparent;
     _errTxt = '';
     _colErrTxt = globals.transparent;
  }



  Widget languages() => TypeAheadFormField<dynamic>(
    textFieldConfiguration: TextFieldConfiguration(
      autofocus: true,
      onEditingComplete: (){},
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: _colLanguages),
            borderRadius: BorderRadius.circular(10)),
        filled: true,
        fillColor: _colLanguages,
        hintText: "choose your language",
        hintStyle: TextStyle(
          fontSize: 15.0,
          color: _colLanguages_1,
        ),
        border: InputBorder.none,
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: _colLanguages_1)),
      ),
      controller: controllerLanguages,
    ),
    suggestionsCallback: LanguageData.getSuggestions,
    itemBuilder: (context, dynamic suggestion) => ListTile(
      title: Text(suggestion!,style: TextStyle(color: _colLanguages_1),),
    ),
    onSuggestionSelected: (dynamic suggestion) {
      controllerLanguages.text = suggestion!;
      _languages = controllerLanguages.text;
    },
  );



  Widget countries() => TypeAheadFormField<dynamic>(
    textFieldConfiguration: TextFieldConfiguration(
      autofocus: true,
      onEditingComplete: (){},
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: _colCountry),
            borderRadius: BorderRadius.circular(10)),
        filled: true,
        fillColor: _colCountry,
        hintText: "Choose your Country",
        hintStyle: TextStyle(
          fontSize: 15.0,
          color: _colCountry_1,
        ),
        border: InputBorder.none,
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: _colCountry_1)),
      ),
      controller: controllerCountries,
    ),
    suggestionsCallback: CountryData.getSuggestions,
    itemBuilder: (context, dynamic suggestion) => ListTile(
      title: Text(suggestion!,style: TextStyle(color: _colCountry_1),),
    ),
    onSuggestionSelected: (dynamic suggestion) {
      controllerCountries.text = suggestion!;
      _countries = suggestion!;
    },
  );

}

class LanguageData {


  static List getSuggestions(String query) =>
      List.of(globals.Languages).where((language){

        final languageLower = language.toLowerCase();
        final queryLower = query.toLowerCase();
        return languageLower.contains(queryLower);


      }).toList();

}


class CountryData {


  static List getSuggestions(String query) =>
      List.of(globals.Countries).where((country){

        final countryLower = country.toLowerCase();
        final queryLower = query.toLowerCase();
        return countryLower.contains(queryLower);


      }).toList();

}