import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gajoo/globals/globals.dart' as globals;
import 'package:gajoo/widgets/HomePage/MyFooter.dart';
import 'package:gajoo/widgets/TeacherPage/TeacherCard.dart';
import 'package:infinite_listview/infinite_listview.dart';

import '../hexColor/hexColor.dart';
import '../widgets/HomePage/myDrawer.dart';
import '../widgets/button/myButton.dart';
import '../widgets/other/MyCustomScrollBehavior.dart';

Color type1 = HexColor('#dfe2e6');
Color type2 = HexColor('#dfe2e6');
Color type3 = HexColor('#dfe2e6');

Color language1 = HexColor('#dfe2e6');
Color language2 = HexColor('#dfe2e6');
Color language3 = HexColor('#dfe2e6');

Color level1 = HexColor('#dfe2e6');
Color level2 = HexColor('#dfe2e6');
Color level3 = HexColor('#dfe2e6');

class Teacher extends StatefulWidget {
  String? type;
  String? languages;
  String? level;

  Teacher({this.type, this.languages, this.level});

  @override
  _TeacherState createState() => _TeacherState();
}

class _TeacherState extends State<Teacher> {
  final InfiniteScrollController _infiniteController = InfiniteScrollController(
    initialScrollOffset: 0.0,
  );

  final List<Widget> _TeacherCard = [
    TeacherCard(
        text: 'Michel Nachar',
        imageUrl: 'Assets/HomePage/ProfilePicture/img1.png',
        subtitle: 'Arabic, French',
        onPressed: () {}),
    TeacherCard(
        text: 'Rawad Zogheib',
        imageUrl: 'Assets/HomePage/ProfilePicture/img2.png',
        subtitle: 'ma 5asne bshi',
        onPressed: () {}),
    TeacherCard(
        text: 'Rima Zogheib',
        imageUrl: 'Assets/HomePage/ProfilePicture/img3.png',
        subtitle: 'Arabic, French, English',
        onPressed: () {}),
    TeacherCard(
        text: 'Ghada Zogheib',
        imageUrl: 'Assets/HomePage/ProfilePicture/img2.png',
        subtitle: 'English, Arabic, French',
        onPressed: () {}),
    TeacherCard(
        text: 'Michel Nachar',
        imageUrl: 'Assets/HomePage/ProfilePicture/img1.png',
        subtitle: 'Arabic, French',
        onPressed: () {}),
    TeacherCard(
        text: 'Rawad Zogheib',
        imageUrl: 'Assets/HomePage/ProfilePicture/img2.png',
        subtitle: 'ma 5asne bshi',
        onPressed: () {}),
    TeacherCard(
        text: 'Rima Zogheib',
        imageUrl: 'Assets/HomePage/ProfilePicture/img3.png',
        subtitle: 'Arabic, French, English',
        onPressed: () {}),
    TeacherCard(
        text: 'Ghada Zogheib',
        imageUrl: 'Assets/HomePage/ProfilePicture/img2.png',
        subtitle: 'English, Arabic, French',
        onPressed: () {}),
    TeacherCard(
        text: 'Michel Nachar',
        imageUrl: 'Assets/HomePage/ProfilePicture/img1.png',
        subtitle: 'Arabic, French',
        onPressed: () {}),
    TeacherCard(
        text: 'Rawad Zogheib',
        imageUrl: 'Assets/HomePage/ProfilePicture/img2.png',
        subtitle: 'ma 5asne bshi',
        onPressed: () {}),
    TeacherCard(
        text: 'Rima Zogheib',
        imageUrl: 'Assets/HomePage/ProfilePicture/img3.png',
        subtitle: 'Arabic, French, English',
        onPressed: () {}),
    TeacherCard(
        text: 'Ghada Zogheib',
        imageUrl: 'Assets/HomePage/ProfilePicture/img2.png',
        subtitle: 'English, Arabic, French',
        onPressed: () {}),
    TeacherCard(
        text: 'Michel Nachar',
        imageUrl: 'Assets/HomePage/ProfilePicture/img1.png',
        subtitle: 'Arabic, French',
        onPressed: () {}),
    TeacherCard(
        text: 'Rawad Zogheib',
        imageUrl: 'Assets/HomePage/ProfilePicture/img2.png',
        subtitle: 'ma 5asne bshi',
        onPressed: () {}),
    TeacherCard(
        text: 'Rima Zogheib',
        imageUrl: 'Assets/HomePage/ProfilePicture/img3.png',
        subtitle: 'Arabic, French, English',
        onPressed: () {}),
    TeacherCard(
        text: 'Ghada Zogheib',
        imageUrl: 'Assets/HomePage/ProfilePicture/img2.png',
        subtitle: 'English, Arabic, French',
        onPressed: () {}),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _choosedFilters();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: myDrawer(),
      backgroundColor: globals.whiteBlue,
      body: Builder(
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
                          'Rawad Zogheib',
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
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      width: 100.0,
                    ),
                    ScrollConfiguration(
                      behavior: MyCustomScrollBehavior(),
                      child: SingleChildScrollView(
                        controller: ScrollController(),
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
                    ),
                    const SizedBox(
                      width: 50.0,
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
                        child: ScrollConfiguration(
                          behavior: MyCustomScrollBehavior(),
                          child: SingleChildScrollView(
                            controller: ScrollController(),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.5),
                                color: Colors.white70,
                              ),
                              child: Wrap(
                                children: _TeacherCard,
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
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            //const MyFooter(),
          ],
        ),
      ),
    );
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
        type1 = Colors.lightBlueAccent.shade100.withOpacity(0.1);
        type2 = Colors.lightBlueAccent.shade100.withOpacity(0.1);
        type3 = Colors.lightBlueAccent.shade100.withOpacity(0.1);
      });
    }
  }

  _cleanColorLanguage() {
    if (mounted) {
      setState(() {
        language1 = Colors.lightBlueAccent.shade100.withOpacity(0.1);
        language2 = Colors.lightBlueAccent.shade100.withOpacity(0.1);
        language3 = Colors.lightBlueAccent.shade100.withOpacity(0.1);
      });
    }
  }

  _cleanColorLevel() {
    if (mounted) {
      setState(() {
        level1 = Colors.lightBlueAccent.shade100.withOpacity(0.1);
        level2 = Colors.lightBlueAccent.shade100.withOpacity(0.1);
        level3 = Colors.lightBlueAccent.shade100.withOpacity(0.1);
      });
    }
  }
}
