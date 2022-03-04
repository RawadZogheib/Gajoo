import 'package:flutter/material.dart';
import 'package:gajoo/widgets/CalenderPage/CalenderHours.dart';
import 'package:gajoo/widgets/other/MyCustomScrollBehavior.dart';
import 'package:gajoo/globals/globals.dart' as globals;
import 'package:intl/intl.dart';

class AlertDialogCalender extends StatefulWidget {
  Color color;
  DateTime date;

  AlertDialogCalender({required this.color, required this.date});

  @override
  State<AlertDialogCalender> createState() => _AlertDialogCalenderState();
}

class _AlertDialogCalenderState extends State<AlertDialogCalender> {
  List<CalenderHours> _availableTime = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for (int i = 0; i < 10; i++) {
      _availableTime.add(
        CalenderHours(
          fromTime: DateFormat('HH:mm').format(
            DateFormat('HH:mm').parse('18:20'),
          ),
          toTime: DateFormat('HH:mm').format(
            DateFormat('HH:mm').parse('19:20'),
          ),
          color1: Colors.green,
          color2: Colors.white,
          onTap: (){print('ssa');},
        ),
      );
      _availableTime.add(
        CalenderHours(
          fromTime: DateFormat('HH:mm').format(
            DateFormat('HH:mm').parse('18:20'),
          ),
          toTime: DateFormat('HH:mm').format(
            DateFormat('HH:mm').parse('19:20'),
          ),
          color1: Colors.red,
          color2: Colors.red.shade900.withOpacity(0.8),
          onTap: null,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(32.0),
          topRight: Radius.circular(32.0),
          bottomLeft: Radius.circular(32.0),
          bottomRight: Radius.circular(32.0),
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
      content: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(32.0),
          topRight: Radius.circular(32.0),
          bottomLeft: Radius.circular(32.0),
          bottomRight: Radius.circular(32.0),
        ),
        child: Container(
          height: 300, //300
          width: 400,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(32.0),
              topRight: Radius.circular(32.0),
              bottomLeft: Radius.circular(32.0),
              bottomRight: Radius.circular(32.0),
            ),
          ),
          child: ScrollConfiguration(
            behavior: MyCustomScrollBehavior(),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8.0,12.0,8.0,12.0),
              child: ListView.builder(
                itemCount: _availableTime.length,
                controller: ScrollController(),
                itemBuilder: (context, index) {
                  return _availableTime[index];
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
