
import 'package:flutter/material.dart';
import 'package:gajoo/widgets/code/sixCodeLogin.dart';

class CodeDialogLogin extends StatefulWidget {
  const CodeDialogLogin({Key? key}) : super(key: key);

  @override
  _CodeDialogLoginState createState() => _CodeDialogLoginState();
}

class _CodeDialogLoginState extends State<CodeDialogLogin> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.5)),
      content: SizedBox(
        height: 300, //300
        width: 400, //400
        child: ListView(padding: const EdgeInsets.all(8.0), children: const [
          SixCodeLogin(),
        ]),
      ),
    );
  }
}
