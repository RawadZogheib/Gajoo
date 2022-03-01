import 'package:flutter/material.dart';
import 'package:gajoo/page/Teacher.dart';

import '../button/myButton.dart';

class AlertDialogLangLvl extends StatefulWidget {
  @override
  _AlertDialogLangLvlState createState() => _AlertDialogLangLvlState();
}

class _AlertDialogLangLvlState extends State<AlertDialogLangLvl> {
  String _x = '0';
  String? _type;
  String? _languages;
  String? _level;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.5)),
      content: _x == '0'
          ? Container(
              height: 300, //300
              width: 400, //400
              child: SingleChildScrollView(
                child: Container(
                  child: Center(
                    child: Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Choose The Language',
                            style: TextStyle(
                                color: Colors.redAccent,
                                fontWeight: FontWeight.bold,
                                fontSize: 17),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: myBtn2(
                              color1: Colors.lightBlue,
                              color2: Colors.white,
                              btnText: const Text(
                                'ENGLISH',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                              height: 65,
                              width: 200,
                              onPress: () {
                                if(mounted) {
                                  setState(() {
                                    _x = '1';
                                    _languages = "english";
                                  });
                                }
                                print("language: $_languages");
                              }),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: myBtn2(
                            color1: Colors.lightBlue,
                            color2: Colors.white,
                            btnText: const Text(
                              'FRENCH',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                            height: 65,
                            width: 200,
                            onPress: () {
                              if(mounted) {
                                setState(() {
                                  _x = '1';
                                  _languages = "french";
                                });
                              }
                              print("language: $_languages");
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: myBtn2(
                            color1: Colors.lightBlue,
                            color2: Colors.white,
                            btnText: const Text(
                              'ARABIC',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                            height: 65,
                            width: 200,
                            onPress: () {
                              if(mounted) {
                                setState(() {
                                  _x = '1';
                                  _languages = "arabic";
                                });
                              }
                              print("language: $_languages");
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          : _x == '1'
              ? Container(
                  height: 300, //300
                  width: 400, //400
                  child: SingleChildScrollView(
                    child: Container(
                      child: Center(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    if(mounted) {
                                      setState(() {
                                        _x = '0';
                                      });
                                    }
                                  },
                                  child: Container(
                                      alignment: Alignment.topLeft,
                                      child: const Icon(Icons.arrow_back)),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: MediaQuery.of(context).size.width *
                                          0.1,
                                      top: 8.0,
                                      right: 8.0,
                                      bottom: 8.0),
                                  child: const Text(
                                    'Choose Your Level',
                                    style: TextStyle(
                                        color: Colors.blueAccent,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: myBtn2(
                                color1: Colors.redAccent,
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
                                  if(mounted) {
                                    setState(() {
                                      _level = "beginner";
                                    });
                                    Navigator.push(context,
                                      MaterialPageRoute(builder: (context) => Teacher(
                                        type: _type,
                                        languages: _languages,
                                        level: _level,
                                      )));
                                  }
                                  print("level: $_level");
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: myBtn2(
                                color1: Colors.redAccent,
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
                                  if(mounted) {
                                    setState(() {
                                      _level = "intermediate";
                                    });
                                  }
                                  print("level: $_level");
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: myBtn2(
                                color1: Colors.redAccent,
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
                                  if(mounted) {
                                    setState(() {
                                      _level = "advanced";
                                    });
                                  }
                                  print("level: $_level");
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
}
