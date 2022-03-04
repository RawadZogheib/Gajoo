import 'package:flutter/material.dart';

class CalenderHours extends StatefulWidget {
  String fromTime;
  String toTime;
  Color color1;
  Color color2;
  var onTap;

  CalenderHours({
    required this.fromTime,
    required this.toTime,
    required this.color1,
    required this.color2,
    required this.onTap,
  });

  @override
  State<CalenderHours> createState() => _CalenderHoursState();
}

class _CalenderHoursState extends State<CalenderHours> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75,
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 35.0),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: widget.color1,
        borderRadius: const BorderRadius.all(
          Radius.circular(22.0),
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
          widget.onTap != null
              ? InkWell(
                  onTap: () => widget.onTap(),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(6.0),
                    ),
                    child: Container(
                      height: 35,
                      width: 100,
                      alignment: Alignment.center,
                      color: widget.color2,
                      child: Text(
                        'Get Course',
                        style: TextStyle(
                          color: widget.color1,
                        ),
                      ),
                    ),
                  ),
                )
              : InkWell(
                  onTap: () => null,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(6.0),
                    ),
                    child: Container(
                      height: 35,
                      width: 100,
                      alignment: Alignment.center,
                      color: widget.color2,
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
