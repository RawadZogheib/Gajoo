import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gajoo/globals/globals.dart' as globals;
import 'package:gajoo/hexColor/hexColor.dart';
import 'package:gajoo/widgets/HomePage/MyFooter.dart';
import 'package:gajoo/widgets/other/MyCoursesList.dart';
import 'package:gajoo/widgets/other/MyCustomScrollBehavior.dart';
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
                                child: SingleChildScrollView(
                                  child: MyCoursesList(
                                    coursesList: _coursesList,
                                  ),
                                ),
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
            DateFormat('yyyy-MM-dd HH:mm').parse('2022-03-01 18:20'),
          ),
        ],
        [
          'English Course',
          DateFormat('yyyy-MM-dd HH:mm').format(
            DateFormat('yyyy-MM-dd HH:mm').parse('2022-03-07 23:59'),
          ),
        ],
        [
          'Arabic Course',
          DateFormat('yyyy-MM-dd HH:mm').format(
            DateFormat('yyyy-MM-dd HH:mm').parse('2022-03-01 18:20'),
          ),
        ],
      ]);
    });
  }
}
