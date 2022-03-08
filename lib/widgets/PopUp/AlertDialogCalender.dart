import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gajoo/widgets/CalenderPage/CalenderHours.dart';
import 'package:gajoo/widgets/other/MyCustomScrollBehavior.dart';
import 'package:intl/intl.dart';

class AlertDialogCalender extends StatefulWidget {
  Color color;
  DateTime date;

  AlertDialogCalender({required this.color, required this.date});

  @override
  State<AlertDialogCalender> createState() => _AlertDialogCalenderState();
}

class _AlertDialogCalenderState extends State<AlertDialogCalender> {
  Timer? _timer;
  List<CalenderHours> _availableTime = [];

  @override
  void initState() {
    // TODO: implement initState
    _loadNewPage();
    super.initState();
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
              padding: const EdgeInsets.fromLTRB(8.0, 12.0, 8.0, 12.0),
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

  _loadNewPage() {
    print(
        '=========>>======================================================>>==================================================>>=========');
    _timer?.cancel();
    _loadHoursMins(); //0
    _loadPage(); //1 -> INFINI
  }

  _loadPage() {
    _timer = Timer.periodic(const Duration(seconds: 30), (Timer t) {
      print(
          '=========>>======================================================>>==================================================>>=========');
      print("30sec gone!!");
      if (mounted) {
        print("30sec gone, and _loadChildrenOnline!!");
        _loadHoursMins();
      } else {
        print(
            '=========<<======================================================<<==================================================<<=========');
      }
    });
  }

  void _loadHoursMins() {
    setState(() {
      _availableTime.clear();
      for (int i = 0; i < 10; i++) {
        _availableTime.add(
          CalenderHours(
            fromTime: DateFormat('HH:mm').format(
              DateFormat('HH:mm').parse('18:20:00.000', true).toLocal(),
            ).toString(),
            toTime: DateFormat('HH:mm').format(
              DateFormat('HH:mm').parse('19:20:00.000', true).toLocal(),
            ).toString(),
            onTap: () {
              print('ssa');
            },
          ),
        );
        _availableTime.add(
          CalenderHours(
            fromTime: DateFormat('HH:mm').format(
              DateFormat('HH:mm').parse('18:20:00.000', true).toLocal(),
            ).toString(),
            toTime: DateFormat('HH:mm').format(
              DateFormat('HH:mm').parse('19:20:00.000', true).toLocal(),
            ).toString(),
            onTap: null,
          ),
        );
      }
    });
  }
}
