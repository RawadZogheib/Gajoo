import 'package:flutter/material.dart';
import 'package:gajoo/globals/globals.dart' as globals;
import 'package:gajoo/widgets/PopUp/errorWarningPopup.dart';
import 'package:gajoo/widgets/other/MyCustomScrollBehavior.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class MyCoursesList extends StatelessWidget {
  List<List<dynamic>> coursesList;

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
        height: MediaQuery
            .of(context)
            .size
            .height * 0.8,
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
                // print( coursesList[index][1]);
                // print(DateTime.parse(
                //     DateFormat('yyyy-MM-dd HH:mm').format(DateTime.now().toUtc())));
                return MyCoursesItem(
                  width: 400,
                  text1: coursesList[index][0],
                  date: coursesList[index][1],
                  meetingDuration: int.parse(coursesList[index][2]),
                  onTap: (){
                    coursesList[index][3]();
                  },
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
  int meetingDuration;
  String _url = '';
  var onTap;

  MyCoursesItem({required this.width,
    required this.text1,
    required this.date,
    required this.meetingDuration,
    required this.onTap,});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Container(
        height: 70,
        width: width,
        margin: const EdgeInsets.all(12.0),
        padding: const EdgeInsets.all(8.0),
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
              child: Column(
                children: [
                  Text(
                    text1,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5,),
                  Text(
                    DateFormat('yyyy-MM-dd HH:mm').format(
                      DateFormat('yyyy-MM-dd HH:mm')
                          .parse(date, true)
                          .toLocal(),)
                        .toString(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ),
            ),
            ((DateTime.parse(
                DateFormat('yyyy-MM-dd HH:mm').format(DateTime.now().toUtc()))
                .isAfter(DateTime.parse(date)) &&
                DateTime.parse(
                    DateFormat('yyyy-MM-dd HH:mm').format(
                        DateTime.now().toUtc()))
                    .isBefore(DateTime.parse(date)
                    .add(Duration(minutes: meetingDuration)))) ||
                DateTime.parse(
                    DateFormat('yyyy-MM-dd HH:mm').format(
                        DateTime.now().toUtc()))
                    .isAtSameMomentAs(DateTime.parse(date)))
                ? InkWell(
              onTap: () {
                SuccessPopup(context, 'Joined the meeting');
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
                : DateTime.parse(
                DateFormat('yyyy-MM-dd HH:mm').format(DateTime.now()))
                .isBefore(DateTime.parse(date))
                ? InkWell(
              onTap: () {
                ErrorPopup(context, 'Meeting havn\'t started yet');
                _launchURL(_url);
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
                  color: Colors.blue.shade900.withOpacity(0.8),
                  child: Text(
                    'Join',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey.shade400,
                    ),
                  ),
                ),
              ),
            )
                : DateTime.parse(DateFormat('yyyy-MM-dd HH:mm')
                .format(DateTime.now()))
                .isAfter(
                DateTime.parse(date).add(Duration(minutes: meetingDuration)))
                ? InkWell(
              onTap: () => ErrorPopup(context, 'Meeting Expired'),
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
            )
                : InkWell(
              onTap: () => ErrorPopup(context, 'Error, please reload the page'),
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
      ),
    );
  }
}

void _launchURL(_url) async {
  if (!await launch(_url)) throw 'Could not launch $_url';
}