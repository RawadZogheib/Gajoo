

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gajoo/api/my_session.dart';
import 'package:gajoo/globals/globals.dart' as globals;
import 'package:gajoo/hexColor/hexColor.dart';
import 'package:gajoo/widgets/other/MyHeader.dart';
import 'package:gajoo/widgets/other/myDrawer.dart';
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

  @override
  void initState() {
    // TODO: implement initState
    _sessionGet();
    super.initState();
    globals.currentPage = "MySettings";


  }

  @override
  Widget build(BuildContext context) {
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
            child: Column(
                  children: [
                    const MyHeader(),
                    Image.asset('Assets/SettingsPage/books.jpg',width: MediaQuery.of(context).size.width *
                        1,height: MediaQuery.of(context).size.height *
                        0.5,),

                    Container(
                      width: MediaQuery.of(context).size.width * 1,
                      height: MediaQuery.of(context).size.height * 0.5,
                      color: globals.whiteBlue,

                      child: Column(
                        children: [
                          myTextInput2(
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
                            },
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          myTextInput2(
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
                            },
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Text('Email:'),
                          Text(Email),
                          const SizedBox(
                            height: 5,
                          ),
                          myTextInput2(
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
                            },
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                        ],
                      ),
                    ),

                  ],
                ),
          ),
        ),
    );
  }



  _sessionGet() async {
    FName = await SessionManager().get("fName");
    LName = await SessionManager().get("lName");
    Email = await SessionManager().get("email");
    UserName = await SessionManager().get("userName");
  }

  _back() {
    Navigator.pushNamedAndRemoveUntil(context, '/HomePage', (route) => false);
  }
}
