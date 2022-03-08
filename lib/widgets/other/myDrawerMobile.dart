import 'package:flutter/material.dart';
import 'package:gajoo/globals/globals.dart' as globals;
import 'package:gajoo/hexColor/hexColor.dart';
import 'package:gajoo/widgets/other/MyCustomScrollBehavior.dart';

import '../button/myButton.dart';

Color type1 = HexColor('#dfe2e6');
Color type2 = HexColor('#dfe2e6');
Color type3 = HexColor('#dfe2e6');

Color language1 = HexColor('#dfe2e6');
Color language2 = HexColor('#dfe2e6');
Color language3 = HexColor('#dfe2e6');

Color level1 = HexColor('#dfe2e6');
Color level2 = HexColor('#dfe2e6');
Color level3 = HexColor('#dfe2e6');

class myDrawerMobile extends StatefulWidget {
  String? type;
  String? languages;
  String? level;

  myDrawerMobile({this.type, this.languages, this.level});

  @override
  State<myDrawerMobile> createState() => _myDrawerMobileState();
}

class _myDrawerMobileState extends State<myDrawerMobile> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _choosedFilters();
  }
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: HexColor('#222222'),//globals.blue1,
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
                    child: Text('Type: ',style: TextStyle(color: Colors.white),),
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
                  const Divider(color: Colors.white),
                  const Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text('Language: ',style: TextStyle(color: Colors.white),),
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
                  const Divider(color: Colors.white),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Level: ',style: TextStyle(color: Colors.white)),
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
            ],
          ),
        ),
      ),
    );
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

}