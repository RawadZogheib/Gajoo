import 'package:flutter/material.dart';
import 'package:gajoo/globals/globals.dart' as globals;
import 'package:gajoo/widgets/PopUp/errorWarningPopup.dart';

class CalendarHours extends StatefulWidget {
  String id;
  String courseStudents;
  String courseMaxStudents;
  String fromTime;
  String toTime;
  bool isTaken;
  var onTap;

  CalendarHours({
    required this.id,
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
                  onTap: () {
                    widget.onTap();
                    SuccessPopup(context, globals.success404);
                  },
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
                  onTap: () => ErrorPopup(context, globals.error403),
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