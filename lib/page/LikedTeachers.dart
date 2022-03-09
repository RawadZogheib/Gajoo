import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gajoo/widgets/other/MyFooter.dart';
import 'package:gajoo/widgets/HomePage/TeacherCard.dart';
import 'package:gajoo/widgets/other/Responsive.dart';
import 'package:gajoo/widgets/other/myDrawerMobile.dart';
import 'package:infinite_listview/infinite_listview.dart';
import 'package:gajoo/globals/globals.dart' as globals;

import 'package:gajoo/hexColor/hexColor.dart';
import 'package:gajoo/widgets/button/myButton.dart';
import 'package:gajoo/widgets/other/MyCustomScrollBehavior.dart';
import 'package:gajoo/widgets/other/myDrawer.dart';



class LikedTeachers extends StatefulWidget {
  String? type;
  String? languages;
  String? level;

  LikedTeachers({this.type, this.languages, this.level});

  @override
  _LikedTeachersState createState() => _LikedTeachersState();
}

class _LikedTeachersState extends State<LikedTeachers> {

  Timer? timer;

  final InfiniteScrollController _infiniteController = InfiniteScrollController(
    initialScrollOffset: 0.0,
  );

  final List<Widget> _LikedTeacherCard = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    globals.currentPage = "LikedTeachers";
    _choosedFilters();
    _loadNewPage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: myDrawerMobile(
        type: widget.type,
        languages: widget.languages,
        level: widget.level,
      ),
      endDrawer: myDrawer(),
      appBar: MediaQuery.of(context).size.width < 650
          ? AppBar(
        leading: Builder(
          builder: (context) => InkWell(
            child: const Icon(Icons.reorder),
            onTap: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
        actions: [
          Builder(
            builder: (context) => Row(
              children: [
                const Text(
                  'Liked Teachers',
                  style: TextStyle(
                      fontSize: 8, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  width: 12,
                ),
                InkWell(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  onTap: () => Scaffold.of(context).openEndDrawer(),
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
      )
          : null,
      body: Responsive(
        mobile: Builder(
          builder: (context) =>
              Column(
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
                ],
              ),
        ),
        tablet: Builder(
          builder: (context) => Column(
            children: [
              SizedBox(
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          'Assets/HomePage/logo.png',
                          height: 95,
                          width: 300,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(right: 20.0),
                      child: Row(
                        children: [
                          const Text(
                            'Liked Teachers',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          InkWell(
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            onTap: () => Scaffold.of(context).openEndDrawer(),
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
        desktop: Builder(
          builder: (context) => Column(
            children: [
              SizedBox(
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          'Assets/HomePage/logo.png',
                          height: 95,
                          width: 300,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(right: 20.0),
                      child: Row(
                        children: [
                          const Text(
                            'Liked Teachers',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          InkWell(
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            onTap: () => Scaffold.of(context).openEndDrawer(),
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
    _loadPage(); //1 -> INFINI
  }

  _loadPage() {   //for reload page each 30s
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

  void _loadLikedTeachers() {// load from db
    setState(() {
      _LikedTeacherCard.addAll([
        TeacherCard(
            Id: "1",
            text: 'Michel Nachar',
            imageUrl: 'Assets/HomePage/ProfilePicture/img1.png',
            subtitle: 'Arabic, French',
            isHeart: true,
            isHeartLikedTeacher: true,
            isButton: true,
            liked: true,
            onPressed: (Id) {
              setState(() {
                _LikedTeacherCard.remove(_LikedTeacherCard[int.parse(Id)]);
              });
              print(_LikedTeacherCard[Id]);
            }),
        TeacherCard(
            Id: "2",
            text: 'Rawad Zogheib',
            imageUrl: 'Assets/HomePage/ProfilePicture/img2.png',
            subtitle: 'ma 5asne bshi',
            isHeart: true,
            isHeartLikedTeacher: true,
            isButton: true,
            liked: true,
            onPressed: (Id) {
              setState(() {
                  _LikedTeacherCard.remove(_LikedTeacherCard[int.parse(Id)]);
              });
            }),
        TeacherCard(
            Id: "3",
            text: 'Rima Zogheib',
            imageUrl: 'Assets/HomePage/ProfilePicture/img3.png',
            subtitle: 'Arabic, French, English',
            isHeart: true,
            isHeartLikedTeacher: true,
            isButton: true,
            liked: true,
            onPressed: (Id) {
              setState(() {
                  _LikedTeacherCard.remove(_LikedTeacherCard[int.parse(Id)]);

              });
            }),
        TeacherCard(
            Id: "4",
            text: 'Ghada Zogheib',
            imageUrl: 'Assets/HomePage/ProfilePicture/img2.png',
            subtitle: 'English, Arabic, French',
            isHeart: true,
            isHeartLikedTeacher: true,
            isButton: true,
            liked: true,
            onPressed: (Id) {
              setState(() {
                  _LikedTeacherCard.remove(_LikedTeacherCard[int.parse(Id)]);
              });
            }),
        TeacherCard(
            Id: "5",
            text: 'Michel Nachar',
            imageUrl: 'Assets/HomePage/ProfilePicture/img1.png',
            subtitle: 'Arabic, French',
            isHeart: true,
            isHeartLikedTeacher: true,
            isButton: true,
            liked: true,
            onPressed: (Id) {
              setState(() {
                  _LikedTeacherCard.remove(_LikedTeacherCard[int.parse(Id)]);
              });
            }),
        TeacherCard(
            Id: "6",
            text: 'Rawad Zogheib',
            imageUrl: 'Assets/HomePage/ProfilePicture/img2.png',
            subtitle: 'ma 5asne bshi',
            isHeart: true,
            isButton: true,
            liked: true,
            onPressed: (Id) {
              setState(() {
                  _LikedTeacherCard.remove(_LikedTeacherCard[int.parse(Id)]);
              });
            }),
        TeacherCard(
            Id: "7",
            text: 'Rima Zogheib',
            imageUrl: 'Assets/HomePage/ProfilePicture/img3.png',
            subtitle: 'Arabic, French, English',
            isHeart: true,
            isButton: true,
            liked: true,
            onPressed: (Id) {
              setState(() {
                  _LikedTeacherCard.remove(_LikedTeacherCard[int.parse(Id)]);
              });
            }),
        TeacherCard(
            Id: "8",
            text: 'Ghada Zogheib',
            imageUrl: 'Assets/HomePage/ProfilePicture/img2.png',
            subtitle: 'English, Arabic, French',
            isHeart: true,
            isButton: true,
            liked: true,
            onPressed: (Id) {
              setState(() {
                  _LikedTeacherCard.remove(_LikedTeacherCard[int.parse(Id)]);
              });
            }),
        TeacherCard(
            Id: "9",
            text: 'Michel Nachar',
            imageUrl: 'Assets/HomePage/ProfilePicture/img1.png',
            subtitle: 'Arabic, French',
            isHeart: true,
            isButton: true,
            liked: true,
            onPressed: (Id) {
              setState(() {
                  _LikedTeacherCard.remove(_LikedTeacherCard[int.parse(Id)]);
              });
            }),
        TeacherCard(
            Id: "10",
            text: 'Rawad Zogheib',
            imageUrl: 'Assets/HomePage/ProfilePicture/img2.png',
            subtitle: 'ma 5asne bshi',
            isHeart: true,
            isButton: true,
            liked: true,
            onPressed: (Id) {
              setState(() {
                  _LikedTeacherCard.remove(_LikedTeacherCard[int.parse(Id)]);
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

    if (widget.languages == "english") {
      if (mounted) {
        setState(() {
          language1 = Colors.redAccent;
        });
      }
    } else if (widget.languages == "french") {
      if (mounted) {
        setState(() {
          language2 = Colors.redAccent;
        });
      }
    } else if (widget.languages == "arabic") {
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
}
