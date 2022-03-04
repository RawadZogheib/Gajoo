import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AlertDialogCalender extends StatelessWidget {
  Color color;
  DateTime date;

  AlertDialogCalender({required this.color, required this.date});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.5)),
      backgroundColor: Colors.white,
      contentPadding:
          const EdgeInsets.only(left: 0.0, right: 0.0, bottom: 0.0, top: 30),
      title: Center(
        child: Text(DateFormat('yyyy-MM-dd').format(date),
            style: TextStyle(
                color: color,
                fontWeight: FontWeight.bold,
                fontSize: 20)),
      ),
      content: Container(
        height: 300, //300
        width: 400,
      ),
    );
  }
}
