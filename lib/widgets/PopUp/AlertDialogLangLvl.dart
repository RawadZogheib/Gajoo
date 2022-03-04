import 'package:flutter/material.dart';
import 'package:gajoo/page/Teacher.dart';

import '../button/myButton.dart';


class AlertDialogLangLvl extends StatefulWidget {
  String? types;
  Color? pageColor;
  AlertDialogLangLvl({this.types, this.pageColor});

  @override
  _AlertDialogLangLvlState createState() => _AlertDialogLangLvlState();
}

class _AlertDialogLangLvlState extends State<AlertDialogLangLvl> {
  String _x = '0';
  String? _type;
  String? _languages;
  String? _level;
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
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.5)),
      backgroundColor: widget.pageColor,
      contentPadding: const EdgeInsets.only(left: 0.0, right: 0.0, bottom: 0.0, top: 30),
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
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.5),
                color: Colors.white
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
                            if(mounted) {
                              setState(() {
                                _x = '1';
                                _text = 'Choose Your Level';
                                _languages = "english";
                                _type = widget.types;
                              });
                            }
                            print("language: $_languages");
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
                          if(mounted) {
                            setState(() {
                              _x = '1';
                              _text = 'Choose Your Level';
                              _languages = "french";
                              _type = widget.types;
                            });
                          }
                          print("language: $_languages");
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
                          if(mounted) {
                            setState(() {
                              _x = '1';
                              _text = 'Choose Your Level';
                              _languages = "arabic";
                              _type = widget.types;
                            });
                          }
                          print("language: $_languages");
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
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.5),
                      color: Colors.white
                  ),
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
                                        _text = 'Choose The Language';
                                      });
                                    }
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 8.0, top: 8.0),
                                    child: Container(
                                        alignment: Alignment.topLeft,
                                        child: const Icon(Icons.arrow_back, size: 23,)),
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
                                  if(mounted) {
                                    setState(() {
                                      _level = "intermediate";
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
                                  if(mounted) {
                                    setState(() {
                                      _level = "advanced";
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
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              : Container(),
    );
  }

  _pageColorClick(){
    if(widget.types == "red"){
      _btnColor = Colors.redAccent;
    }else if(widget.types == "yellow"){
      _btnColor = Colors.yellowAccent;
    }else if(widget.types == "green"){
      _btnColor = Colors.green;
    }
  }
}
