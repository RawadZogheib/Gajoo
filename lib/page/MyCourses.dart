import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gajoo/api/my_api.dart';
import 'package:gajoo/api/my_session.dart';
import 'package:gajoo/globals/globals.dart' as globals;
import 'package:gajoo/hexColor/hexColor.dart';
import 'package:gajoo/widgets/HomePage/TeacherCard.dart';
import 'package:gajoo/widgets/PopUp/errorWarningPopup.dart';
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
  List<List<dynamic>> _coursesList = [];
  bool _clicked = false;
  int? _courseId;
  bool _isLoading = false;

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
        backgroundColor: globals.whiteBlue,
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
                              _clicked == true
                                  ? TeacherProfile(
                                      name: _coursesList[_courseId!][5],
                                      age: _coursesList[_courseId!][6],
                                      languages: 'Arabic, french, english',
                                      nbrOfCourses: _coursesList[_courseId!][7],
                                      coursesReserved: _coursesList[_courseId!]
                                          [8],
                                      coursesLeft: (int.parse(
                                                  _coursesList[_courseId!][7]) -
                                              int.parse(
                                                  _coursesList[_courseId!][8]))
                                          .toString(),
                                      cancelButton: true,
                                      onTap: () {
                                        _offClicked();
                                      },
                                    )
                                  : ClipRRect(
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(30),
                                        topRight: Radius.circular(30),
                                        bottomLeft: Radius.circular(30),
                                        bottomRight: Radius.circular(30),
                                      ),
                                      child: Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.8,
                                        width: 500,
                                        decoration: const BoxDecoration(
                                          color: Colors.white,
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
  }

  Future<void> _loadCourses() async {
    // Load from db
    if (_isLoading == false) {
      try {
        print(
            '=========>>======================================================>>==================================================>>=========');
        _isLoading = true;
        print('Load calendar');

        var data = {
          'version': globals.version,
          'account_Id': await SessionManager().get("Id"),
        };

        var res = await CallApi()
            .postData(data, '/MyCourses/Control/(Control)loadCourses.php');
        print(res.body);
        List<dynamic> body = json.decode(res.body);

        _coursesList.clear();

        if (body[0] == "success") {
          for (int i = 0; i < body[1].length; i++) {
            Set<String> _tempLanguageView = {};
            List<Characteristic_t> _tempListOfCharacteristic_t = [];
            //print(body[1][i][3] + "hhhhhhhhhhhhh");
            for (int j = 0; j < body[1][i][9].length; j++) {
              if (body[1][i][9][j][1] == "Arabic" ||
                  body[1][i][9][j][1] == "arabic") {
                //for language
                _tempLanguageView.add("Arabic");
              } else if (body[1][i][9][j][1] == "French" ||
                  body[1][i][9][j][1] == "french") {
                _tempLanguageView.add("French");
              } else if (body[1][i][9][j][1] == "English" ||
                  body[1][i][9][j][1] == "english") {
                _tempLanguageView.add("English");
              }
              _tempListOfCharacteristic_t.add(Characteristic_t(
                  type: body[1][i][9][j][0],
                  language: body[1][i][9][j][1],
                  level: body[1][i][9][j][2]));
            }

            _coursesList.add(
              [
                body[1][i][0], // courseId
                body[1][i][1], // courseName
                DateFormat('yyyy-MM-dd HH:mm').format(
                  DateFormat('yyyy-MM-dd HH:mm')
                      .parse('${body[1][i][2]}.000', true)
                      .toLocal(), //2022-03-15 20:35:00 .000 timeBegin
                ),
                body[1][i][3], // courseDuration
                body[1][i][4], // teacherId
                body[1][i][5], // teacherName
                (DateTime.now().year - DateTime.parse(body[1][i][6]).year)
                    .toString(), // teacherAge
                body[1][i][7], // teacherNbOfCourses
                body[1][i][8], // teacherNbOfCourses
                _tempLanguageView, // languageView
                _tempListOfCharacteristic_t, // listOfCharacteristic_t
                () {
                  _onClicked(i);
                }
              ],
            );
            print(_coursesList);
          }

          if (mounted) {
            setState(() {
              _coursesList;
            });
          }
        } else if (body[0] == "empty") {
          WarningPopup(context, globals.error405);
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
          if (mounted) {
            ErrorPopup(context, globals.errorElse);
          }
        }
        _isLoading = false;
      } catch (e) {
        print(e);
        _isLoading = false;
        if (mounted) {
          ErrorPopup(context, globals.errorException);
        }
      }
      print('load library end!!!');
      print(
          '=========<<======================================================<<==================================================<<=========');
    }
  }

  _onClicked(int i) {
    setState(() {
      _clicked = true;
      _courseId = i;
    });
  }

  _offClicked() {
    print('asdsad');
    setState(() {
      _clicked = false;
      _courseId = null;
    });
  }

  _back() {
    Navigator.pushNamedAndRemoveUntil(context, '/Teacher', (route) => false);
  }
}
