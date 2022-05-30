import 'dart:convert';

import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:gajoo/api/my_api.dart';
import 'package:gajoo/api/my_session.dart';
import 'package:gajoo/globals/globals.dart' as globals;
import 'package:gajoo/page/CalendarPage.dart';

class Characteristic_t {
  String type;
  String language;
  String level;

  Characteristic_t(
      {required this.type, required this.language, required this.level});
}

class TeacherCard extends StatefulWidget {
  final String Id;
  final String name;
  final String age;
  final String NbOfCourses;
  final String NbOfCoursesReserved;
  final String NbOfCoursesLeft;
  final String imageUrl;
  final bool isHeart;
  final Set<String> languageView;
  final bool? isHeartLikedTeacher;
  final bool isButton;

  // late Set<String> type;
  // late Set<String> languages;
  // late Set<String> level;
  List<Characteristic_t> listOfCharacteristic_t;
  bool isHidden = false;
  final bool isHidable;
  bool liked = false;
  var onPressed;

  TeacherCard({
    Key? key,
    required this.Id,
    required this.name,
    required this.age,
    required this.NbOfCourses,
    required this.NbOfCoursesReserved,
    required this.NbOfCoursesLeft,
    required this.imageUrl,
    required this.languageView,
    required this.isHeart,
    this.isHeartLikedTeacher,
    required this.isButton,
    required this.onPressed,
    // required this.type,
    // required this.languages,
    // required this.level,
    required this.listOfCharacteristic_t,
    required this.isHidable,
    required this.isHidden,
    required this.liked,
  }) : super(key: key);

  @override
  State<TeacherCard> createState() => _TeacherCardState();
}

