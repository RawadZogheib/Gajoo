import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';

class TeacherCard extends StatelessWidget {
  final String? Id;
  final String text;
  final String imageUrl;
  final String subtitle;
  final bool isHeart;
  final bool isButton;
  final Function() onPressed;

  const TeacherCard(
      {this.Id,
      required this.text,
      required this.imageUrl,
      required this.subtitle,
      required this.isHeart,
      required this.isButton,
      required this.onPressed,
      Key? key})
      : super(key: key);

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
                  Image.asset(imageUrl, height: 90, fit: BoxFit.cover),
                  const Spacer(),
                  Text(text,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      )),
                  Text(
                    subtitle,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.normal,
                        fontSize: 12),
                  ),
                  isButton == true
                      ? Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                          onPressed: (){
                            Navigator.pushNamed(context, '/CalendarPage');
                          },
                          icon: const Icon(Icons.arrow_forward_ios,size: 20,),),
                    ],
                  )
                      : Container(),
                ],
              ),
            ),
            isHeart == true
                ? Positioned(
              top: 20,
              right: 20,
              child: IconButton(
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                hoverColor: Colors.transparent,
                onPressed: () {},
                icon: const Icon(Icons.favorite_border),
              ),
            )
                : Positioned(
              top: 20,
              right: 20,
              child: IconButton(
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                hoverColor: Colors.transparent,
                onPressed: () {},
                icon: const Icon(Icons.favorite),
              ),
            ),
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
                  color: Colors.white
              ),
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
                      padding: const EdgeInsets.only(right: 8.0, left: 8.0),
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
                      style: TextStyle(fontSize: 13,
                          color: Colors.white, fontWeight: FontWeight.bold),
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
                      style: TextStyle(fontSize: 13,
                          color: Colors.white, fontWeight: FontWeight.bold),
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
