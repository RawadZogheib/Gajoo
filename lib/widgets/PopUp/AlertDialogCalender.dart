import 'package:flutter/material.dart';

class AlertDialogCalender extends StatelessWidget {
  String date;

  AlertDialogCalender({required this.date});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.5)),
      backgroundColor: Colors.white,
      contentPadding:
          const EdgeInsets.only(left: 0.0, right: 0.0, bottom: 0.0, top: 30),
      title: Center(
        child: Text(date,
            style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20)),
      ),
      content: Container(),
    );
  }
}
