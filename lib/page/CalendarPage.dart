import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gajoo/globals/globals.dart' as globals;
import 'package:gajoo/hexColor/hexColor.dart';
import 'package:gajoo/widgets/CalenderPage/myCustomCalender.dart';
import 'package:gajoo/widgets/other/MyFooter.dart';
import 'package:gajoo/widgets/PopUp/AlertDialogCalender.dart';
import 'package:gajoo/widgets/PopUp/errorWarningPopup.dart';
import 'package:gajoo/widgets/other/MyCustomScrollBehavior.dart';
import 'package:gajoo/widgets/other/TeacherProfile.dart';
import 'package:gajoo/widgets/other/myDrawer.dart';
import 'package:intl/intl.dart';

class CalenderPage extends StatefulWidget {
  @override
  _CalenderPageState createState() => _CalenderPageState();
}

class _CalenderPageState extends State<CalenderPage> {
  Timer? timer;
  bool _isLogedIn = true;
  Set<String> _greenList = {};
  Set<String> _redList = {};

  @override
  void initState() {
    // TODO: implement initState
    _loadNewPage();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: myDrawer(),
      body: Builder(
        builder: (context) => ScrollConfiguration(
          behavior: MyCustomScrollBehavior(),
          child: SingleChildScrollView(
            controller: ScrollController(),
            child: Column(
              children: [
                SizedBox(
                  height: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          'Assets/HomePage/logo.png',
                          height: 95,
                          width: 300,
                          fit: BoxFit.contain,
                        ),
                      ),
                      _isLogedIn == false
                          ? Container(
                              height: 60,
                              width: 120,
                              margin: const EdgeInsets.only(right: 16.0),
                              child: ElevatedButton(
                                onPressed: () =>
                                    Navigator.of(context).pushNamed('/Login'),
                                child: const Text('Login'),
                              ),
                            )
                          : Container(
                              margin: const EdgeInsets.only(right: 20.0),
                              child: Row(
                                children: [
                                  const Text(
                                    'Rawad Zogheib',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    width: 12,
                                  ),
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    onTap: () =>
                                        Scaffold.of(context).openEndDrawer(),
                                    child: CircleAvatar(
                                      backgroundColor: HexColor('#222222'),
                                      backgroundImage: const AssetImage(
                                          'Assets/HomePage/ProfilePicture/img1.png'),
                                      maxRadius: 35,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                    ],
                  ),
                ),
                ScrollConfiguration(
                  behavior: MyCustomScrollBehavior(),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    controller: ScrollController(),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TeacherProfile(
                          name: 'Rawad',
                          age: '22',
                          languages: 'Arabic, french, english',
                          nbrOfCourses: '20',
                          coursesReserved: '27',
                          coursesLeft: '3',
                        ),
                        const SizedBox(
                          width: 60,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30),
                              bottomLeft: Radius.circular(30),
                              bottomRight: Radius.circular(30),
                            ),
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.8,
                              width: 500,
                              color: globals.whiteBlue,
                              child: ScrollConfiguration(
                                behavior: MyCustomScrollBehavior(),
                                child: MyCustomCalender(
                                  greenList: _greenList,
                                  redList: _redList,
                                  onDayPressed: (date) {
                                    print(
                                        DateFormat('yyyy-MM-dd').format(date));
                                    _checkIfIsLoggedIn(date);
                                  },
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                const MyFooter(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _checkIfIsLoggedIn(DateTime _date) {
    if (_isLogedIn == false) {
      WarningPopup(context, globals.warning400);
    } else if (_greenList.contains(DateFormat('yyyy-MM-dd').format(
      DateFormat('yyyy-MM-dd').parse(_date.toLocal().toString(), true),
    ))) {
      showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialogCalender(
          color: Colors.green,
          date: _date,
        ),
      );
    } else if (_redList.contains(DateFormat('yyyy-MM-dd').format(
      DateFormat('yyyy-MM-dd').parse(_date.toLocal().toString(), true),
    ))) {
      ErrorPopup(context, globals.error401);
    } else {
      ErrorPopup(context, globals.error402);
    }
  }

  _loadNewPage() {
    print(
        '=========>>======================================================>>==================================================>>=========');
    timer?.cancel();
    _loadDates(); //0
    _loadPage(); //1 -> INFINI
  }

  _loadPage() {
    timer = Timer.periodic(const Duration(seconds: 30), (Timer t) {
      print(
          '=========>>======================================================>>==================================================>>=========');
      print("30sec gone!!");
      if (mounted) {
        print("30sec gone, and _loadChildrenOnline!!");
        _loadDates();
      } else {
        print(
            '=========<<======================================================<<==================================================<<=========');
      }
    });
  }

  void _loadDates() {
    // load from db
    setState(() {
      _greenList.clear();
      _redList.clear();
      _greenList.addAll([
        DateFormat('yyyy-MM-dd').format(
          DateFormat('yyyy-MM-dd HH:mm')
              .parse('2022-03-08 23:42:00.000', true)
              .toLocal(),
        ),
        DateFormat('yyyy-MM-dd').format(
          DateFormat('yyyy-MM-dd HH:mm')
              .parse('2022-03-09 17:42:00.000', true)
              .toLocal(),
        ),
        DateFormat('yyyy-MM-dd').format(
          DateFormat('yyyy-MM-dd HH:mm')
              .parse('2022-03-10 17:42:00.000', true)
              .toLocal(),
        ),
        DateFormat('yyyy-MM-dd').format(
          DateFormat('yyyy-MM-dd HH:mm')
              .parse('2022-03-11 17:42:00.000', true)
              .toLocal(),
        ),
        DateFormat('yyyy-MM-dd').format(
          DateFormat('yyyy-MM-dd HH:mm')
              .parse('2022-03-13 17:42:00.000', true)
              .toLocal(),
        ),
        DateFormat('yyyy-MM-dd').format(
          DateFormat('yyyy-MM-dd HH:mm')
              .parse('2022-03-14 17:42:00.000', true)
              .toLocal(),
        ),
        DateFormat('yyyy-MM-dd').format(
          DateFormat('yyyy-MM-dd HH:mm')
              .parse('2022-04-17 17:42:00.000', true)
              .toLocal(),
        ),
      ]);
      _redList.addAll([
        DateFormat('yyyy-MM-dd').format(
          DateFormat('yyyy-MM-dd HH:mm')
              .parse('2022-03-12 17:42:00.000', true)
              .toLocal(),
        ),
        DateFormat('yyyy-MM-dd').format(
          DateFormat('yyyy-MM-dd HH:mm')
              .parse('2022-03-18 17:42:00.000', true)
              .toLocal(),
        ),
        DateFormat('yyyy-MM-dd').format(
          DateFormat('yyyy-MM-dd HH:mm')
              .parse('2022-04-22 17:42:00.000', true)
              .toLocal(),
        ),
      ]);
    });
  }
}
