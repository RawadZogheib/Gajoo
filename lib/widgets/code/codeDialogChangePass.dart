
import 'package:flutter/material.dart';
import 'package:gajoo/widgets/code/changePassword.dart';
import 'package:gajoo/widgets/code/sixCode.dart';
import 'package:gajoo/widgets/code/sixCodeForgetPass.dart';
import 'package:gajoo/widgets/code/sixCodeLogin.dart';
import 'package:sizer/sizer.dart';

class codeDialogChangePass extends StatefulWidget {
  const codeDialogChangePass({Key? key}) : super(key: key);

  @override
  _codeDialogChangePassState createState() => _codeDialogChangePassState();
}

class _codeDialogChangePassState extends State<codeDialogChangePass> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.5)),
      content: Container(
        height: 300, //300
        width: 400, //400
        child: ListView(
            padding: EdgeInsets.all(8.0),
            children: [
              changePassword(),
            ]
        ),
      ),
    );
  }
}
