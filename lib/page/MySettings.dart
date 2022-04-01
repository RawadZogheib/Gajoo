import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gajoo/api/my_api.dart';
import 'package:gajoo/api/my_session.dart';
import 'package:gajoo/globals/globals.dart' as globals;
import 'package:gajoo/hexColor/hexColor.dart';
import 'package:gajoo/widgets/PopUp/errorWarningPopup.dart';
import 'package:gajoo/widgets/button/myButton.dart';
import 'package:gajoo/widgets/code/codeDialogChangePass.dart';
import 'package:gajoo/widgets/other/MyHeader.dart';
import 'package:gajoo/widgets/other/myDrawer.dart';
import 'package:gajoo/widgets/textInput/myErrorText.dart';
import 'package:gajoo/widgets/textInput/myTextInput.dart';

class MySettings extends StatefulWidget {
  const MySettings({Key? key}) : super(key: key);

  @override
  _MySettingsState createState() => _MySettingsState();
}

class _MySettingsState extends State<MySettings> {
  String FName = '';
  String LName = '';
  String UserName = '';
  String Email = '';
  String errTxt = '';
  Color colErrTxt = globals.transparent;

  String errFName = '';
  Color colErrFName = globals.transparent;
  String errLName = '';
  Color colErrLName = globals.transparent;
  String errUserName = '';
  Color colErrUserName = globals.transparent;

  Color colFName = globals.blue;
  Color colFName_1 = globals.blue_1;
  Color colFName_2 = globals.blue_2;
  Color colLName = globals.blue;
  Color colLName_1 = globals.blue_1;
  Color colLName_2 = globals.blue_2;
  Color colUserName = globals.blue;
  Color colUserName_1 = globals.blue_1;
  Color colUserName_2 = globals.blue_2;

