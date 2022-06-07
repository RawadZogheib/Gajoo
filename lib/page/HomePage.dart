import 'dart:async';
import 'dart:convert';
import 'dart:math' as math;

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:gajoo/api/my_api.dart';
import 'package:gajoo/api/my_session.dart';
import 'package:gajoo/globals/globals.dart' as globals;
import 'package:gajoo/hexColor/hexColor.dart';
import 'package:gajoo/widgets/HomePage/CustomImage.dart';
import 'package:gajoo/widgets/HomePage/ImagePagination.dart';
import 'package:gajoo/widgets/HomePage/TeacherCard.dart';
import 'package:gajoo/widgets/HomePage/animatedLogo.dart';
import 'package:gajoo/widgets/PopUp/AlertDialogLangLvl.dart';
import 'package:gajoo/widgets/other/MyCustomScrollBehavior.dart';
import 'package:gajoo/widgets/other/MyFooter.dart';
import 'package:gajoo/widgets/other/MyHeader.dart';
import 'package:gajoo/widgets/other/Responsive.dart';
import 'package:gajoo/widgets/other/myDrawer.dart';
import 'package:infinite_listview/infinite_listview.dart';

import '../widgets/PopUp/errorWarningPopup.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int webViewsCounter = 2000;
  int webStudentsEnrolled = 120;
  int webTeachersCounter = 17;

  final String _text1 =
      'The history of textbooks dates back to ancient civilizations. For example, Ancient Greeks wrote educational texts. The modern textbook has its roots in the mass production made possible by the printing press. Johannes Gutenberg himself may have printed editions of Ars Minor, a schoolbook on Latin grammar by Aelius Donatus.';
  final String _text2 =
      '\n The history of textbooks dates back to ancient civilizations. For example, Ancient Greeks wrote educational texts. ';

  final List<CustomImage> _img = [
    CustomImage(
      imageName: 'Assets/HomePage/CoverImage/img1.webp',
    ),
    CustomImage(
      imageName: 'Assets/HomePage/CoverImage/img2.jpg',
    ),
    CustomImage(
      imageName: 'Assets/HomePage/CoverImage/img3.jpg',
    ),
    CustomImage(
      imageName: 'Assets/HomePage/CoverImage/img0.jpg',
    ),
  ];

  final List<Widget> _coreTeam = [
    TeacherCard(
        Id: '1',
        name: 'Ghada Zogheib',
        age: "24",
        NbOfCourses: "45",
        NbOfCoursesReserved: "40",
        NbOfCoursesLeft: "5",
        imageUrl: 'Assets/HomePage/ProfilePicture/img1.png',
        languageView: {},
        isHeart: false,
        isButton: false,
        listOfCharacteristic_t: [],
        liked: false,
        isHidden: false,
        isHidable: false,
        onPressed: (Id) {},),
    TeacherCard(
        Id: '1',
        name: 'Michel Nachar',
        age: "24",
        NbOfCourses: "45",
        NbOfCoursesReserved: "40",
        NbOfCoursesLeft: "5",
        imageUrl: 'Assets/HomePage/ProfilePicture/img2.png',
        languageView: {},
        isHeart: false,
        isButton: false,
        listOfCharacteristic_t: [],
        liked: false,
        isHidden: false,
        isHidable: false,
        onPressed: (Id) {}),
  ];


  List<TeacherCard> _TeacherCardList = [];
  var _age;
  int _key = 0;
  int _currentActive = 0;
  late Timer _timer;
  final int _duration = 5;
  late Color _pageColor;

  final double carouselItemMargin = 16;
  final InfiniteScrollController _infiniteController = InfiniteScrollController(
    initialScrollOffset: 0.0,
  );

  // late PageController _pageController;
  // int _position = 0;
  //
  // final ScrollController _controller = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    globals.currentPage = 'HomePage';
    super.initState();
    _loadTeachers();

    //_pageController = PageController(initialPage: 0, viewportFraction: .2);
    _timer = Timer.periodic(Duration(seconds: _duration), (Timer t) async {
      print('$_duration sec passed');
      setState(() {
        _currentActive = ++_currentActive % _img.length;
        print(_currentActive);
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
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
        body: Responsive(
          mobile: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // const MyHeader(),
              Expanded(
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(32.0),
                    topLeft: Radius.circular(32.0),
                    bottomRight: Radius.circular(0.0),
                    bottomLeft: Radius.circular(0.0),
                  ),
                  child: ScrollConfiguration(
                    behavior: MyCustomScrollBehavior(),
                    child: ListView(
                      controller: ScrollController(),
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              ClipRRect(
                                borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(32.0),
                                  topLeft: Radius.circular(32.0),
                                  bottomRight: Radius.circular(32.0),
                                  bottomLeft: Radius.circular(32.0),
                                ),
                                child: Container(
                                  height: _height * 0.85,
                                  width: _width,
                                  color: Colors.white,
                                  child: _img[_currentActive],
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 16.0),
                                  child: ImagePagination(
                                    currentActive: _currentActive,
                                    onTapRed: () async {
                                      setState(() {
                                        _currentActive = 0;
                                      });
                                      _timer.cancel();
                                      _timer = Timer.periodic(
                                          Duration(seconds: _duration),
                                              (Timer t) {
                                            print('$_duration sec passed');
                                            setState(() {
                                              _currentActive =
                                                  ++_currentActive % _img.length;
                                              print(_currentActive);
                                            });
                                          });
                                    },
                                    onTapYellow: () async {
                                      setState(() {
                                        _currentActive = 1;
                                      });
                                      _timer.cancel();
                                      _timer = Timer.periodic(
                                          Duration(seconds: _duration),
                                              (Timer t) {
                                            print('$_duration sec passed');
                                            setState(() {
                                              _currentActive =
                                                  ++_currentActive % _img.length;
                                              print(_currentActive);
                                            });
                                          });
                                    },
                                    onTapBlue: () async {
                                      setState(() {
                                        _currentActive = 2;
                                      });
                                      _timer.cancel();
                                      _timer = Timer.periodic(
                                          Duration(seconds: _duration),
                                              (Timer t) {
                                            print('$_duration sec passed');
                                            setState(() {
                                              _currentActive =
                                                  ++_currentActive % _img.length;
                                              print(_currentActive);
                                            });
                                          });
                                    },
                                    onTapGreen: () async {
                                      setState(() {
                                        _currentActive = 3;
                                      });
                                      _timer.cancel();
                                      _timer = Timer.periodic(
                                          Duration(seconds: _duration),
                                              (Timer t) {
                                            print('$_duration sec passed');
                                            setState(() {
                                              _currentActive =
                                                  ++_currentActive % _img.length;
                                              print(_currentActive);
                                            });
                                          });
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height:
                          MediaQuery.of(context).size.height * 0.4,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              DefaultTextStyle(
                                style: const TextStyle(
                                    fontSize: 22,
                                    fontFamily: 'Bobbers',
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                                child: AnimatedTextKit(
                                  repeatForever: true,
                                  animatedTexts: [
                                    RotateAnimatedText('Views Counter:   '),
                                    RotateAnimatedText(
                                        'Students  Enrolled:   '),
                                    RotateAnimatedText(
                                        'Teachers Counter:   '),
                                  ],
                                ),
                              ),
                              DefaultTextStyle(
                                style: const TextStyle(
                                    fontSize: 60,
                                    fontFamily: 'Bobbers',
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                                child: AnimatedTextKit(
                                  repeatForever: true,
                                  animatedTexts: [
                                    RotateAnimatedText(
                                        webViewsCounter.toString()),
                                    RotateAnimatedText(
                                        webStudentsEnrolled.toString()),
                                    RotateAnimatedText(
                                        webTeachersCounter.toString()),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          children: [
                            ClipRRect(
                              borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(32.0),
                                topLeft: Radius.circular(32.0),
                                bottomRight: Radius.circular(32.0),
                                bottomLeft: Radius.circular(32.0),
                              ),
                              child: Container(
                                height:
                                MediaQuery.of(context).size.height * 0.45,
                                width:
                                MediaQuery.of(context).size.width * 0.95,
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  image: DecorationImage(
                                    image: AssetImage(
                                      'Assets/HomePage/Other/img1.png',
                                    ),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                child: Container(
                                  padding: const EdgeInsets.all(28.0),
                                  alignment: Alignment.topCenter,
                                  child: Text(
                                    _text1,
                                    style: const TextStyle(fontSize: 30),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),
                            const Text(
                              'Who we are',
                              style: TextStyle(
                                fontSize: 44,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 100,
                        ),
                        ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(32.0),
                            topLeft: Radius.circular(32.0),
                            bottomRight: Radius.circular(32.0),
                            bottomLeft: Radius.circular(32.0),
                          ),
                          child: Column(
                            children: [
                              ClipRRect(
                                borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(32.0),
                                  topLeft: Radius.circular(32.0),
                                  bottomRight: Radius.circular(32.0),
                                  bottomLeft: Radius.circular(32.0),
                                ),
                                child: Container(
                                  height: MediaQuery.of(context).size.height *
                                      0.45,
                                  width: MediaQuery.of(context).size.width *
                                      0.95,
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    image: DecorationImage(
                                        alignment: Alignment.bottomCenter,
                                        image: AssetImage(
                                          'Assets/HomePage/Other/img2.png',
                                        ),
                                        fit: BoxFit.fill),
                                  ),
                                  child: Container(
                                    padding: const EdgeInsets.all(28.0),
                                    alignment: Alignment.topCenter,
                                    child: Text(
                                      _text2,
                                      style: const TextStyle(fontSize: 30),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ),
                              const Text(
                                'Our Mission',
                                style: TextStyle(
                                  fontSize: 44,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 100,//
                        ),
                        Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(8.0),
                          child: AnimatedLogo(
                            onTapRed: () {
                              globals.type = "Language Lessons";
                              _pageColor = HexColor("#ec3227");
                              _checkIfIsLoggedIn();
                              print('Language Lessons');
                            },
                            onTapYellow: () {
                              globals.type = "Native Speaking";
                              _pageColor = HexColor("#f3b70c");
                              _checkIfIsLoggedIn();
                              print('Native Speaking');
                            },
                            onTapBlue: () {
                              globals.type = "Audio Books";
                              _pageColor = Colors.blueAccent;
                              _checkIfIsLoggedInBlue();
                              print('Audio Books');
                            },
                            onTapGreen: () {
                              globals.type = "Diploma Certificate";
                              _pageColor = HexColor("#37ae44");
                              _checkIfIsLoggedIn();
                              print('Diploma Certificate');
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 100,//
                        ),
                        Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(8.0),
                          child: const Text(
                            'Core Team',
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(32.0),
                              topLeft: Radius.circular(32.0),
                              bottomRight: Radius.circular(32.0),
                              bottomLeft: Radius.circular(32.0),
                            ),
                            child: Container(
                              height: 260,
                              width: 250,
                              color: Colors.white70,
                              child: ScrollConfiguration(
                                //ScrollBehavior can be set for a specific widget.
                                behavior: MyCustomScrollBehavior(),
                                child: InfiniteListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    controller: _infiniteController,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return _coreTeam[index % _coreTeam.length];
                                    }),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(8.0),
                          child: const Text(
                            'Teachers',
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(32.0),
                              topLeft: Radius.circular(32.0),
                              bottomRight: Radius.circular(32.0),
                              bottomLeft: Radius.circular(32.0),
                            ),
                            child: Container(
                              height: 260,
                              width: 250,
                              color: Colors.white70,
                              child: ScrollConfiguration(
                                //ScrollBehavior can be set for a specific widget.
                                behavior: MyCustomScrollBehavior(),
                                child: InfiniteListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    controller: _infiniteController,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      //print(index % _teachers.length);
                                      return _TeacherCardList[index % _TeacherCardList.length];
                                    }),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 100,
                        ),
                        const MyFooter(),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          tablet: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const MyHeader(),
              Expanded(
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(32.0),
                    topLeft: Radius.circular(32.0),
                    bottomRight: Radius.circular(0.0),
                    bottomLeft: Radius.circular(0.0),
                  ),
                  child: ScrollConfiguration(
                    behavior: MyCustomScrollBehavior(),
                    child: ListView(
                      controller: ScrollController(),
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              ClipRRect(
                                borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(32.0),
                                  topLeft: Radius.circular(32.0),
                                  bottomRight: Radius.circular(32.0),
                                  bottomLeft: Radius.circular(32.0),
                                ),
                                child: Container(
                                  height: _height * 0.85,
                                  width: _width,
                                  color: Colors.white,
                                  child: _img[_currentActive],
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 16.0),
                                  child: ImagePagination(
                                    currentActive: _currentActive,
                                    onTapRed: () async {
                                      setState(() {
                                        _currentActive = 0;
                                      });
                                      _timer.cancel();
                                      _timer = Timer.periodic(
                                          Duration(seconds: _duration),
                                              (Timer t) {
                                            print('$_duration sec passed');
                                            setState(() {
                                              _currentActive =
                                                  ++_currentActive % _img.length;
                                              print(_currentActive);
                                            });
                                          });
                                    },
                                    onTapYellow: () async {
                                      setState(() {
                                        _currentActive = 1;
                                      });
                                      _timer.cancel();
                                      _timer = Timer.periodic(
                                          Duration(seconds: _duration),
                                              (Timer t) {
                                            print('$_duration sec passed');
                                            setState(() {
                                              _currentActive =
                                                  ++_currentActive % _img.length;
                                              print(_currentActive);
                                            });
                                          });
                                    },
                                    onTapBlue: () async {
                                      setState(() {
                                        _currentActive = 2;
                                      });
                                      _timer.cancel();
                                      _timer = Timer.periodic(
                                          Duration(seconds: _duration),
                                              (Timer t) {
                                            print('$_duration sec passed');
                                            setState(() {
                                              _currentActive =
                                                  ++_currentActive % _img.length;
                                              print(_currentActive);
                                            });
                                          });
                                    },
                                    onTapGreen: () async {
                                      setState(() {
                                        _currentActive = 3;
                                      });
                                      _timer.cancel();
                                      _timer = Timer.periodic(
                                          Duration(seconds: _duration),
                                              (Timer t) {
                                            print('$_duration sec passed');
                                            setState(() {
                                              _currentActive =
                                                  ++_currentActive % _img.length;
                                              print(_currentActive);
                                            });
                                          });
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height:
                          MediaQuery.of(context).size.height * 0.4,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              DefaultTextStyle(
                                style: const TextStyle(
                                    fontSize: 30,
                                    fontFamily: 'Bobbers',
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                                child: AnimatedTextKit(
                                  repeatForever: true,
                                  animatedTexts: [
                                    RotateAnimatedText('Views Counter:   '),
                                    RotateAnimatedText(
                                        'Students  Enrolled:   '),
                                    RotateAnimatedText(
                                        'Teachers Counter:   '),
                                  ],
                                ),
                              ),
                              DefaultTextStyle(
                                style: const TextStyle(
                                    fontSize: 100,
                                    fontFamily: 'Bobbers',
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                                child: AnimatedTextKit(
                                  repeatForever: true,
                                  animatedTexts: [
                                    RotateAnimatedText(
                                        webViewsCounter.toString()),
                                    RotateAnimatedText(
                                        webStudentsEnrolled.toString()),
                                    RotateAnimatedText(
                                        webTeachersCounter.toString()),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          children: [
                            ClipRRect(
                              borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(32.0),
                                topLeft: Radius.circular(32.0),
                                bottomRight: Radius.circular(32.0),
                                bottomLeft: Radius.circular(32.0),
                              ),
                              child: Container(
                                height:
                                MediaQuery.of(context).size.height * 0.45,
                                width:
                                MediaQuery.of(context).size.width * 0.95,
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  image: DecorationImage(
                                    image: AssetImage(
                                      'Assets/HomePage/Other/img1.png',
                                    ),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                child: Container(
                                  padding: const EdgeInsets.all(28.0),
                                  alignment: Alignment.topCenter,
                                  child: Text(
                                    _text1,
                                    style: const TextStyle(fontSize: 30),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),
                            const Text(
                              'Who we are',
                              style: TextStyle(
                                fontSize: 44,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 100,
                        ),
                        ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(32.0),
                            topLeft: Radius.circular(32.0),
                            bottomRight: Radius.circular(32.0),
                            bottomLeft: Radius.circular(32.0),
                          ),
                          child: Column(
                            children: [
                              ClipRRect(
                                borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(32.0),
                                  topLeft: Radius.circular(32.0),
                                  bottomRight: Radius.circular(32.0),
                                  bottomLeft: Radius.circular(32.0),
                                ),
                                child: Container(
                                  height: MediaQuery.of(context).size.height *
                                      0.45,
                                  width: MediaQuery.of(context).size.width *
                                      0.95,
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    image: DecorationImage(
                                        alignment: Alignment.bottomCenter,
                                        image: AssetImage(
                                          'Assets/HomePage/Other/img2.png',
                                        ),
                                        fit: BoxFit.fill),
                                  ),
                                  child: Container(
                                    padding: const EdgeInsets.all(28.0),
                                    alignment: Alignment.topCenter,
                                    child: Text(
                                      _text2,
                                      style: const TextStyle(fontSize: 30),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ),
                              const Text(
                                'Our Mission',
                                style: TextStyle(
                                  fontSize: 44,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 100,//
                        ),
                        Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(8.0),
                          child: AnimatedLogo(
                            onTapRed: () {
                              globals.type = "Language Lessons";
                              _pageColor = HexColor("#ec3227");
                              _checkIfIsLoggedIn();
                              print('Language Lessons');
                            },
                            onTapYellow: () {
                              globals.type = "Native Speaking";
                              _pageColor = HexColor("#f3b70c");
                              _checkIfIsLoggedIn();
                              print('Native Speaking');
                            },
                            onTapBlue: () {
                              globals.type = "Audio Books";
                              _pageColor = Colors.blueAccent;
                              _checkIfIsLoggedInBlue();
                              print('Audio Books');
                            },
                            onTapGreen: () {
                              globals.type = "Diploma Certificate";
                              _pageColor = HexColor("#37ae44");
                              _checkIfIsLoggedIn();
                              print('Diploma Certificate');
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 100,//
                        ),
                        Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(8.0),
                          child: const Text(
                            'Core Team',
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(32.0),
                              topLeft: Radius.circular(32.0),
                              bottomRight: Radius.circular(32.0),
                              bottomLeft: Radius.circular(32.0),
                            ),
                            child: Container(
                              height: 260,
                              width: 250,
                              color: Colors.white70,
                              child: ScrollConfiguration(
                                //ScrollBehavior can be set for a specific widget.
                                behavior: MyCustomScrollBehavior(),
                                child: InfiniteListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    controller: _infiniteController,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return _coreTeam[index % _coreTeam.length];
                                    }),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(8.0),
                          child: const Text(
                            'Teachers',
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(32.0),
                              topLeft: Radius.circular(32.0),
                              bottomRight: Radius.circular(32.0),
                              bottomLeft: Radius.circular(32.0),
                            ),
                            child: Container(
                              height: 260,
                              width: 250,
                              color: Colors.white70,
                              child: ScrollConfiguration(
                                //ScrollBehavior can be set for a specific widget.
                                behavior: MyCustomScrollBehavior(),
                                child: InfiniteListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    controller: _infiniteController,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      //print(index % _teachers.length);
                                      return _TeacherCardList[index % _TeacherCardList.length];
                                    }),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 100,
                        ),
                        const MyFooter(),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          desktop: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const MyHeader(),
              Expanded(
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(32.0),
                    topLeft: Radius.circular(32.0),
                    bottomRight: Radius.circular(0.0),
                    bottomLeft: Radius.circular(0.0),
                  ),
                  child: ScrollConfiguration(
                    behavior: MyCustomScrollBehavior(),
                    child: ListView(
                      controller: ScrollController(),
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              ClipRRect(
                                borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(32.0),
                                  topLeft: Radius.circular(32.0),
                                  bottomRight: Radius.circular(32.0),
                                  bottomLeft: Radius.circular(32.0),
                                ),
                                child: Container(
                                  height: _height * 0.85,
                                  width: _width,
                                  color: Colors.white,
                                  child: _img[_currentActive],
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 16.0),
                                  child: ImagePagination(
                                    currentActive: _currentActive,
                                    onTapRed: () async {
                                      setState(() {
                                        _currentActive = 0;
                                      });
                                      _timer.cancel();
                                      _timer = Timer.periodic(
                                          Duration(seconds: _duration),
                                          (Timer t) {
                                        print('$_duration sec passed');
                                        setState(() {
                                          _currentActive =
                                              ++_currentActive % _img.length;
                                          print(_currentActive);
                                        });
                                      });
                                    },
                                    onTapYellow: () async {
                                      setState(() {
                                        _currentActive = 1;
                                      });
                                      _timer.cancel();
                                      _timer = Timer.periodic(
                                          Duration(seconds: _duration),
                                          (Timer t) {
                                        print('$_duration sec passed');
                                        setState(() {
                                          _currentActive =
                                              ++_currentActive % _img.length;
                                          print(_currentActive);
                                        });
                                      });
                                    },
                                    onTapBlue: () async {
                                      setState(() {
                                        _currentActive = 2;
                                      });
                                      _timer.cancel();
                                      _timer = Timer.periodic(
                                          Duration(seconds: _duration),
                                          (Timer t) {
                                        print('$_duration sec passed');
                                        setState(() {
                                          _currentActive =
                                              ++_currentActive % _img.length;
                                          print(_currentActive);
                                        });
                                      });
                                    },
                                    onTapGreen: () async {
                                      setState(() {
                                        _currentActive = 3;
                                      });
                                      _timer.cancel();
                                      _timer = Timer.periodic(
                                          Duration(seconds: _duration),
                                          (Timer t) {
                                        print('$_duration sec passed');
                                        setState(() {
                                          _currentActive =
                                              ++_currentActive % _img.length;
                                          print(_currentActive);
                                        });
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 150,//
                        ),
                        Row(
                          children: [
                            const SizedBox(
                              width: 20,
                            ),
                            Column(
                              children: [
                                ClipRRect(
                                  borderRadius: const BorderRadius.only(
                                    topRight: Radius.circular(32.0),
                                    topLeft: Radius.circular(32.0),
                                    bottomRight: Radius.circular(32.0),
                                    bottomLeft: Radius.circular(32.0),
                                  ),
                                  child: Container(
                                    height:
                                        MediaQuery.of(context).size.height * 0.45,
                                    width:
                                        MediaQuery.of(context).size.width * 0.45,
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                      image: DecorationImage(
                                        image: AssetImage(
                                          'Assets/HomePage/Other/img1.png',
                                        ),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    child: Container(
                                      padding: const EdgeInsets.all(28.0),
                                      alignment: Alignment.topCenter,
                                      child: Text(
                                        _text1,
                                        style: const TextStyle(fontSize: 30),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                ),
                                const Text(
                                  'Who we are',
                                  style: TextStyle(
                                    fontSize: 44,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              child: SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.45 +
                                        44,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    DefaultTextStyle(
                                      style: const TextStyle(
                                          fontSize: 35,
                                          fontFamily: 'Bobbers',
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                      child: AnimatedTextKit(
                                        repeatForever: true,
                                        animatedTexts: [
                                          RotateAnimatedText('Views Counter:   '),
                                          RotateAnimatedText(
                                              'Students  Enrolled:   '),
                                          RotateAnimatedText(
                                              'Teachers Counter:   '),
                                        ],
                                      ),
                                    ),
                                    DefaultTextStyle(
                                      style: const TextStyle(
                                          fontSize: 100,
                                          fontFamily: 'Bobbers',
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                      child: AnimatedTextKit(
                                        repeatForever: true,
                                        animatedTexts: [
                                          RotateAnimatedText(
                                              webViewsCounter.toString()),
                                          RotateAnimatedText(
                                              webStudentsEnrolled.toString()),
                                          RotateAnimatedText(
                                              webTeachersCounter.toString()),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(32.0),
                            topLeft: Radius.circular(32.0),
                            bottomRight: Radius.circular(32.0),
                            bottomLeft: Radius.circular(32.0),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                child: Container(),
                              ),
                              Stack(
                                clipBehavior: Clip.none,
                                alignment: Alignment.center,
                                children: [
                                  ClipRRect(
                                    borderRadius: const BorderRadius.only(
                                      topRight: Radius.circular(32.0),
                                      topLeft: Radius.circular(32.0),
                                      bottomRight: Radius.circular(32.0),
                                      bottomLeft: Radius.circular(32.0),
                                    ),
                                    child: Container(
                                      height: MediaQuery.of(context).size.height *
                                          0.45,
                                      width: MediaQuery.of(context).size.width *
                                          0.45,
                                      decoration: const BoxDecoration(
                                        color: Colors.white,
                                        image: DecorationImage(
                                            alignment: Alignment.bottomCenter,
                                            image: AssetImage(
                                              'Assets/HomePage/Other/img2.png',
                                            ),
                                            fit: BoxFit.fill),
                                      ),
                                      child: Container(
                                        padding: const EdgeInsets.all(28.0),
                                        alignment: Alignment.topCenter,
                                        child: Text(
                                          _text2,
                                          style: const TextStyle(fontSize: 30),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: -160,
                                    child: Transform.rotate(
                                      angle: -math.pi / 2,
                                      child: const Text(
                                        'Our Mission',
                                        style: TextStyle(
                                          fontSize: 44,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 200,//
                        ),
                        Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(8.0),
                          child: AnimatedLogo(
                            onTapRed: () {
                              globals.type = "Language Lessons";
                              _pageColor = HexColor("#ec3227");
                              _checkIfIsLoggedIn();
                              print('Language Lessons');
                            },
                            onTapYellow: () {
                              globals.type = "Native Speaking";
                              _pageColor = HexColor("#f3b70c");
                              _checkIfIsLoggedIn();
                              print('Native Speaking');
                            },
                            onTapBlue: () {
                              globals.type = "Audio Books";
                              _pageColor = Colors.blueAccent;
                              _checkIfIsLoggedInBlue();
                              print('Audio Books');
                            },
                            onTapGreen: () {
                              globals.type = "Diploma Certificate";
                              _pageColor = HexColor("#37ae44");
                              _checkIfIsLoggedIn();
                              print('Diploma Certificate');
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 200,//
                        ),
                        Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(8.0),
                          child: const Text(
                            'Core Team',
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(32.0),
                              topLeft: Radius.circular(32.0),
                              bottomRight: Radius.circular(32.0),
                              bottomLeft: Radius.circular(32.0),
                            ),
                            child: Container(
                              height: 260,
                              width: 250,
                              color: Colors.white70,
                              child: ScrollConfiguration(
                                //ScrollBehavior can be set for a specific widget.
                                behavior: MyCustomScrollBehavior(),
                                child: InfiniteListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    controller: _infiniteController,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return _coreTeam[index % _coreTeam.length];
                                    }),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(8.0),
                          child: const Text(
                            'Teachers',
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(32.0),
                              topLeft: Radius.circular(32.0),
                              bottomRight: Radius.circular(32.0),
                              bottomLeft: Radius.circular(32.0),
                            ),
                            child: Container(
                              height: 260,
                              width: 250,
                              color: Colors.white70,
                              child: ScrollConfiguration(
                                //ScrollBehavior can be set for a specific widget.
                                behavior: MyCustomScrollBehavior(),
                                child: InfiniteListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    controller: _infiniteController,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      //print(index % _teachers.length);
                                      return _TeacherCardList[index % _TeacherCardList.length];
                                    }),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 100,
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
      ),
    );
  }


  _loadTeachers() async {
    // load from db

    //try {
    print('load Teacher');

    var data = {
      'version': globals.version,
    };

    var res = await CallApi()
        .postData(data, '/Teacher/Control/(Control)getTeacherInfo.php');
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
              isHeart: false,
              isHeartLikedTeacher: false,
              isButton: false,
              liked: false,
              isHidden: false,
              listOfCharacteristic_t: _tempListOfCharacteristic_t,
              isHidable: true,
              onPressed: () {}),
        );
      }

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
    // } catch (e) {
    //   print(e);
    //   if (mounted) {
    //     ErrorPopup(context, globals.errorException);
    //   }
    // }
  }

  _checkIfIsLoggedIn() async {
    SessionManager session = SessionManager();

    if (await session.get('isLoggedIn') == false) {
      warningPopup(context, globals.warning400);
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialogLangLvl(
          pageColor: _pageColor,
        ),
      ).then((exit) {
        if (mounted) {
          setState(() {
            //_nullTextCode();
          });
        }
      });
    }
  }

  _checkIfIsLoggedInBlue() async {
    SessionManager session = SessionManager();

    if (await session.get('isLoggedIn') == false) {
      warningPopup(context, globals.warning400);
    } else {
      Navigator.pushNamedAndRemoveUntil(context, "/MyAudio", (route) => false);
    }
  }

  _back() {
    print('No back available.');
  }
}
