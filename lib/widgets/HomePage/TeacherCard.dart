import 'package:flutter/material.dart';

class TeacherCard extends StatelessWidget {
  final String text;
  final String imageUrl;
  final String subtitle;
  final bool isHeart;
  final bool isButton;
  final Function() onPressed;

  const TeacherCard(
      {required this.text,
      required this.imageUrl,
      required this.subtitle,
      required this.isHeart,
      required this.isButton,
      required this.onPressed,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Stack(
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
                const SizedBox(
                  height: 5,
                ),
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
                        children: const [
                          Icon(Icons.arrow_forward_ios),
                        ],
                      )
                    : Container(),
                const SizedBox(
                  height: 10,
                ),
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
                    onPressed: () => null,
                    icon: Icon(Icons.heart_broken),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
