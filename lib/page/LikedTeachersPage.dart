import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gajoo/globals/globals.dart' as globals;
import 'package:gajoo/hexColor/hexColor.dart';
import 'package:gajoo/widgets/HomePage/TeacherCard.dart';
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

  final List<TeacherCard> _LikedTeacherCard = [];

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
        drawer: myDrawerMobile(
          type: widget.type,
          languages: widget.languages,
          level: widget.level,
        ),
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
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(12.5),
                                            color: Colors.white70,
                                          ),
                                          child: Expanded(
                                            child: Wrap(
                                              children: _LikedTeacherCard,
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
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(12.5),
                                            color: Colors.white70,
                                          ),
                                          child: Wrap(
                                            children: _LikedTeacherCard,
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
                        Positioned(
                          left: 35,
                          child: Container(
                            padding: const EdgeInsets.all(18.0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.5),
                                color: Colors.white),
                            width: 200,
                            height: 480,
                            child: Column(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(left: 8.0),
                                  child: Text('Type: '),
                                ),
                                Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 6.0,
                                          left: 3.0,
                                          right: 3.0,
                                          bottom: 3.0),
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
                                              type1 = Colors.yellowAccent;
                                            });
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
                                              type2 = Colors.yellowAccent;
                                            });
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
                                              type3 = Colors.yellowAccent;
                                            });
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
                                          top: 6.0,
                                          left: 3.0,
                                          right: 3.0,
                                          bottom: 3.0),
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
                                              language1 = Colors.redAccent;
                                            });
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
                                              language2 = Colors.redAccent;
                                            });
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
                                              language3 = Colors.redAccent;
                                            });
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
                                          top: 6.0,
                                          left: 3.0,
                                          right: 3.0,
                                          bottom: 3.0),
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
                                              level1 = Colors.indigo;
                                            });
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
                                              level2 = Colors.indigo;
                                            });
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
                                              level3 = Colors.indigo;
                                            });
                                          }
                                        },
                                      ),
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
              ],
            ),
          desktop: Column(
              children: [
                const MyHeader(),
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
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(12.5),
                                            color: Colors.white70,
                                          ),
                                          child: Wrap(
                                            children: _LikedTeacherCard,
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
                        Positioned(
                          left: 35,
                          child: Container(
                            padding: const EdgeInsets.all(18.0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.5),
                                color: Colors.white),
                            width: 200,
                            height: 480,
                            child: Column(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(left: 8.0),
                                  child: Text('Type: '),
                                ),
                                Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 6.0,
                                          left: 3.0,
                                          right: 3.0,
                                          bottom: 3.0),
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
                                              type1 = Colors.yellowAccent;
                                            });
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
                                              type2 = Colors.yellowAccent;
                                            });
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
                                              type3 = Colors.yellowAccent;
                                            });
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
                                          top: 6.0,
                                          left: 3.0,
                                          right: 3.0,
                                          bottom: 3.0),
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
                                              language1 = Colors.redAccent;
                                            });
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
                                              language2 = Colors.redAccent;
                                            });
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
                                              language3 = Colors.redAccent;
                                            });
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
                                          top: 6.0,
                                          left: 3.0,
                                          right: 3.0,
                                          bottom: 3.0),
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
                                              level1 = Colors.indigo;
                                            });
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
                                              level2 = Colors.indigo;
                                            });
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
                                              level3 = Colors.indigo;
                                            });
                                          }
                                        },
                                      ),
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
              ],
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
        _loadLikedTeachers();
      } else {
        print(
            '=========<<======================================================<<==================================================<<=========');
      }
    });
  }

  void _loadLikedTeachers() {
    // load from db
    setState(() {
      _LikedTeacherCard.clear();
      _LikedTeacherCard.addAll([
        TeacherCard(
            Id: "1",
            name: 'Michel Nachar',
            imageUrl: 'Assets/HomePage/ProfilePicture/img1.png',
            languageView: {},
            isHeart: true,
            isHeartLikedTeacher: true,
            isButton: true,
            listOfCharacteristic_t: [],
            liked: true,
            isHidden: false,
            isHidable: true,
            onPressed: (Id) {
              setState(() {
                _LikedTeacherCard.removeWhere((element) => element.Id == Id);
              });
            }),
        TeacherCard(
            Id: "2",
            name: 'Rawad Zogheib',
            imageUrl: 'Assets/HomePage/ProfilePicture/img2.png',
            languageView: {},
            isHeart: true,
            isHeartLikedTeacher: true,
            isButton: true,
            listOfCharacteristic_t: [],
            liked: true,
            isHidden: false,
            isHidable: true,
            onPressed: (Id) {
              setState(() {
                _LikedTeacherCard.removeWhere((element) => element.Id == Id);
              });
            }),
        TeacherCard(
            Id: "3",
            name: 'Rima Zogheib',
            imageUrl: 'Assets/HomePage/ProfilePicture/img3.png',
            languageView: {},
            isHeart: true,
            isHeartLikedTeacher: true,
            isButton: true,
            listOfCharacteristic_t: [],
            liked: true,
            isHidden: false,
            isHidable: true,
            onPressed: (Id) {
              setState(() {
                _LikedTeacherCard.removeWhere((element) => element.Id == Id);
              });
            }),
        TeacherCard(
            Id: "4",
            name: 'Ghada Zogheib',
            imageUrl: 'Assets/HomePage/ProfilePicture/img2.png',
            languageView: {},
            isHeart: true,
            isHeartLikedTeacher: true,
            isButton: true,
            listOfCharacteristic_t: [],
            liked: true,
            isHidden: false,
            isHidable: true,
            onPressed: (Id) {
              setState(() {
                _LikedTeacherCard.removeWhere((element) => element.Id == Id);
              });
            }),
        TeacherCard(
            Id: "5",
            name: 'Michel Nachar',
            imageUrl: 'Assets/HomePage/ProfilePicture/img1.png',
            languageView: {},
            isHeart: true,
            isHeartLikedTeacher: true,
            isButton: true,
            listOfCharacteristic_t: [],
            liked: true,
            isHidden: false,
            isHidable: true,
            onPressed: (Id) {
              setState(() {
                _LikedTeacherCard.removeWhere((element) => element.Id == Id);
              });
            }),
        TeacherCard(
            Id: "6",
            name: 'Rawad Zogheib',
            imageUrl: 'Assets/HomePage/ProfilePicture/img2.png',
            languageView: {},
            isHeart: true,
            isButton: true,
            listOfCharacteristic_t: [],
            liked: true,
            isHidden: false,
            isHidable: true,
            onPressed: (Id) {
              setState(() {
                _LikedTeacherCard.removeWhere((element) => element.Id == Id);
              });
            }),
        TeacherCard(
            Id: "7",
            name: 'Rima Zogheib',
            imageUrl: 'Assets/HomePage/ProfilePicture/img3.png',
            languageView: {},
            isHeart: true,
            isButton: true,
            listOfCharacteristic_t: [],
            liked: true,
            isHidden: false,
            isHidable: true,
            onPressed: (Id) {
              setState(() {
                _LikedTeacherCard.removeWhere((element) => element.Id == Id);
              });
            }),
        TeacherCard(
            Id: "8",
            name: 'Ghada Zogheib',
            imageUrl: 'Assets/HomePage/ProfilePicture/img2.png',
            languageView: {},
            isHeart: true,
            isButton: true,
            listOfCharacteristic_t: [],
            liked: true,
            isHidden: false,
            isHidable: true,
            onPressed: (Id) {
              setState(() {
                // for(int i = 0; i<_LikedTeacherCard.length; i++){
                //   if(_LikedTeacherCard[i].Id == Id){
                //     _LikedTeacherCard.removeAt(i);
                //   }
                // }
                _LikedTeacherCard.removeWhere((element) => element.Id == Id);
              });
            }),
        TeacherCard(
            Id: "9",
            name: 'Michel Nachar',
            imageUrl: 'Assets/HomePage/ProfilePicture/img1.png',
            languageView: {},
            isHeart: true,
            isButton: true,
            listOfCharacteristic_t: [],
            liked: true,
            isHidden: false,
            isHidable: true,
            onPressed: (Id) {
              setState(() {
                _LikedTeacherCard.removeWhere((element) => element.Id == Id);
              });
            }),
        TeacherCard(
            Id: "10",
            name: 'Rawad Zogheib',
            imageUrl: 'Assets/HomePage/ProfilePicture/img2.png',
            languageView: {},
            isHeart: true,
            isButton: true,
            listOfCharacteristic_t: [],
            liked: true,
            isHidden: false,
            isHidable: true,
            onPressed: (Id) {
              setState(() {
                _LikedTeacherCard.removeWhere((element) => element.Id == Id);
              });
            }),
      ]);
    });
  }

  _choosedFilters() {
    if (widget.type == "red") {
      if (mounted) {
        setState(() {
          type1 = Colors.yellowAccent;
        });
      }
    } else if (widget.type == "yellow") {
      if (mounted) {
        setState(() {
          type2 = Colors.yellowAccent;
        });
      }
    } else if (widget.type == "green") {
      if (mounted) {
        setState(() {
          type3 = Colors.yellowAccent;
        });
      }
    }

    if (widget.languages == "English") {
      if (mounted) {
        setState(() {
          language1 = Colors.redAccent;
        });
      }
    } else if (widget.languages == "French") {
      if (mounted) {
        setState(() {
          language2 = Colors.redAccent;
        });
      }
    } else if (widget.languages == "Arabic") {
      if (mounted) {
        setState(() {
          language3 = Colors.redAccent;
        });
      }
    }

    if (widget.level == "beginner") {
      if (mounted) {
        setState(() {
          level1 = Colors.indigo;
        });
      }
    } else if (widget.level == "intermediate") {
      if (mounted) {
        setState(() {
          level2 = Colors.indigo;
        });
      }
    } else if (widget.level == "advanced") {
      if (mounted) {
        setState(() {
          level3 = Colors.indigo;
        });
      }
    }
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
    Navigator.pushNamedAndRemoveUntil(context, '/Teacher', (route) => false);
  }
}
