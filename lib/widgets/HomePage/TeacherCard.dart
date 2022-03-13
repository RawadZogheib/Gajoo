import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';

class TeacherCard extends StatefulWidget {
  bool isHidden = false;

  final String? Id;
  final String text;
  final String imageUrl;
  final String subtitle;
  final bool isHeart;
  final bool? isHeartLikedTeacher;
  final bool isButton;
  late Set<String> type;
  late Set<String> languages;
  late Set<String> level;
  final bool isHidable;
  bool liked = false;
  var onPressed;

  TeacherCard({
    this.Id,
    required this.text,
    required this.imageUrl,
    required this.subtitle,
    required this.isHeart,
    this.isHeartLikedTeacher,
    required this.isButton,
    required this.onPressed,
    required this.type,
    required this.languages,
    required this.level,
    required this.isHidable,
    required this.liked,
  });

  @override
  State<TeacherCard> createState() => _TeacherCardState();
}

class _TeacherCardState extends State<TeacherCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
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
                color: Colors.white,
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
                      height: 90, fit: BoxFit.cover),
                  const Spacer(),
                  Text(widget.text,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      )),
                  Text(
                    widget.subtitle,
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
                                Navigator.pushNamedAndRemoveUntil(context,
                                    '/CalendarPage', (route) => false);
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
                              widget.liked == false) {
                            widget.onPressed(widget.Id);
                          }
                        });
                      },
                      icon: widget.liked == false
                          ? const Icon(Icons.favorite_border)
                          : const Icon(Icons.favorite),
                    ),
                  )
                : Container(),
          ],
        ),
        back: Stack(
          alignment: Alignment.topCenter,
          children: [
            Container(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                  ),
                  color: Colors.white),
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.only(
                  top: 86.0, bottom: 8.0, right: 8.0, left: 8.0),
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
                            child: const Text(
                              "Description: ",
                              textDirection: TextDirection.ltr,
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
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
              height: 30,
              width: 100,
              margin: const EdgeInsets.only(top: 26.0, right: 145),
              padding: const EdgeInsets.only(top: 6.0, bottom: 5.0),
              decoration: BoxDecoration(
                color: Colors.transparent.withOpacity(0.2),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.only(right: 8.0, left: 8.0),
                child: Row(
                  children: const [
                    Text(
                      "Price: ",
                      style: TextStyle(
                          fontSize: 13,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 30,
              width: 100,
              margin: const EdgeInsets.only(top: 26.0, left: 135),
              padding: const EdgeInsets.only(top: 6.0, bottom: 5.0),
              decoration: BoxDecoration(
                color: Colors.transparent.withOpacity(0.2),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.only(right: 8.0, left: 8.0),
                child: Row(
                  children: const [
                    Text(
                      "Code: ",
                      style: TextStyle(
                          fontSize: 13,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
