import 'package:flutter/material.dart';
import 'package:gajoo/widgets/other/MyCustomScrollBehavior.dart';

class TeacherProfile extends StatelessWidget {
  String name;

  TeacherProfile({required this.name});

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
        height: MediaQuery.of(context).size.height * 0.7,
        width: 500,
        decoration: const BoxDecoration(
          color: Colors.red,
        ),
        child: ScrollConfiguration(
          behavior: MyCustomScrollBehavior(),
          child: ListView(
            controller: ScrollController(),
            children: [
              Row(
                children: [
                  Text(name),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
