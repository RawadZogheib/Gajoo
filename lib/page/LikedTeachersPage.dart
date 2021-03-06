import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gajoo/api/my_api.dart';
import 'package:gajoo/api/my_session.dart';
import 'package:gajoo/globals/globals.dart' as globals;
import 'package:gajoo/hexColor/hexColor.dart';
import 'package:gajoo/widgets/HomePage/TeacherCard.dart';
import 'package:gajoo/widgets/PopUp/errorWarningPopup.dart';
import 'package:gajoo/widgets/button/myButton.dart';
import 'package:gajoo/widgets/other/MyCustomScrollBehavior.dart';
import 'package:gajoo/widgets/other/MyFooter.dart';
import 'package:gajoo/widgets/other/MyHeader.dart';
import 'package:gajoo/widgets/other/Responsive.dart';
import 'package:gajoo/widgets/other/myDrawer.dart';
import 'package:gajoo/widgets/other/myDrawerMobile.dart';
import 'package:infinite_listview/infinite_listview.dart';

class LikedTeachersPage extends StatefulWidget {
  String? type;
  String? languages;
  String? level;

  LikedTeachersPage({this.type, this.languages, this.level});

  @override
  _LikedTeachersPageState createState() => _LikedTeachersPageState();
}

class _LikedTeachersPageState extends State<LikedTeachersPage> {
  Timer? timer;

  final InfiniteScrollController _infiniteController = InfiniteScrollController(
    initialScrollOffset: 0.0,
  );

  int _key = 0;
  var _age;

  List<TeacherCard> _TeacherCardList = [];
  //List<TeacherCard> _TeacherCardListFiltered = [];

