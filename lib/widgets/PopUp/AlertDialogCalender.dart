import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AlertDialogCalender extends StatefulWidget {
  Color color;
  DateTime date;

  AlertDialogCalender({required this.color, required this.date});

  @override
  State<AlertDialogCalender> createState() => _AlertDialogCalenderState();
}

class _AlertDialogCalenderState extends State<AlertDialogCalender> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(32.0),
          topRight: Radius.circular(32.0),
          bottomLeft: Radius.circular(22.0),
          bottomRight: Radius.circular(22.0),
        ),
      ),
      backgroundColor: widget.color,
      contentPadding:
          const EdgeInsets.only(left: 0.0, right: 0.0, bottom: 0.0, top: 30),
      title: Center(
        child: Text(DateFormat('yyyy-MM-dd').format(widget.date),
            style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20)),
      ),
      content: Container(
        height: 300, //300
        width: 400,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32.0),
            topRight: Radius.circular(32.0),
            bottomLeft: Radius.circular(22.0),
            bottomRight: Radius.circular(22.0),
          ),
        ),
      ),
    );
  }
}
