import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gajoo/globals/globals.dart' as globals;
import 'package:gajoo/hexColor/hexColor.dart';
import 'package:gajoo/widgets/other/MyCoursesList.dart';
import 'package:gajoo/widgets/other/MyCustomScrollBehavior.dart';
import 'package:gajoo/widgets/other/MyFooter.dart';
import 'package:gajoo/widgets/other/MyHeader.dart';
import 'package:gajoo/widgets/other/TeacherProfile.dart';
import 'package:gajoo/widgets/other/myDrawer.dart';
import 'package:intl/intl.dart';

class MyCourses extends StatefulWidget {
  const MyCourses({Key? key}) : super(key: key);

  @override
  State<MyCourses> createState() => _MyCoursesState();
}

class _MyCoursesState extends State<MyCourses> {
  Timer? timer;
  List<List<String>> _coursesList = [];

  bool _isLogedIn = true;

  @override
  void initState() {
    // TODO: implement initState
    _loadNewPage();
    globals.currentPage = 'MyCourses';
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
    return WillPopScope(
      onWillPop: () async => _back(),
      child: Scaffold(
        appBar: MediaQuery.of(context).size.width < 650
            ? AppBar(
                backgroundColor: globals.whiteBlue,
                elevation: 0,
                title: Center(
                  child: Text(
                    'Gajoo',
                    style: TextStyle(
                      fontSize: 28,
                      color: HexColor('#333333'),
                    ),
                  ),
                ),
                leading: IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: HexColor('#333333'),
                    ),
                    onPressed: () {
                      _back();
                    }),
                actions: [
                  Builder(
                    builder: (context) => IconButton(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      icon: Icon(
                        Icons.menu,
                        color: HexColor('#333333'),
                      ),
                      onPressed: () => Scaffold.of(context).openEndDrawer(),
                    ),
                  ),
                ],
              )
            : null,
        endDrawer: myDrawer(),
        body: Column(
          children: [
            MediaQuery.of(context).size.width > 650
                ? const MyHeader()
                : Container(),
            Expanded(
              child: ScrollConfiguration(
                behavior: MyCustomScrollBehavior(),
                child: SingleChildScrollView(
                  controller: ScrollController(),
                  child: Column(
                    children: [
                      ScrollConfiguration(
                        behavior: MyCustomScrollBehavior(),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          controller: ScrollController(),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
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
                                    height: MediaQuery.of(context).size.height *
                                        0.8,
                                    width: 500,
                                    padding: const EdgeInsets.all(12.0),
                                    color: Colors.white,
                                    child: MyCoursesList(
                                      coursesList: _coursesList,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 60,
                              ),
                              TeacherProfile(
                                name: 'Rawad',
                                age: '22',
                                languages: 'Arabic, french, english',
                                nbrOfCourses: '20',
                                coursesReserved: '27',
                                coursesLeft: '3',
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
          ],
        ),
      ),
    );
  }

  _loadNewPage() {
    print(
        '=========>>======================================================>>==================================================>>=========');
    timer?.cancel();
    _loadCourses(); //0
    _loadPage(); //1 -> INFINI
  }

  _loadPage() {
    timer = Timer.periodic(const Duration(seconds: 30), (Timer t) {
      print(
          '=========>>======================================================>>==================================================>>=========');
      print("30sec gone!!");
      if (mounted) {
        print("30sec gone, and _loadChildrenOnline!!");
        _loadCourses();
      } else {
        print(
            '=========<<======================================================<<==================================================<<=========');
      }
    });
  }

  void _loadCourses() {
    setState(() {
      _coursesList.clear();
      _coursesList.addAll([
        [
          'Spanic Speaking',
          DateFormat('yyyy-MM-dd HH:mm').format(
            DateFormat('yyyy-MM-dd HH:mm')
                .parse('2022-03-08 20:35:00.000', true),
          ),
          '40',
        ],
        [
          'English Course',
          DateFormat('yyyy-MM-dd HH:mm').format(
            DateFormat('yyyy-MM-dd HH:mm')
                .parse('2022-03-07 22:00:00.000', true),
          ),
          '40',
        ],
        [
          'English Course',
          DateFormat('yyyy-MM-dd HH:mm').format(
            DateFormat('yyyy-MM-dd HH:mm')
                .parse('2022-03-08 22:20:00.000', true),
          ),
          '40',
        ],
        [
          'Arabic Course',
          DateFormat('yyyy-MM-dd HH:mm').format(
            DateFormat('yyyy-MM-dd HH:mm')
                .parse('2022-03-09 18:20:00.000', true),
          ),
          '40',
        ],
      ]);
    });
  }

  _back() {
    Navigator.pushNamedAndRemoveUntil(context, '/Teacher', (route) => false);
  }
}
