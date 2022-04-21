
import 'package:flutter/material.dart';
import 'package:gajoo/widgets/code/sixCodeForgetPass.dart';

class CodeDialogForgetPass extends StatefulWidget {
  const CodeDialogForgetPass({Key? key}) : super(key: key);

  @override
  _CodeDialogForgetPassState createState() => _CodeDialogForgetPassState();
}

class _CodeDialogForgetPassState extends State<CodeDialogForgetPass> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.5)),
      content: SizedBox(
        height: 300, //300
        width: 400, //400
        child: ListView(
            padding: const EdgeInsets.all(8.0),
            children: const [
              SixCodeForgetPass(),
            ]
        ),
      ),
    );
  }
}