  bool _isgreen = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    globals.currentPage = "MySettings";
    _sessionGet();
    //_checkColor();
  }

  @override
  Widget build(BuildContext context) {
    //print("michel");
    return WillPopScope(
      onWillPop: () async => _back(),
      child: Scaffold(
        backgroundColor: globals.whiteBlue,
        appBar: MediaQuery.of(context).size.width < 650
            ? AppBar(
                backgroundColor: globals.whiteBlue,
                elevation: 0,
                title: Center(
                  child: Text(
                    'Gajoo',
                    style: TextStyle(
                      fontSize: 28,
                      color: HexColor('#333333'),
                    ),
                  ),
                ),
                leading: IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: HexColor('#333333'),
                    ),
                    onPressed: () {
                      _back();
                    }),
              )
            : null,
        endDrawer: myDrawer(),
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                children: [
                  const MyHeader(),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.48,
                    height: MediaQuery.of(context).size.height * 0.415,
                    color: globals.whiteBlue,
                    child: Image.asset('Assets/SettingsPage/books.jpg'),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.478,
                    height: MediaQuery.of(context).size.height * 0.9,
                    color: Colors.white70,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 60,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              right: MediaQuery.of(context).size.width * 0.3,
                              top: 30),
                          child: myTextInput2(
                            initialValue: FName,
                            textString: 'Enter your First Name',
                            labelText: 'Enter your First Name',
                            spaceAllowed: true,
                            enterAllowed: false,
                            obscure: false,
                            colBlue: colFName,
                            colBlue_1: colFName_1,
                            colBlue_2: colFName_2,
                            onChange: (value) {
                              FName = value;
                              _checkColor();
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        myErrorText(errorText: errFName, color: colErrFName),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              right: MediaQuery.of(context).size.width * 0.3),
                          child: myTextInput2(
                            initialValue: LName,
                            textString: 'Enter your Last Name',
                            labelText: 'Enter your Last Name',
                            spaceAllowed: true,
                            enterAllowed: false,
                            obscure: false,
                            colBlue: colLName,
                            colBlue_1: colLName_1,
                            colBlue_2: colLName_2,
                            onChange: (value) {
                              LName = value;
                              _checkColor();
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        myErrorText(errorText: errLName, color: colErrLName),

                        Padding(
                          padding: EdgeInsets.only(
                              right: MediaQuery.of(context).size.width * 0.3),
                          child: myTextInput2(
                            initialValue: UserName,
                            textString: 'Enter your UserName',
                            labelText: 'Enter your UserName',
                            spaceAllowed: true,
                            enterAllowed: false,
                            obscure: false,
                            colBlue: colUserName,
                            colBlue_1: colUserName_1,
                            colBlue_2: colUserName_2,
                            onChange: (value) {
                              UserName = value;
                              _checkColor();
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        myErrorText(
                            errorText: errUserName, color: colErrUserName),
                        const SizedBox(
                          height: 10,
                        ),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: _isgreen == true ? Colors.green : Colors.grey,
                            ),
                            onPressed: (){
                              _isgreen == true ? _check() : null;
                            },
                            child: Text("Confirm Changes",
                              style: TextStyle(
                                color: _isgreen == true ? Colors.green.shade200 : Colors.grey.shade200,
                              ),
                            ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        myErrorText(errorText: errTxt, color: colErrTxt),

                        const SizedBox(
                          height: 10,
                        ),
                        const Divider(color: Colors.black,),
                        const SizedBox(
                          height: 40,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              right: MediaQuery.of(context).size.width * 0.215),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.25,
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.0),
                              color: globals.blue,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Text(
                                    'Email:',
                                    style: TextStyle(color: globals.blue_1),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Text(Email,
                                      style: TextStyle(color: globals.blue_2)),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 35,
                        ),
                        const Divider(color: Colors.black,),
                        const SizedBox(
                          height: 40,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.2,
                                height: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12.0),
                                  color: globals.blue,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Text(
                                        'Password:',
                                        style: TextStyle(color: globals.blue_1),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Text("*************",
                                          style: TextStyle(color: globals.blue_2)),
                                    ),
                                  ],
                                ),
                              ),
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.green,
                                  ),
                                  onPressed: (){
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) => const codeDialogChangePass())
                                        .then((exit) {
                                      if (mounted) {
                                        setState(() {
                                          //_nullTextCode();
                                        });
                                      }
                                    });
                                  },
                                  child: const Text("Change Password",
                                    style: TextStyle(color: Colors.white70),))
                            ],
                          ),
                        ),

                      ],
                    ),
                  ),
                ],
              ),
              Positioned(
                  left: MediaQuery.of(context).size.width * 0.435,
                  top: MediaQuery.of(context).size.height * 0.42,
                  child: const Icon(
                    Icons.account_circle_rounded,
                    size: 200,
                    color: Colors.blueGrey,
                  )),
            ],
          ),
        ),
      ),
    );
  }

  _check() async {
    bool isEmpty = false;

    errFName = '';
    colErrFName = globals.transparent;
    errLName = '';
    colErrLName = globals.transparent;
    errUserName = '';
    colErrUserName = globals.transparent;

    print(FName);
    print(LName);
    print(UserName);

    if (FName != '' && FName != null && FName != 'null') {
      setState(() {
        colFName = globals.blue;
        colFName_1 = globals.blue_1;
        colFName_2 = globals.blue_2;
      });
    } else {
      isEmpty = true;
      setState(() {
        colFName = Colors.red.shade50;
        colFName_1 = Colors.red.shade900;
        colFName_2 = Colors.red.shade900.withOpacity(0.5);
        errFName = globals.warning7;
        colErrFName = globals.red_1;
      });
    }

    if (LName != '' && LName != null && LName != 'null') {
      setState(() {
        colLName = globals.blue;
        colLName_1 = globals.blue_1;
        colLName_2 = globals.blue_2;
      });
    } else {
      isEmpty = true;
      setState(() {
        colLName = Colors.red.shade50;
        colLName_1 = Colors.red.shade900;
        colLName_2 = Colors.red.shade900.withOpacity(0.5);
        errLName = globals.warning7;
        colErrLName = globals.red_1;
      });
    }

    if (UserName != '' && UserName != null && UserName != 'null') {
      setState(() {
        colUserName = globals.blue;
        colUserName_1 = globals.blue_1;
        colUserName_2 = globals.blue_2;
      });
    } else {
      isEmpty = true;
      setState(() {
        colUserName = Colors.red.shade50;
        colUserName_1 = Colors.red.shade900;
        colUserName_2 = Colors.red.shade900.withOpacity(0.5);
        errUserName = globals.warning7;
        colErrUserName = globals.red_1;
      });
    }
    if (UserName.length > 8) {
      setState(() {
        colUserName = globals.blue;
        colUserName_1 = globals.blue_1;
        colUserName_2 = globals.blue_2;
      });
    } else {
      isEmpty = true;
      setState(() {
        colUserName = Colors.red.shade50;
        colUserName_1 = Colors.red.shade900;
        colUserName_2 = Colors.red.shade900.withOpacity(0.5);
        errUserName = globals.warning2_1;
        colErrUserName = globals.red_1;
      });
    }

    if (isEmpty == false) {
        _changeDb();
    }

  }

  _changeDb() async {
    errTxt = '';

    try {
      var data = {
        'version': globals.version,
        'account_Id': await SessionManager().get("Id"),
        'fname': FName,
        'lname': LName,
        'username': UserName,
      };

      var res = await CallApi()
          .postData(data, '/Settings/Control/(Control)ChangeData.php');
      print(res.body);
      List<dynamic> body = json.decode(res.body);

      //print(body[1]);
      //print("welcome");
      //print(body[0]);
      if (body[0] == "success") {
        await SessionManager().set('fName', FName);
        await SessionManager().set('lName', LName);
        await SessionManager().set('userName', UserName);
        _sessionGet();
        _checkColor();

      } else if (body[0] == "errorToken") {
        if (mounted) {
          setState(() {
            errTxt = globals.errorToken;
            colErrTxt = globals.red_1;
            ErrorPopup(context, globals.errorToken);
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
            ErrorPopup(context, globals.errorVersion);
          });
        }
      } else if (body[0] == "error7") {
        setState(() {
          colErrTxt = globals.red_1;
          errTxt = globals.warning7;
          WarningPopup(context, globals.warning7);
        });
      } else if (body[0] == "error4") {
        setState(() {
          colErrTxt = globals.red_1;
          errTxt = globals.error4;
          WarningPopup(context, globals.error4);
        });
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

  _sessionGet() async {
    FName = await SessionManager().get("fName");
    LName = await SessionManager().get("lName");
    Email = (await SessionManager().get("email")).toString();
    UserName = await SessionManager().get("userName");
    if (FName == null || FName == '' || FName == 'null') {
      //do nothing
    } else {
      setState(() {
        FName;
      });
    }
    if (LName == null || LName == '' || LName == 'null') {
      //do nothing
    } else {
      setState(() {
        LName;
      });
    }
    if (Email == null || Email == '' || Email == 'null') {
      //do nothing
    } else {
      setState(() {
        Email;
      });
    }
    if (UserName == null || UserName == '' || UserName == 'null') {
      //do nothing
    } else {
      setState(() {
        UserName;
      });
    }
  }


  _checkColor() async {
    if (FName !=  await SessionManager().get("fName") ||
        LName !=  await SessionManager().get("lName") ||
        UserName !=  await SessionManager().get("userName")){
      //make  green
      if (_isgreen == false){
        setState(() {
          _isgreen = true;
        });
      }
    }else{
    //make  grey
      if (_isgreen == true){
        setState(() {
          _isgreen = false;
        });
      }
    }
  }

  _back() {
    Navigator.pushNamedAndRemoveUntil(context, '/HomePage', (route) => false);
  }
}