  //final List<TeacherCard> _LikedTeacherCard = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    globals.currentPage = "LikedTeachersPage";
    _choosedFilters();
    _loadNewPage();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    widget.type = '';
    widget.languages = '';
    widget.level = '';
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => _back(),
      child: Scaffold(
        backgroundColor: globals.whiteBlue,
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
        )
            : null,
        drawer: MyDrawerFilter(),
        endDrawer: myDrawer(),
        body: Responsive(
          mobile: Builder(
            builder: (context) => Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0.0),
                    child: Stack(
                      children: [
                        ScrollConfiguration(
                          behavior: MyCustomScrollBehavior(),
                          child: SingleChildScrollView(
                            controller: ScrollController(),
                            child: Column(
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: ClipRRect(
                                        borderRadius: const BorderRadius.only(
                                          topRight: Radius.circular(12.5),
                                          topLeft: Radius.circular(12.5),
                                          //
                                          bottomRight: Radius.circular(12.5),
                                          bottomLeft: Radius.circular(12.5),
                                        ),
                                        child: Container(
                                          height: MediaQuery.of(context)
                                              .size
                                              .height *
                                              0.7,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(12.5),
                                            color: Colors.white70,
                                          ),
                                          child: ScrollConfiguration(
                                            behavior: MyCustomScrollBehavior(),
                                            child: SingleChildScrollView(
                                              controller: ScrollController(),
                                              child: Wrap(
                                                children: _TeacherCardList
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 100,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const MyFooter(),
              ],
            ),
          ),
          tablet: Column(
            children: [
              const MyHeader(),
              Expanded(
                child: Stack(
                  children: [
                    ScrollConfiguration(
                      behavior: MyCustomScrollBehavior(),
                      child: SingleChildScrollView(
                        controller: ScrollController(),
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  width: 250.0,
                                ),
                                Expanded(
                                  child: ClipRRect(
                                    borderRadius: const BorderRadius.only(
                                      topRight: Radius.circular(12.5),
                                      topLeft: Radius.circular(12.5),
                                      //
                                      bottomRight: Radius.circular(12.5),
                                      bottomLeft: Radius.circular(12.5),
                                    ),
                                    child: Container(
                                      height:
                                      MediaQuery.of(context).size.height *
                                          0.7,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                        BorderRadius.circular(12.5),
                                        color: Colors.white70,
                                      ),
                                      child: ScrollConfiguration(
                                        behavior: MyCustomScrollBehavior(),
                                        child: SingleChildScrollView(
                                          controller: ScrollController(),
                                          child: Wrap(
                                            children: _TeacherCardList
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 100,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 50,
                            ),
                            const MyFooter(),
                          ],
                        ),
                      ),
                    ),
                    //MyFilter(),
                  ],
                ),
              ),
            ],
          ),

          desktop: Column(
            children: [
              const MyHeader(),
              Expanded(
                child: Stack(
                  children: [
                    ScrollConfiguration(
                      behavior: MyCustomScrollBehavior(),
                      child: SingleChildScrollView(
                        controller: ScrollController(),
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  width: 100.0,
                                ),
                                Expanded(
                                  child: ClipRRect(
                                    borderRadius: const BorderRadius.only(
                                      topRight: Radius.circular(12.5),
                                      topLeft: Radius.circular(12.5),
                                      //
                                      bottomRight: Radius.circular(12.5),
                                      bottomLeft: Radius.circular(12.5),
                                    ),
                                    child: Container(
                                      height:
                                      MediaQuery.of(context).size.height *
                                          0.7,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                        BorderRadius.circular(12.5),
                                        color: Colors.white70,
                                      ),
                                      child: ScrollConfiguration(
                                        behavior: MyCustomScrollBehavior(),
                                        child: SingleChildScrollView(
                                          controller: ScrollController(),
                                          child: Wrap(
                                            children: _TeacherCardList
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 100,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 50,
                            ),
                            MyFooter(),
                          ],
                        ),
                      ),
                    ),
                    //MyFilter(),
                  ],
                ),
              ),
            ],
          ),
          ),
        floatingActionButton: Builder(
          builder: (context) => FloatingActionButton(
            onPressed: () => MediaQuery.of(context).size.width < 650
                ? _open()
                : Scaffold.of(context).openDrawer(),
            tooltip: 'Filter',
            child: const Icon(Icons.add),
          ),
        ),
        ),
      );
  }

  _loadNewPage() {
    print(
        '=========>>======================================================>>==================================================>>=========');
    timer?.cancel();
    _loadLikedTeachers(); //0
    //_loadPage(); //1 -> INFINI
  }

  _loadPage() {
    //for reload page each 30s
    timer = Timer.periodic(const Duration(seconds: 30), (Timer t) {
      print(
          '=========>>======================================================>>==================================================>>=========');
      print("30sec gone!!");
      if (mounted) {
        print("30sec gone, and _loadChildrenOnline!!");
        //_loadLikedTeachers();
      } else {
        print(
            '=========<<======================================================<<==================================================<<=========');
      }
    });
  }

  _loadLikedTeachers() async {
    SessionManager session = SessionManager();
      var data = {
        'version': globals.version,
        'email': await session.get('email'),
      };

    var res = await CallApi()
        .postData(data, '/LikedTeacher/Control/(Control)getLikedTeachers.php');

    print(res.body);
    List<dynamic> body = json.decode(res.body);

    _TeacherCardList.clear();

    if (body[0] == "success") {
      //print(body[1]);

      for (int i = 0; i < body[1].length; i++) {
        Set<String> _tempLanguageView = {};
        List<Characteristic_t> _tempListOfCharacteristic_t = [];
        _age = DateTime.now().year - DateTime.parse(body[1][i][2]).year;
        print(_age);

        //print(body[1][i][3] + "hhhhhhhhhhhhh");
        for (int j = 0; j < body[1][i][5].length; j++) {
          if (body[1][i][5][j][1] == "Arabic" ||
              body[1][i][5][j][1] == "arabic") {
            //for language
            _tempLanguageView.add("Arabic");
          } else if (body[1][i][5][j][1] == "French" ||
              body[1][i][5][j][1] == "french") {
            _tempLanguageView.add("French");
          } else if (body[1][i][5][j][1] == "English" ||
              body[1][i][5][j][1] == "english") {
            _tempLanguageView.add("English");
          }
          _tempListOfCharacteristic_t.add(Characteristic_t(
              type: body[1][i][5][j][0],
              language: body[1][i][5][j][1],
              level: body[1][i][5][j][2]));
        }

        _TeacherCardList.add(
          TeacherCard(
              key: ValueKey(_key++),
              Id: body[1][i][0],
              name: body[1][i][1],
              age: _age.toString(),
              NbOfCourses: body[1][i][3],
              NbOfCoursesReserved: body[1][i][4],
              NbOfCoursesLeft:
              (int.parse(body[1][i][3]) - int.parse(body[1][i][4]))
                  .toString(),
              imageUrl: 'Assets/HomePage/ProfilePicture/img1.png',
              languageView: _tempLanguageView,
              isHeart: true,
              isHeartLikedTeacher: false,
              isButton: true,
              liked: true,   //bade 7otta mn lbody
              isHidden: false,
              listOfCharacteristic_t: _tempListOfCharacteristic_t,
              isHidable: true,
              onPressed: () {}),
        );
      }
      //
      setState(() {
        _TeacherCardList;
      });

      // if (mounted) {
      //   setState(() {
      //     _greenList;
      //     _redList;
      //   });
      // }
    } else if (body[0] == "empty") {
      warningPopup(context, globals.warning407);
    } else if (body[0] == "errorVersion") {
      if (mounted) {
        errorPopup(context, globals.errorVersion);
      }
    } else if (body[0] == "errorToken") {
      if (mounted) {
        errorPopup(context, globals.errorToken);
      }
    } else if (body[0] == "error7") {
      if (mounted) {
        warningPopup(context, globals.warning7);
      }
    } else {
      if (mounted) {
        errorPopup(context, globals.errorElse);
      }
    }

    }


  _choosedFilters() {
    if (globals.type == "Language Lessons") {
      if (mounted) {
        setState(() {
          type1 = Colors.yellowAccent;
          //_checkFilter();
        });
      }
    } else if (globals.type == "Native Speaking") {
      if (mounted) {
        setState(() {
          type2 = Colors.yellowAccent;
          //_checkFilter();
        });
      }
    } else if (globals.type == "Diploma Certificate") {
      if (mounted) {
        setState(() {
          type3 = Colors.yellowAccent;
          //_checkFilter();
        });
      }
    }

    if (globals.language == "English") {
      if (mounted) {
        setState(() {
          language1 = Colors.redAccent;
          //_checkFilter();
        });
      }
    } else if (globals.language == "French") {
      if (mounted) {
        setState(() {
          language2 = Colors.redAccent;
          //_checkFilter();
        });
      }
    } else if (globals.language == "Arabic") {
      if (mounted) {
        setState(() {
          language3 = Colors.redAccent;
          //_checkFilter();
        });
      }
    }

    if (globals.level == "beginner") {
      if (mounted) {
        setState(() {
          level1 = Colors.indigo;
          //_checkFilter();
        });
      }
    } else if (globals.level == "intermediate") {
      if (mounted) {
        setState(() {
          level2 = Colors.indigo;
          //_checkFilter();
        });
      }
    } else if (globals.level == "advanced") {
      if (mounted) {
        setState(() {
          level3 = Colors.indigo;
          //_checkFilter();
        });
      }
    }
  }


  MyDrawerFilter() {
    return Drawer(
      child: Material(
        color: HexColor('#222222'), //globals.blue1,
        child: ScrollConfiguration(
          behavior: MyCustomScrollBehavior(),
          child: ListView(
            controller: ScrollController(),
            children: <Widget>[
              Column(
                children: [
                  SizedBox(
                    height: 250,
                    width: MediaQuery.of(context).size.width,
                    child: Image.asset(
                      'Assets/HomePage/ProfilePicture/img1.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text('Type: '),
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 6.0, left: 3.0, right: 3.0, bottom: 3.0),
                        child: myBtn2(
                          height: 25,
                          width: 150,
                          color1: type1,
                          color2: Colors.black,
                          btnText: const Text(
                            'RED',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 12),
                          ),
                          onPress: () {
                            _cleanColorType();
                            if (mounted) {
                              setState(() {
                                globals.type = "Language Lessons";
                                type1 = Colors.yellowAccent;
                              });
                              //_checkFilter();
                            }
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: myBtn2(
                          height: 25,
                          width: 150,
                          color1: type2,
                          color2: Colors.black,
                          btnText: const Text(
                            'YELLOW',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 12),
                          ),
                          onPress: () {
                            _cleanColorType();
                            if (mounted) {
                              setState(() {
                                globals.type = "Native Speaking";
                                type2 = Colors.yellowAccent;
                              });
                              //_checkFilter();
                            }
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: myBtn2(
                          height: 25,
                          width: 150,
                          color1: type3,
                          color2: Colors.black,
                          btnText: const Text(
                            'GREEN',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 12),
                          ),
                          onPress: () {
                            _cleanColorType();
                            if (mounted) {
                              setState(() {
                                globals.type = "Diploma Certificate";
                                type3 = Colors.yellowAccent;
                              });
                              //_checkFilter();
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                  const Divider(color: Colors.black),
                  const Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text('Language: '),
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 6.0, left: 3.0, right: 3.0, bottom: 3.0),
                        child: myBtn2(
                          height: 25,
                          width: 150,
                          color1: language1,
                          color2: Colors.black,
                          btnText: const Text(
                            'ENGLISH',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 12),
                          ),
                          onPress: () {
                            _cleanColorLanguage();
                            if (mounted) {
                              setState(() {
                                globals.language = "English";
                                language1 = Colors.redAccent;
                              });
                              //_checkFilter();
                            }
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: myBtn2(
                          height: 25,
                          width: 150,
                          color1: language2,
                          color2: Colors.black,
                          btnText: const Text(
                            'FRENCH',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 12),
                          ),
                          onPress: () {
                            _cleanColorLanguage();
                            if (mounted) {
                              setState(() {
                                globals.language = "French";
                                language2 = Colors.redAccent;
                              });
                              //_checkFilter();
                            }
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: myBtn2(
                          height: 25,
                          width: 150,
                          color1: language3,
                          color2: Colors.black,
                          btnText: const Text(
                            'ARABIC',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 12),
                          ),
                          onPress: () {
                            _cleanColorLanguage();
                            if (mounted) {
                              setState(() {
                                globals.language = "Arabic";
                                language3 = Colors.redAccent;
                              });
                              //_checkFilter();
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                  const Divider(color: Colors.black),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Level: '),
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 6.0, left: 3.0, right: 3.0, bottom: 3.0),
                        child: myBtn2(
                          height: 25,
                          width: 150,
                          color1: level1,
                          color2: Colors.black,
                          btnText: const Text(
                            'BEGINNER',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 12),
                          ),
                          onPress: () {
                            _cleanColorLevel();
                            if (mounted) {
                              setState(() {
                                globals.level = "beginner";
                                level1 = Colors.indigo;
                              });
                              //_checkFilter();
                            }
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: myBtn2(
                          height: 25,
                          width: 150,
                          color1: level2,
                          color2: Colors.black,
                          btnText: const Text(
                            'INTERMEDIATE',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 12),
                          ),
                          onPress: () {
                            _cleanColorLevel();
                            if (mounted) {
                              setState(() {
                                globals.level = "intermediate";
                                level2 = Colors.indigo;
                              });
                              //_checkFilter();
                            }
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: myBtn2(
                          height: 25,
                          width: 150,
                          color1: level3,
                          color2: Colors.black,
                          btnText: const Text(
                            'ADVANCED',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 12),
                          ),
                          onPress: () {
                            _cleanColorLevel();
                            if (mounted) {
                              setState(() {
                                globals.level = "advanced";
                                level3 = Colors.indigo;
                              });
                              //_checkFilter();
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }


  _open() {
    showModalBottomSheet<void>(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.55,
          padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          decoration: BoxDecoration(
            color: globals.white,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          child: Drawer(
            child: Material(
              color: HexColor('#222222'), //globals.blue1,
              child: ScrollConfiguration(
                behavior: MyCustomScrollBehavior(),
                child: ListView(
                  controller: ScrollController(),
                  children: <Widget>[
                    Column(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 8.0),
                          child: Text('Type: '),
                        ),
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 6.0, left: 3.0, right: 3.0, bottom: 3.0),
                              child: myBtn2(
                                height: 25,
                                width: 150,
                                color1: type1,
                                color2: Colors.black,
                                btnText: const Text(
                                  'RED',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12),
                                ),
                                onPress: () {
                                  _cleanColorType();
                                  if (mounted) {
                                    setState(() {
                                      globals.type = "Language Lessons";
                                      type1 = Colors.yellowAccent;
                                    });
                                    //_checkFilter();
                                  }
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: myBtn2(
                                height: 25,
                                width: 150,
                                color1: type2,
                                color2: Colors.black,
                                btnText: const Text(
                                  'YELLOW',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12),
                                ),
                                onPress: () {
                                  _cleanColorType();
                                  if (mounted) {
                                    setState(() {
                                      globals.type = "Native Speaking";
                                      type2 = Colors.yellowAccent;
                                    });
                                    //_checkFilter();
                                  }
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: myBtn2(
                                height: 25,
                                width: 150,
                                color1: type3,
                                color2: Colors.black,
                                btnText: const Text(
                                  'GREEN',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12),
                                ),
                                onPress: () {
                                  _cleanColorType();
                                  if (mounted) {
                                    setState(() {
                                      globals.type = "Diploma Certificate";
                                      type3 = Colors.yellowAccent;
                                    });
                                    //_checkFilter();
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                        const Divider(color: Colors.black),
                        const Padding(
                          padding: EdgeInsets.only(left: 8.0),
                          child: Text('Language: '),
                        ),
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 6.0, left: 3.0, right: 3.0, bottom: 3.0),
                              child: myBtn2(
                                height: 25,
                                width: 150,
                                color1: language1,
                                color2: Colors.black,
                                btnText: const Text(
                                  'ENGLISH',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12),
                                ),
                                onPress: () {
                                  _cleanColorLanguage();
                                  if (mounted) {
                                    setState(() {
                                      globals.language = "English";
                                      language1 = Colors.redAccent;
                                    });
                                    //_checkFilter();
                                  }
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: myBtn2(
                                height: 25,
                                width: 150,
                                color1: language2,
                                color2: Colors.black,
                                btnText: const Text(
                                  'FRENCH',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12),
                                ),
                                onPress: () {
                                  _cleanColorLanguage();
                                  if (mounted) {
                                    setState(() {
                                      globals.language = "French";
                                      language2 = Colors.redAccent;
                                    });
                                    //_checkFilter();
                                  }
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: myBtn2(
                                height: 25,
                                width: 150,
                                color1: language3,
                                color2: Colors.black,
                                btnText: const Text(
                                  'ARABIC',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12),
                                ),
                                onPress: () {
                                  _cleanColorLanguage();
                                  if (mounted) {
                                    setState(() {
                                      globals.language = "Arabic";
                                      language3 = Colors.redAccent;
                                    });
                                    //_checkFilter();
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                        const Divider(color: Colors.black),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('Level: '),
                        ),
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 6.0, left: 3.0, right: 3.0, bottom: 3.0),
                              child: myBtn2(
                                height: 25,
                                width: 150,
                                color1: level1,
                                color2: Colors.black,
                                btnText: const Text(
                                  'BEGINNER',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12),
                                ),
                                onPress: () {
                                  _cleanColorLevel();
                                  if (mounted) {
                                    setState(() {
                                      globals.level = "beginner";
                                      level1 = Colors.indigo;
                                    });
                                    //_checkFilter();
                                  }
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: myBtn2(
                                height: 25,
                                width: 150,
                                color1: level2,
                                color2: Colors.black,
                                btnText: const Text(
                                  'INTERMEDIATE',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12),
                                ),
                                onPress: () {
                                  _cleanColorLevel();
                                  if (mounted) {
                                    setState(() {
                                      globals.level = "intermediate";
                                      level2 = Colors.indigo;
                                    });
                                    //_checkFilter();
                                  }
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: myBtn2(
                                height: 25,
                                width: 150,
                                color1: level3,
                                color2: Colors.black,
                                btnText: const Text(
                                  'ADVANCED',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12),
                                ),
                                onPress: () {
                                  _cleanColorLevel();
                                  if (mounted) {
                                    setState(() {
                                      globals.level = "advanced";
                                      level3 = Colors.indigo;
                                    });
                                    //_checkFilter();
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    ).then((exit) async {});
  }

  _cleanColorType() {
    if (mounted) {
      setState(() {
        type1 = HexColor('#dfe2e6');
        type2 = HexColor('#dfe2e6');
        type3 = HexColor('#dfe2e6');
      });
    }
  }

  _cleanColorLanguage() {
    if (mounted) {
      setState(() {
        language1 = HexColor('#dfe2e6');
        language2 = HexColor('#dfe2e6');
        language3 = HexColor('#dfe2e6');
      });
    }
  }

  _cleanColorLevel() {
    if (mounted) {
      setState(() {
        level1 = HexColor('#dfe2e6');
        level2 = HexColor('#dfe2e6');
        level3 = HexColor('#dfe2e6');
      });
    }
  }

  _back() {
    Navigator.pushNamedAndRemoveUntil(context, '/HomePage', (route) => false);
  }
}
