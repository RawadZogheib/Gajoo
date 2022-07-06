import 'package:flutter/material.dart';
import 'package:gajoo/hexColor/hexColor.dart';

import 'package:gajoo/widgets/other/MyCustomScrollBehavior.dart';

class AudioText extends StatelessWidget {
  String textAudio;
  bool cancelButton;
  var onTap;

  AudioText({
    required this.textAudio,
    required this.cancelButton,
    required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(30),
        topRight: Radius.circular(30),
        bottomLeft: Radius.circular(30),
        bottomRight: Radius.circular(30),
      ),
      child: Stack(
        children: [
          Container(
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
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(child: Column(
                      children: [
                        const SizedBox(height: 40,),
                        Text(textAudio),
                      ],
                    )),
                  ),
                ],
              ),
            ),
          ),
          cancelButton == true
              ? Positioned(
                  top: 10,
                  right: 10,
                  child: CircleAvatar(
                    backgroundColor: HexColor('#333333'),
                    radius: 20,
                    child: IconButton(
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      padding: EdgeInsets.zero,
                      icon: const Icon(Icons.close),
                      color: Colors.white,
                      onPressed: () {
                        onTap();
                      },
                    ),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
