
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:gajoo/api/my_api.dart';
import 'package:gajoo/api/my_session.dart';
import 'package:gajoo/globals/globals.dart' as globals;
import 'package:gajoo/widgets/button/myButton.dart';
import 'package:gajoo/widgets/code/codeDialogForgetPass.dart';
import 'package:gajoo/widgets/other/errorAlertDialog.dart';
import 'package:gajoo/widgets/textInput/myErrorText.dart';
import 'package:gajoo/widgets/textInput/myTextInput.dart';

class ForgetPass extends StatefulWidget {
  const ForgetPass({Key? key}) : super(key: key);

  @override
  _ForgetPassState createState() => _ForgetPassState();
}

class _ForgetPassState extends State<ForgetPass> {

  String? _emailForgetPass;

  Color _colEmail = globals.blue; //email
  Color _colEmail_1 = globals.blue_1;
  Color _colEmail_2 = globals.blue_2;

  String _errEmailForget = ''; //email error
  Color _colErrEmailForget = globals.transparent;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async => _back(),
    child: Scaffold(
      backgroundColor: globals.whiteBlue,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.1),
          child: Center(
            child: Container(
              width: 500,
              height: 570,
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
                            context, '/Login', (route) => false);
                      },
                    ),
                  ),
                  Column(
                    children: [
                      const SizedBox(
                        height: 50,
                      ),
                      Image.asset(
                        'Assets/HomePage/logo.png',
                        height: 95,
                        width: 300,
                        fit: BoxFit.contain,
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text("Forget Password?",style: TextStyle(fontSize: 30),),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Enter your email to continue'),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
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
                              _emailForgetPass = value;
                            }),
                      ),

                      myErrorText(errorText: _errEmailForget, color: _colErrEmailForget),


                      Padding(
                        padding: const EdgeInsets.all(28.0),
                        child: InkWell(
                          child: btn(btnText: "Submit"),
                          onTap: () {
                            try {
                              _verifAcc();
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

  _verifAcc(){
    _errEmailForget = '';
    bool isEmpty = false;

    if (_emailForgetPass != null && _emailForgetPass != '') {
      setState(() {
        _colEmail = Colors.blue.shade50;
        _colEmail_1 = Colors.blue.shade900;
        _colEmail_2 = Colors.blue.shade900.withOpacity(0.5);
      });
    } else {
      isEmpty = true;
      setState(() {
        _colEmail = Colors.red.shade50;
        _colEmail_1 = Colors.red.shade900;
        _colEmail_2 = Colors.red.shade900.withOpacity(0.5);
        _errEmailForget = globals.warning7;
        _colErrEmailForget = globals.red_1;
      });
    }
    if (isEmpty == false) {
      _checkIsRegist();
    } else {
      //do nothing
    }

  }

  _checkIsRegist() async {
    _errEmailForget = '';
    try {
      var data = {
        'version': globals.version,
        'email': _emailForgetPass,
      };

      var res =
          await CallApi().postData(data, '/Login/Control/(Control)checkIfIsRegist.php');
      debugPrint(res.body);

      List<dynamic> body = json.decode(res.body);

      if (body[0] == "success") {
        showDialog(
            context: context,
            builder: (BuildContext context) => const CodeDialogForgetPass()).then((exit) {
          setState(() {
            //_nullTextCode();
          });
        });
      }else if(body[0] == "error7"){
        _colEmail = Colors.red.shade50;
        _colEmail_1 = Colors.red.shade900;
        _colEmail_2 = Colors.red.shade900.withOpacity(0.5);
        setState(() {
          _errEmailForget = globals.warning7;
          _colErrEmailForget = globals.red_1;
        });
      }else if(body[0] == "error11"){
        _colEmail = Colors.red.shade50;
        _colEmail_1 = Colors.red.shade900;
        _colEmail_2 = Colors.red.shade900.withOpacity(0.5);
        setState(() {
          _errEmailForget = globals.error11;
          _colErrEmailForget = globals.red_1;
        });
      }else if(body[0] == "error12"){
        _colEmail = Colors.red.shade50;
        _colEmail_1 = Colors.red.shade900;
        _colEmail_2 = Colors.red.shade900.withOpacity(0.5);
        setState(() {
          _errEmailForget = globals.error12;
          _colErrEmailForget = globals.red_1;
        });
      }
    }catch(e){
      debugPrint(e.toString());
      setState(() {
        _errEmailForget = globals.errorException;
        _colErrEmailForget = globals.red_1;
      });
    }
  }

  _back(){
    setState(() {
      _emailForgetPass = null;
    });

    _errEmailForget = '';
    _colErrEmailForget = globals.transparent;

    _colEmail = globals.blue; //email
    _colEmail_1 = globals.blue_1;
    _colEmail_2 = globals.blue_2;


    Navigator.pushNamedAndRemoveUntil(context, '/Login', (route) => false);
  }

}
