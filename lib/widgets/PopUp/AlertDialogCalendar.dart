import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gajoo/api/my_api.dart';
import 'package:gajoo/api/my_session.dart';
import 'package:gajoo/globals/globals.dart' as globals;
import 'package:gajoo/widgets/CalenderPage/CalendarHours.dart';
import 'package:gajoo/widgets/PopUp/errorWarningPopup.dart';
import 'package:gajoo/widgets/other/MyCustomScrollBehavior.dart';
import 'package:intl/intl.dart';

class AlertDialogCalendar extends StatefulWidget {
  String teacherId;
  Color color;
  DateTime date;

  AlertDialogCalendar({required this.teacherId, required this.color, required this.date});

  @override
  State<AlertDialogCalendar> createState() => _AlertDialogCalendarState();
}

class _AlertDialogCalendarState extends State<AlertDialogCalendar> {
  bool _isLoading = false;
  List<CalendarHours> _availableTime = [];
  List<Widget> _availableTimeLoading = [];
  Timer? _timer;

  @override
  void initState() {
    // TODO: implement initState
    _loadHoursMins();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _timer?.cancel();
    super.dispose();
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
              child: _isLoading == true
                  ? ListView(
                      controller: ScrollController(),
                      children: _availableTimeLoading,
                    )
                  : ListView.builder(
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
      _loadScreen();
      print('load calendar');

      var data = {
        'version': globals.version,
        'account_Id': await SessionManager().get("Id"),
        'teacher_Id': widget.teacherId,
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
            CalendarHours(
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
        WarningPopup(context, globals.error406);
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
        setState(() {});
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

  void _loadScreen() {
    int k = 0;
    int maxK = 6;
    _timer = Timer.periodic(const Duration(milliseconds: 150), (Timer t) {
      if (mounted) {
        if (_isLoading == true) {
          print(k);
          setState(() {
            if (k % maxK == 0) {
              _availableTimeLoading = [
                LoadingCalendarHours(
                  color1: Colors.grey.shade400,
                  color2: Colors.grey,
                ),
              ];
            } else if (k % maxK == 1) {
              _availableTimeLoading = [
                LoadingCalendarHours(
                  color1: Colors.grey.shade300,
                  color2: Colors.grey,
                ),
                LoadingCalendarHours(
                  color1: Colors.grey.shade400,
                  color2: Colors.grey,
                ),
              ];
            } else if (k % maxK == 2) {
              _availableTimeLoading = [
                LoadingCalendarHours(
                  color1: Colors.grey.shade50,
                  color2: Colors.grey,
                ),
                LoadingCalendarHours(
                  color1: Colors.grey.shade300,
                  color2: Colors.grey,
                ),
                LoadingCalendarHours(
                  color1: Colors.grey.shade400,
                  color2: Colors.grey,
                ),
              ];
            } else if (k % maxK == 3) {
              _availableTimeLoading = [
                LoadingCalendarHours(
                  color1: Colors.transparent,
                  color2: Colors.transparent,
                ),
                LoadingCalendarHours(
                  color1: Colors.grey.shade50,
                  color2: Colors.grey,
                ),
                LoadingCalendarHours(
                  color1: Colors.grey.shade300,
                  color2: Colors.grey,
                ),
              ];
            } else if (k % maxK == 4) {
              _availableTimeLoading = [
                LoadingCalendarHours(
                  color1: Colors.transparent,
                  color2: Colors.transparent,
                ),
                LoadingCalendarHours(
                  color1: Colors.transparent,
                  color2: Colors.transparent,
                ),
                LoadingCalendarHours(
                  color1: Colors.grey.shade50,
                  color2: Colors.grey,
                ),
              ];
            } else if (k % maxK == 5) {
              _availableTimeLoading = [
                LoadingCalendarHours(
                  color1: Colors.transparent,
                  color2: Colors.transparent,
                ),
                LoadingCalendarHours(
                  color1: Colors.transparent,
                  color2: Colors.transparent,
                ),
                LoadingCalendarHours(
                  color1: Colors.transparent,
                  color2: Colors.transparent,
                ),
              ];
            }
          });
          k++;
        } else {
          _timer?.cancel();
        }
      } else {
        _timer?.cancel();
      }
    });
  }
}
