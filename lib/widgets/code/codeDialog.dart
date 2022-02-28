
import 'package:flutter/material.dart';
import 'package:gajoo/widgets/code/sixCode.dart';
import 'package:sizer/sizer.dart';

class codeDialog extends StatefulWidget {
  const codeDialog({Key? key}) : super(key: key);

  @override
  _codeDialogState createState() => _codeDialogState();
}

class _codeDialogState extends State<codeDialog> {
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
      sixCode(),
    ]
    ),
    ),
    );
  }
}
