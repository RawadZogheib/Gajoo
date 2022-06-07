import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gajoo/api/my_api.dart';
import 'package:gajoo/api/my_session.dart';
import 'package:gajoo/globals/globals.dart' as globals;
import 'package:gajoo/widgets/PopUp/errorWarningPopup.dart';

class CalendarHours extends StatefulWidget {
  String courseId;
  String courseStudents;
  String courseMaxStudents;
  String fromTime;
  String toTime;
  bool isTaken;
  Function onTap;

  CalendarHours({
    required this.courseId,
    required this.courseStudents,
    required this.courseMaxStudents,
    required this.fromTime,
    required this.toTime,
    required this.isTaken,
    required this.onTap,
  });

  @override
  State<CalendarHours> createState() => _CalendarHoursState();
}

class _CalendarHoursState extends State<CalendarHours> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75,
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 35.0),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: widget.isTaken != false ? Colors.green : Colors.red,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(22.0),
          bottomRight: Radius.circular(22.0),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  const Text(
                    'From ',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 17,
                    ),
                  ),
                  Text(
                    widget.fromTime,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    '  to ',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 17,
                    ),
                  ),
                  Text(
                    widget.toTime,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const Text(
                'French Speaking',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 14,
                ),
              )
            ],
          ),
          widget.isTaken != false
              ? InkWell(
                  onTap: () => _buyCourse(),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(12.0),
                      bottomRight: Radius.circular(12.0),
                    ),
                    child: Container(
                      height: 35,
                      width: 100,
                      alignment: Alignment.center,
                      color: Colors.white,
                      child: const Text(
                        'Get Course',
                        style: TextStyle(
                          color: Colors.green,
                        ),
                      ),
                    ),
                  ),
                )
              : InkWell(
                  onTap: () => errorPopup(context, globals.error403),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(12.0),
                      bottomRight: Radius.circular(12.0),
                    ),
                    child: Container(
                      height: 35,
                      width: 100,
                      alignment: Alignment.center,
                      color: Colors.red.shade900.withOpacity(0.8),
                      child: Text(
                        'Expired',
                        style: TextStyle(
                          color: Colors.red.shade400,
                        ),
                      ),
                    ),
                  ),
                ),
        ],
      ),
    );
  }

  Future<void> _buyCourse() async {
    // buy from db
    if (_isLoading == false) {
      try {
        debugPrint(
            '=========>>======================================================>>==================================================>>=========');
        _isLoading = true;
        //_loadScreen();
        debugPrint('buy course start');

        var data = {
          'version': globals.version,
          'account_Id': await SessionManager().get("Id"),
          'course_Id': widget.courseId,
        };

        var res = await CallApi()
            .postData(data, '/Calendar/Control/(Control)buyCourse.php');
        debugPrint(res.body);
        List<dynamic> body = json.decode(res.body);

        if (body[0] == "success") {
          widget.onTap(); // pop popUp
          if (mounted) {
            successPopup(context, globals.success404);
          }
        } else if (body[0] == "errorVersion") {
          if (mounted) {
            errorPopup(context, globals.errorVersion);
          }
        } else if (body[0] == "errorToken") {
          if (mounted) {
            errorPopup(context, globals.errorToken);
          }
        } else if (body[0] == "error4") {
          if (mounted) {
            errorPopup(context, globals.error4);
          }
        } else if (body[0] == "error7") {
          if (mounted) {
            warningPopup(context, globals.warning7);
          }
        } else if (body[0] == "error410") {
          if (mounted) {
            errorPopup(context, globals.error410);
          }
        } else if (body[0] == "error411") {
          if (mounted) {
            errorPopup(context, globals.error411);
          }
        } else if (body[0] == "error412") {
          if (mounted) {
            errorPopup(context, globals.error412);
          }
        } else if (body[0] == "error413") {
          if (mounted) {
            errorPopup(context, globals.error413);
          }
        } else {
          if (mounted) {
            setState(() {
              _isLoading = false;
            });
            errorPopup(context, globals.errorElse);
          }
        }
        if (mounted) {
          setState(() {
            _isLoading = false;
          });
        }
      } catch (e) {
        print(e);
        if (mounted) {
          setState(() {
            _isLoading = false;
          });
          errorPopup(context, globals.errorException);
        }
      }
      debugPrint('buy course end!!!');
      debugPrint(
          '=========<<======================================================<<==================================================<<=========');
    }
  }
}

class LoadingCalendarHours extends StatelessWidget {
  Color color1;
  Color color2;

  LoadingCalendarHours({Key? key, required this.color1, required this.color2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75,
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 35.0),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: color1,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(22.0),
          bottomRight: Radius.circular(22.0),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: const [
                  Text(
                    'From ',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 17,
                    ),
                  ),
                  Text(
                    '-',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '  to ',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 17,
                    ),
                  ),
                  Text(
                    '-',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const Text(
                '- -',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 14,
                ),
              )
            ],
          ),
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12.0),
              bottomRight: Radius.circular(12.0),
            ),
            child: Container(
              height: 35,
              width: 100,
              alignment: Alignment.center,
              color: Colors.white,
              child: Text(
                '-',
                style: TextStyle(
                  color: color2,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
