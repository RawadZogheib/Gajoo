import 'package:flutter/material.dart';
import 'package:gajoo/widgets/code/sixCode.dart';

class CodeDialog extends StatefulWidget {
  const CodeDialog({Key? key}) : super(key: key);

  @override
  _CodeDialogState createState() => _CodeDialogState();
}

class _CodeDialogState extends State<CodeDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.5)),
      content: SizedBox(
        height: 300, //300
        width: 400, //400
        child: ListView(padding: const EdgeInsets.all(8.0), children: const [
          SixCode(),
        ]),
      ),
    );
  }
}