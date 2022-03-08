import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gajoo/globals/globals.dart' as globals;
import 'package:gajoo/hexColor/hexColor.dart';
import 'package:gajoo/widgets/HomePage/CustomImage.dart';
import 'package:gajoo/widgets/HomePage/ImagePagination.dart';
import 'package:gajoo/widgets/other/MyFooter.dart';
import 'package:gajoo/widgets/HomePage/TeacherCard.dart';
import 'package:gajoo/widgets/HomePage/animatedLogo.dart';
import 'package:gajoo/widgets/PopUp/AlertDialogLangLvl.dart';
import 'package:gajoo/widgets/other/MyCustomScrollBehavior.dart';
import 'package:gajoo/widgets/other/MyHeader.dart';
import 'package:gajoo/widgets/other/myDrawer.dart';
import 'package:infinite_listview/infinite_listview.dart';

import '../widgets/PopUp/errorWarningPopup.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
        text: 'Ghada Zogheib',
        imageUrl: 'Assets/HomePage/ProfilePicture/img1.png',
        subtitle: 'C.E.O.',
        isHeart: false,
        isButton: false,
        onPressed: () {}),
    TeacherCard(
        text: 'Michel Nachar',
        imageUrl: 'Assets/HomePage/ProfilePicture/img2.png',
        subtitle: 'Project Manager',
        isHeart: false,
        isButton: false,
        onPressed: () {}),
  ];

  final List<Widget> _teachers = [
    TeacherCard(
        text: 'Ghada Zogheib',
        imageUrl: 'Assets/HomePage/ProfilePicture/img1.png',
        subtitle: 'Frensh, English',
        isHeart: true,
        isButton: false,
        onPressed: () {}),
    TeacherCard(
        text: 'Michel Nachar',
        imageUrl: 'Assets/HomePage/ProfilePicture/img2.png',
        subtitle: 'Arabic anja2 :p',
        isHeart: true,
        isButton: false,
        onPressed: () {}),
    TeacherCard(
        text: 'Rawad Zogheib',
        imageUrl: 'Assets/HomePage/ProfilePicture/img3.png',
        subtitle: "Arabic, French, English",
        isHeart: true,
        isButton: false,
        onPressed: () {}),
    TeacherCard(
        text: 'Clara Zeidan',
        imageUrl: 'Assets/HomePage/ProfilePicture/img1.png',
        subtitle: 'Arabic, French, English',
        isHeart: true,
        isButton: false,
        onPressed: () {}),
    TeacherCard(
        text: 'Felix Gedeon',
        imageUrl: 'Assets/HomePage/ProfilePicture/img2.png',
        subtitle: 'English',
        isHeart: true,
        isButton: false,
        onPressed: () {}),
    TeacherCard(
        text: 'Piere ElAsmar',
        imageUrl: 'Assets/HomePage/ProfilePicture/img3.png',
        subtitle: 'Russian, English',
        isHeart: true,
        isButton: false,
        onPressed: () {}),
    TeacherCard(
      text: 'Philips Maalouf',
      imageUrl: 'Assets/HomePage/ProfilePicture/img1.png',
      subtitle: 'Arabic, Spanish',
      isHeart: true,
      isButton: false,
      onPressed: () {},
    ),
    TeacherCard(
        text: 'Joe Skandar',
        imageUrl: 'Assets/HomePage/ProfilePicture/img2.png',
        subtitle: 'Arabic',
        isHeart: true,
        isButton: false,
        onPressed: () {}),
    TeacherCard(
        text: 'Nabil Kenaan',
        imageUrl: 'Assets/HomePage/ProfilePicture/img3.png',
        subtitle: 'Arabic, Frensh',
        isHeart: true,
        isButton: false,
        onPressed: () {}),
  ];

  int _currentActive = 0;
  late Timer _timer;
  final int _duration = 5;
  bool _isLogedIn = true;
  String? _types;
  Color? _pageColor;

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
    return Scaffold(
      endDrawer: myDrawer(),
      backgroundColor: globals.whiteBlue,
      body: Builder(
        builder: (context) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyHeader(),
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
                        height: 100,
                      ),
                      Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(8.0),
                        child: AnimatedLogo(
                          onTapRed: () {
                            _types = "red";
                            _pageColor = Colors.redAccent;
                            _checkIfIsLoggedIn();
                            print('Red');
                          },
                          onTapYellow: () {
                            _types = "yellow";
                            _pageColor = Colors.yellowAccent;
                            _checkIfIsLoggedIn();
                            print('Yellow');
                          },
                          onTapBlue: () {
                            _types = "blue";
                            _pageColor = Colors.blueAccent;
                            //_checkIfIsLoggedIn();
                            print('Blue');
                          },
                          onTapGreen: () {
                            _types = "green";
                            _pageColor = Colors.green;
                            _checkIfIsLoggedIn();
                            print('Green');
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 100,
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
                                    return _teachers[index % _teachers.length];
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
    );
  }

  _checkIfIsLoggedIn() {
    if (_isLogedIn == false) {
      WarningPopup(context, globals.warning400);
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialogLangLvl(
          types: _types,
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
}
