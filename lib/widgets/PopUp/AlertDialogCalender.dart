import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gajoo/api/my_api.dart';
import 'package:gajoo/api/my_session.dart';
import 'package:gajoo/globals/globals.dart' as globals;
import 'package:gajoo/widgets/CalenderPage/CalenderHours.dart';
import 'package:gajoo/widgets/PopUp/errorWarningPopup.dart';
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
  bool _isLoading = false;
  List<CalenderHours> _availableTime = [];

  @override
  void initState() {
    // TODO: implement initState
    _loadHoursMins();
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

  Future<void> _loadHoursMins() async {
    // Load from db
    if (_isLoading == false) {
      //try {
        print(
            '=========>>======================================================>>==================================================>>=========');
        _isLoading = true;
        print('load calendar');

        var data = {
          'version': globals.version,
          'account_Id': await SessionManager().get("Id"),
          'date': DateFormat('yyyy-MM-dd').format(widget.date),
        };

        var res = await CallApi()
            .postData(data, '/Calendar/Control/(Control)loadHoursMins.php');
        print(res.body);
        List<dynamic> body = json.decode(res.body);

        _availableTime.clear();

        if (body[0] == "success") {
          for (int i = 0; i < body[1].length; i++) {
            _availableTime.add(
              CalenderHours(
                id: body[1][i][0],
                fromTime: DateFormat('HH:mm')
                    .format(
                      DateFormat('yyyy-MM-dd HH:mm')
                          .parse('${body[1][i][1]}.000', true)
                          .toLocal(),
                    )
                    .toString(),
                toTime: DateFormat('HH:mm')
                    .format(
                      DateFormat('yyyy-MM-dd HH:mm')
                          .parse('${body[1][i][1]}.000', true)
                          .add(Duration(minutes: int.parse(body[1][i][4])))
                          .toLocal(),
                    )
                    .toString(),
                courseStudents: body[1][i][2],
                courseMaxStudents: body[1][i][3],
                isTaken: int.parse(body[1][i][2]) < int.parse(body[1][i][3]),
                onTap: () {
                  print('ssa'); //or null
                },
              ),
            );
          }

          if (mounted) {
            setState(() {
              _availableTime;
            });
          }
        } else if (body[0] == "empty") {
          WarningPopup(context, globals.warning405);
        } else if (body[0] == "errorVersion") {
          if (mounted) {
            ErrorPopup(context, globals.errorVersion);
          }
        } else if (body[0] == "errorToken") {
          if (mounted) {
            ErrorPopup(context, globals.errorToken);
          }
        } else if (body[0] == "error7") {
          if (mounted) {
            WarningPopup(context, globals.warning7);
          }
        } else {
          _isLoading = false;
          setState(() {

          });
          if (mounted) {
            ErrorPopup(context, globals.errorElse);
          }
        }
        _isLoading = false;
      // } catch (e) {
      //   print(e);
      //   _isLoading = false;
      //   if (mounted) {
      //     ErrorPopup(context, globals.errorException);
      //   }
      // }
      print('load library end!!!');
      print(
          '=========<<======================================================<<==================================================<<=========');
    }
  }
}
