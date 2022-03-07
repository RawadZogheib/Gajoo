import 'package:flutter/material.dart';
import 'package:gajoo/globals/globals.dart' as globals;
import 'package:gajoo/widgets/other/MyCustomScrollBehavior.dart';

class TeacherProfile extends StatelessWidget {
  String name;
  String age;
  String languages;
  String nbrOfCourses;
  String coursesReserved;
  String coursesLeft;

  TeacherProfile(
      {required this.name,
      required this.age,
      required this.languages,
      required this.nbrOfCourses,
      required this.coursesReserved,
      required this.coursesLeft});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(30),
        topRight: Radius.circular(30),
        bottomLeft: Radius.circular(30),
        bottomRight: Radius.circular(30),
      ),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.8,
        width: 500,
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: ScrollConfiguration(
          behavior: MyCustomScrollBehavior(),
          child: ListView(
            controller: ScrollController(),
            children: [
              SizedBox(
                height: 250,
                width: MediaQuery.of(context).size.width,
                child: Image.asset(
                  'Assets/HomePage/ProfilePicture/img1.png',
                  fit: BoxFit.cover,
                ),
              ),
              const Divider(),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  TeacherName(
                    width: 233,
                    text1: 'Name: ',
                    text2: name,
                  ),
                  TeacherName(
                    width: 233,
                    text1: 'Age: ',
                    text2: age,
                  ),
                ],
              ),
              TeacherName(
                width: 440,
                text1: 'Languages: ',
                text2: languages,
              ),
              Row(
                children: [
                  TeacherName(
                    width: 233,
                    text1: 'Number of courses: ',
                    text2: nbrOfCourses,
                  ),
                  TeacherName(
                    width: 233,
                    text1: 'Comming Soon: ',
                    text2: 'null',
                  ),
                ],
              ),
              Row(
                children: [
                  TeacherName(
                    width: 233,
                    text1: 'Courses Reserved: ',
                    text2: coursesReserved,
                  ),
                  TeacherName(
                    width: 233,
                    text1: 'Courses Left: ',
                    text2: coursesLeft,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TeacherName extends StatelessWidget {
  double width;
  String text1;
  String text2;

  TeacherName({required this.width, required this.text1, required this.text2});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: width,
      margin: const EdgeInsets.all(8.0),
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: globals.whiteBlue,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(22),
          topRight: Radius.circular(22),
          bottomLeft: Radius.circular(22),
          bottomRight: Radius.circular(22),
        ),
      ),
      child: Column(
        children: [
          Text(
            text1,
            textAlign: TextAlign.end,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: Text(
              text2,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