class _TeacherCardState extends State<TeacherCard> {
  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: widget.isHidden,
      child: Stack(
        children: [
          InkWell(
            onTap: () {},
            child: FlipCard(
              fill: Fill.fillBack,
              direction: FlipDirection.HORIZONTAL,
              front: Stack(
                children: [
                  Container(
                    height: 230,
                    width: 250,
                    padding: const EdgeInsets.all(30.0),
                    margin: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: globals.whiteBlue,
                      borderRadius: BorderRadius.circular(12.5),
                      boxShadow: [
                        BoxShadow(
                            offset: const Offset(10, 20),
                            blurRadius: 10,
                            spreadRadius: 0,
                            color: Colors.grey.withOpacity(.05)),
                      ],
                    ),
                    child: Column(
                      children: [
                        Image.asset(widget.imageUrl,
                            height: 87, fit: BoxFit.cover),
                        const Spacer(),
                        Text(widget.name,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            )),
                        Text(
                          (widget.languageView.contains('Arabic') ||
                                      widget.languageView.contains('arabic')
                                  ? 'Arabic' +
                                      (widget.languageView.contains('French') ||
                                              widget.languageView
                                                  .contains('french') ||
                                              widget.languageView
                                                  .contains('English') ||
                                              widget.languageView
                                                  .contains('english')
                                          ? ', '
                                          : '')
                                  : '') +
                              (widget.languageView.contains('French') ||
                                      widget.languageView.contains('french')
                                  ? 'French' +
                                      (widget.languageView
                                                  .contains('English') ||
                                              widget.languageView
                                                  .contains('english')
                                          ? ', '
                                          : '')
                                  : '') +
                              (widget.languageView.contains('English') ||
                                      widget.languageView.contains('english')
                                  ? 'English'
                                  : ''),
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.normal,
                              fontSize: 12),
                        ),
                        widget.isButton == true
                            ? Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      Navigator.pushAndRemoveUntil(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  CalendarPage(
                                                    teacherId: widget.Id,
                                                  )),
                                          (route) => false);
                                      // Navigator.pushNamedAndRemoveUntil(context,
                                      //     '/CalendarPage', (route) => false);
                                    },
                                    icon: const Icon(
                                      Icons.arrow_forward_ios,
                                      size: 20,
                                    ),
                                  ),
                                ],
                              )
                            : Container(),
                      ],
                    ),
                  ),
                  widget.isHeart == true
                      ? Positioned(
                          top: 20,
                          right: 20,
                          child: IconButton(
                              highlightColor: Colors.transparent,
                              splashColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              onPressed: () {
                                setState(() {
                                  widget.liked = !widget.liked;
                                  if (widget.isHeartLikedTeacher != false &&
                                      widget.liked == false &&
                                      widget.onPressed != null) {
                                    widget.onPressed(widget.Id);
                                  }
                                  _AddOrRemoveLike();
                                  //_getLikedOrNot();
                                });
                              },
                              icon: widget.liked == false
                                  ? const Icon(Icons.favorite_border)
                                  : const Icon(Icons.favorite)),
                        )
                      : Container(),
                ],
              ),
              back: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(20),
                          topLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                          bottomLeft: Radius.circular(20),
                        ),
                        color: globals.whiteBlue),
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.only(
                        top: 166.0, bottom: 8.0, right: 8.0, left: 8.0),
                    child: Container(
                      padding: const EdgeInsets.only(top: 6.0, bottom: 5.0),
                      decoration: BoxDecoration(
                        color: Colors.transparent.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ListView(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(right: 8.0, left: 8.0),
                            child: Column(
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(right: 8.0),
                                  child: Column(
                                    children: [
                                      const Text(
                                        "Number Of Courses Reserved: ",
                                        textDirection: TextDirection.ltr,
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          widget.NbOfCoursesReserved,
                                          style: const TextStyle(
                                              fontSize: 15,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 55,
                    width: 110,
                    margin: const EdgeInsets.only(top: 26.0, right: 140),
                    padding: const EdgeInsets.only(top: 6.0, bottom: 5.0),
                    decoration: BoxDecoration(
                      color: Colors.transparent.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(right: 8.0, left: 8.0),
                      child: Center(
                        child: Column(
                          children: [
                            const Text(
                              "Age: ",
                              style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: Text(
                                widget.age,
                                style: const TextStyle(
                                    fontSize: 15,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 55,
                    width: 110,
                    margin: const EdgeInsets.only(top: 26.0, left: 140),
                    padding: const EdgeInsets.only(top: 6.0, bottom: 5.0),
                    decoration: BoxDecoration(
                      color: Colors.transparent.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(right: 8.0, left: 8.0),
                      child: Center(
                        child: Column(
                          children: [
                            const Text(
                              "Courses Left: ",
                              style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: Text(
                                widget.NbOfCoursesLeft,
                                style: const TextStyle(
                                    fontSize: 15,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 55,
                    width: 250,
                    margin: const EdgeInsets.only(top: 100.0),
                    padding: const EdgeInsets.only(top: 6.0, bottom: 5.0),
                    decoration: BoxDecoration(
                      color: Colors.transparent.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(right: 8.0, left: 8.0),
                      child: Center(
                        child: Column(
                          children: [
                            const Text(
                              "Number Of Courses: ",
                              style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: Text(
                                widget.NbOfCourses,
                                style: const TextStyle(
                                    fontSize: 15,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          widget.isHidden == true
              ? Container(
                  height: 230,
                  width: 250,
                  padding: const EdgeInsets.all(30.0),
                  margin: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(12.5),
                  ),
                )
              : const SizedBox(
                  height: 0,
                  width: 0,
                ),
        ],
      ),
    );
  }

_AddOrRemoveLike() async {
  SessionManager session = SessionManager();
  if(widget.liked == false){
    var data = {
      'version': globals.version,
      'email': await session.get('email'),
      'teacher_Id': widget.Id,
      //'isLiked': widget.liked.toString()
    };

    print(await session.get('email'));
    print(widget.Id);
    print(widget.liked);
    print(globals.version);
    var res = await CallApi()
        .postData(data, '/Teacher/Control/(Control)isNotLikedTeacher.php');

    print(res.body);
    List<dynamic> body = json.decode(res.body);

    if(body[0] == "success"){
      //send the liked ones to the likedTeacher page
      // session.set('teacher_Id', widget.Id);
      // session.set('isLiked', widget.liked.toString());
      print("doneeeee");
    }

  }else{
    var data = {
      'version': globals.version,
      'email': await session.get('email'),
      'teacher_Id': widget.Id,
      //'isLiked': widget.liked.toString()
    };

    print(await session.get('email'));
    print(widget.Id);
    print(widget.liked);
    print(globals.version);
    var res = await CallApi()
        .postData(data, '/Teacher/Control/(Control)isLikedTeacher.php');
    print(res.body);
    print("11111111111111111111111");
    List<dynamic> body = json.decode(res.body);

    if(body[0] == "success"){
      //send the liked ones to the likedTeacher page
      // session.set('teacher_Id', widget.Id);
      // session.set('isLiked', widget.liked.toString());
      print("doneeeee2222222222222222");
    }
  }
}


  // _getLikedOrNot() async {
  //   if(await SessionManager().get('teacher_Id'));
  //
  // }

}
