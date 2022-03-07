import 'package:flutter/material.dart';
import 'package:gajoo/globals/globals.dart' as globals;
import 'package:gajoo/widgets/PopUp/errorWarningPopup.dart';
import 'package:gajoo/widgets/other/MyCustomScrollBehavior.dart';
import 'package:intl/intl.dart';

class MyCoursesList extends StatelessWidget {
  List<List<String>> coursesList;

  MyCoursesList({
    required this.coursesList,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(30),
        topRight: Radius.circular(30),
        bottomLeft: Radius.circular(30),
        bottomRight: Radius.circular(30),
      ),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.8,
        width: 500,
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: ScrollConfiguration(
          behavior: MyCustomScrollBehavior(),
          child: ListView.builder(
              itemCount: coursesList.length,
              controller: ScrollController(),
              itemBuilder: (BuildContext context, int index) {
                return MyCoursesItem(
                  width: 400,
                  text1: coursesList[index][0],
                  date: coursesList[index][1],
                );
              }),
        ),
      ),
    );
  }
}

class MyCoursesItem extends StatelessWidget {
  double width;
  String text1;
  String date;

  MyCoursesItem({required this.width, required this.text1, required this.date});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: width,
      margin: const EdgeInsets.all(12.0),
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: globals.whiteBlue,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(22),
          bottomRight: Radius.circular(22),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              text1,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          (DateTime.parse(DateFormat('yyyy-MM-dd HH:mm').format(DateTime.now()))
                      .isBefore(DateTime.parse(date)
                          .add(Duration(minutes: globals.meetingDuration))) ||
                  DateTime.parse(
                          DateFormat('yyyy-MM-dd HH:mm').format(DateTime.now()))
                      .isAtSameMomentAs(DateTime.parse(date)))
              ? InkWell(
                  onTap: () {
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
                      color: Colors.blue,
                      child: const Text(
                        'Join',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
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
                      color: Colors.grey.shade900.withOpacity(0.8),
                      child: Text(
                        'Join',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey.shade400,
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
