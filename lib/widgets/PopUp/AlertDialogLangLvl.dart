import 'package:flutter/material.dart';
import 'package:gajoo/globals/globals.dart' as globals;
import 'package:gajoo/hexColor/hexColor.dart';
import 'package:gajoo/page/Teacher.dart';

import '../button/myButton.dart';

class AlertDialogLangLvl extends StatefulWidget {
  Color pageColor;

  AlertDialogLangLvl({required this.pageColor});

  @override
  _AlertDialogLangLvlState createState() => _AlertDialogLangLvlState();
}

class _AlertDialogLangLvlState extends State<AlertDialogLangLvl> {
  String _x = '0';
  late String _type;
  String? _text = 'Choose The Language';
  Color? _btnColor;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageColorClick();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
        topLeft: Radius.circular(32.0),
        topRight: Radius.circular(32.0),
        bottomLeft: Radius.circular(32.0),
        bottomRight: Radius.circular(32.0),
      )),
      backgroundColor: widget.pageColor,
      contentPadding:
          const EdgeInsets.only(left: 0.0, right: 0.0, bottom: 0.0, top: 30),
      title: Center(
        child: Text(_text!,
            style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20)),
      ),
      content: _x == '0'
          ? Container(
              height: 300, //300
              width: 400, //400
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(32.0),
                  topRight: Radius.circular(32.0),
                  bottomLeft: Radius.circular(32.0),
                  bottomRight: Radius.circular(32.0),
                ),
                color: Colors.white,
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 25,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: myBtn2(
                          color1: _btnColor,
                          color2: Colors.white,
                          btnText: const Text(
                            'ENGLISH',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          height: 65,
                          width: 200,
                          onPress: () {
                            if (mounted) {
                              setState(() {
                                _x = '1';
                                _text = 'Choose Your Level';
                                globals.language = "English";
                                _type = globals.type!;
                              });
                            }
                            print("language: ${globals.language}");
                            print("types: $_type");
                          }),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: myBtn2(
                        color1: _btnColor,
                        color2: Colors.white,
                        btnText: const Text(
                          'FRENCH',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        height: 65,
                        width: 200,
                        onPress: () {
                          if (mounted) {
                            setState(() {
                              _x = '1';
                              _text = 'Choose Your Level';
                              globals.language = "French";
                              _type = globals.type!;
                            });
                          }
                          print("language: ${globals.language}");
                          print("types: $_type");
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: myBtn2(
                        color1: _btnColor,
                        color2: Colors.white,
                        btnText: const Text(
                          'ARABIC',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        height: 65,
                        width: 200,
                        onPress: () {
                          if (mounted) {
                            setState(() {
                              _x = '1';
                              _text = 'Choose Your Level';
                              globals.language = "Arabic";
                              _type = globals.type!;
                            });
                          }
                          print("language: ${globals.language}");
                          print("types: $_type");
                        },
                      ),
                    ),
                  ],
                ),
              ),
            )
          : _x == '1'
              ? Container(
                  height: 300, //300
                  width: 400, //400
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(32.0),
                        topRight: Radius.circular(32.0),
                        bottomLeft: Radius.circular(32.0),
                        bottomRight: Radius.circular(32.0),
                      ),
                      color: Colors.white),
                  child: SingleChildScrollView(
                    child: Container(
                      child: Center(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    if (mounted) {
                                      setState(() {
                                        _x = '0';
                                        _text = 'Choose The Language';
                                      });
                                    }
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8.0, top: 8.0),
                                    child: Container(
                                        alignment: Alignment.topLeft,
                                        child: const Icon(
                                          Icons.arrow_back,
                                          size: 23,
                                        )),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: myBtn2(
                                color1: _btnColor,
                                color2: Colors.white,
                                btnText: const Text(
                                  'BEGINNER',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                                height: 65,
                                width: 200,
                                onPress: () {
                                  if (mounted) {
                                    setState(() {
                                      globals.level = "beginner";
                                    });
                                    Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Teacher()),
                                        (route) => false);
                                  }
                                  print("level: ${globals.level}");
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: myBtn2(
                                color1: _btnColor,
                                color2: Colors.white,
                                btnText: const Text(
                                  'INTERMEDIATE',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                                height: 65,
                                width: 200,
                                onPress: () {
                                  if (mounted) {
                                    setState(() {
                                      globals.level = "intermediate";
                                    });
                                    Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Teacher()),
                                        (route) => false);
                                  }
                                  print("level: ${globals.level}");
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: myBtn2(
                                color1: _btnColor,
                                color2: Colors.white,
                                btnText: const Text(
                                  'ADVANCED',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                                height: 65,
                                width: 200,
                                onPress: () {
                                  if (mounted) {
                                    setState(() {
                                      globals.level = "advanced";
                                    });
                                    Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Teacher()),
                                        (route) => false);
                                  }
                                  print("level: ${globals.level}");
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              : Container(),
    );
  }

  _pageColorClick() {
    if (globals.type == "Language Lessons") {
      _btnColor = HexColor("#ec3227");
    } else if (globals.type == "Native Speaking") {
      _btnColor = HexColor("#f3b70c");
    } else if (globals.type == "Diploma Certificate") {
      _btnColor = HexColor("#37ae44");
    }
  }
}
