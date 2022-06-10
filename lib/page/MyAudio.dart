import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gajoo/api/my_api.dart';
import 'package:gajoo/api/my_session.dart';
import 'package:gajoo/globals/globals.dart' as globals;
import 'package:gajoo/hexColor/hexColor.dart';
import 'package:gajoo/widgets/PopUp/errorWarningPopup.dart';
import 'package:gajoo/widgets/button/myButton.dart';
import 'package:gajoo/widgets/other/AudioText.dart';
import 'package:gajoo/widgets/other/MyAudioList.dart';
import 'package:gajoo/widgets/other/MyCustomScrollBehavior.dart';
import 'package:gajoo/widgets/other/MyFooter.dart';
import 'package:gajoo/widgets/other/MyHeader.dart';
import 'package:gajoo/widgets/other/myDrawer.dart';
import 'package:intl/intl.dart';

class MyAudio extends StatefulWidget {
  const MyAudio({Key? key}) : super(key: key);

  @override
  State<MyAudio> createState() => _MyAudioState();
}

class _MyAudioState extends State<MyAudio> {
  //Timer? timer;
  List<List<dynamic>> _audioList = [];
  bool _clicked = false;

  Color type1 = HexColor('#dfe2e6');
  Color type2 = HexColor('#dfe2e6');
  Color type3 = HexColor('#dfe2e6');

  var _theme_Id;
  bool _imgNull = true;

  @override
  void initState() {
    // TODO: implement initState
    _loadNewPage();
    globals.currentPage = 'MyAudio';
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    //timer?.cancel();
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
        drawer: MyDrawerFilter(),
        backgroundColor: globals.whiteBlue,
        body: Container(
          decoration: _imgNull == false ? BoxDecoration(
            image: DecorationImage(
              image: NetworkImage("https://kwikcode.net/gajoo_php/Themes/Theme${_theme_Id}.png"),
              fit: BoxFit.cover,
            ),
          ) : null,
          child: Column(
            children: [
              MediaQuery.of(context).size.width > 650
                  ? const MyHeader()
                  : Container(),
              Expanded(
                child: ScrollConfiguration(
                  behavior: MyCustomScrollBehavior(),
                  child: SingleChildScrollView(
                    controller: ScrollController(),
                    child: Column(
                      children: [
                        ScrollConfiguration(
                          behavior: MyCustomScrollBehavior(),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            controller: ScrollController(),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: ClipRRect(
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(30),
                                      topRight: Radius.circular(30),
                                      bottomLeft: Radius.circular(30),
                                      bottomRight: Radius.circular(30),
                                    ),
                                    child: Container(
                                      height: MediaQuery.of(context).size.height *
                                          0.8,
                                      width: 500,
                                      padding: const EdgeInsets.all(12.0),
                                      color: Colors.white,
                                      child: MyAudioList(
                                        audiosList: _audioList,
                                      ),
                                    ),
                                  ),

                                ),
                                _clicked == true ?
                                  AudioText(
                                      textAudio: 'ksjdhffjdm \n ugsdifgusdfiaksdgaisdugiasdugaisdguiasdgi',
                                      cancelButton: true,
                                      onTap: () {
                                        _offClicked();
                                      }
                                  )
                                    : ClipRRect(
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(30),
                                    topRight: Radius.circular(30),
                                    bottomLeft: Radius.circular(30),
                                    bottomRight: Radius.circular(30),
                                  ),
                                  child: Container(
                                    height:
                                    MediaQuery.of(context).size.height *
                                        0.8,
                                    width: 500,
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 60,
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 50,
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
    //timer?.cancel();
    _loadAudio(); //0
    //_loadPage(); //1 -> INFINI
  }

  // _loadPage() {
  //   timer = Timer.periodic(const Duration(seconds: 30), (Timer t) {
  //     print(
  //         '=========>>======================================================>>==================================================>>=========');
  //     print("30sec gone!!");
  //     if (mounted) {
  //       print("30sec gone, and _loadChildrenOnline!!");
  //       _loadAudio();
  //     } else {
  //       print(
  //           '=========<<======================================================<<==================================================<<=========');
  //     }
  //   });
  // }

  _loadAudio() async {

    try {
      var data = {
        'version': globals.version,
        'account_Id': await SessionManager().get("Id"),
      };

      var res = await CallApi()
          .postData(data, '/Audios/Control/(Control)getAudioData.php');

      print(res.body);
      List<dynamic> body = json.decode(res.body);

      if (body[0] == "success") {
        setState(() {
          _audioList.clear();
          for (int i = 0; i < body[1].length; i++) {
            _audioList.add(
              [
                body[1][i][0],
                body[1][i][1],
                body[1][i][3],
                body[1][i][4],
                    () {
                  _onClicked();
                  setState(() {
                    _theme_Id = body[1][i][2];
                  });
                }
              ],
            );
          }
        });
      } else if (body[0] == 'error10') {
        warningPopup(context, globals.warning10);
      } else if (body[0] == "errorToken") {
        errorPopup(context, globals.errorToken);
      } else {
        errorPopup(context, globals.errorElse);
      }
    }catch(e){
      print(e);
      errorPopup(context, globals.errorException);
    }

  }

  _onClicked() {
    setState(() {
      _clicked = true;
      _imgNull = false;
    });
  }

  _offClicked() {
    print('asdsad');
    setState(() {
      _clicked = false;
      _imgNull = true;
    });
  }


  _open() {
    showModalBottomSheet<void>(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: MediaQuery
              .of(context)
              .size
              .height * 0.55,
          padding:
          EdgeInsets.only(bottom: MediaQuery
              .of(context)
              .viewInsets
              .bottom),
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
                          height: 30,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 8.0),
                          child: Text('Audio Language: ',style: TextStyle(
                              color: Colors.white
                          ),),
                        ),
                        const SizedBox(height: 20,),
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
                                  'ARABIC',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 12),
                                ),
                                onPress: () {
                                  _cleanColorType();
                                  if (mounted) {
                                    setState(() {
                                      globals.audioLang = "ARABIC";
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
                                  'FRENCH',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 12),
                                ),
                                onPress: () {
                                  _cleanColorType();
                                  if (mounted) {
                                    setState(() {
                                      globals.audioLang = "FRENCH";
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
                                  'ENGLISH',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 12),
                                ),
                                onPress: () {
                                  _cleanColorType();
                                  if (mounted) {
                                    setState(() {
                                      globals.audioLang = "ENGLISH";
                                      type3 = Colors.yellowAccent;
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
                    height: 30,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text('Audio Language: ',style: TextStyle(
                      color: Colors.white
                    ),),
                  ),
                  const SizedBox(height: 20,),
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
                            'ARABIC',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 12),
                          ),
                          onPress: () {
                            _cleanColorType();
                            if (mounted) {
                              setState(() {
                                globals.audioLang = "ARABIC";
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
                            'FRENCH',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 12),
                          ),
                          onPress: () {
                            _cleanColorType();
                            if (mounted) {
                              setState(() {
                                globals.audioLang = "FRENCH";
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
                            'ENGLISH',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 12),
                          ),
                          onPress: () {
                            _cleanColorType();
                            if (mounted) {
                              setState(() {
                                globals.audioLang = "ENGLISH";
                                type3 = Colors.yellowAccent;
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

  


  _back() {
    Navigator.pushNamedAndRemoveUntil(context, '/HomePage', (route) => false);
  }
}
