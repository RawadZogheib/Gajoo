import 'package:flutter/material.dart';

class AnimatedLogo extends StatefulWidget {
  const AnimatedLogo({Key? key}) : super(key: key);

  @override
  _AnimatedLogoState createState() => _AnimatedLogoState();
}

class _AnimatedLogoState extends State<AnimatedLogo> {
  int _time = 40;
  bool _hide1 = false;
  bool _hide2 = false;
  bool _hide3 = false;
  bool _hide4 = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      width: 180,
      child: Stack(
        children: [
          Image.asset(
            'Assets/HomePage/img1.png',
            fit: BoxFit.contain,
          ),
          /////////////////////////////////////////////////
          //Red
          _hide1 == false
              ? Positioned(
                  top: 0,
                  left: 0,
                  child: InkWell(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    onTap: () => print('red'),
                    onHover: (val) {
                      if (val) {
                        setState(() {
                          setState(() {
                            _hide2 = true;
                            _hide3 = true;
                            _hide4 = true;
                          });
                        });
                      } else {
                        setState(() {
                          _hide1 = false;
                          _hide2 = false;
                          _hide3 = false;
                          _hide4 = false;
                        });
                      }
                    },
                    child: Image.asset(
                      'Assets/HomePage/img2.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                )
              : Container(),
          /////////////////////////////////////////////////
          //Yellow
          _hide2 == false
              ? Positioned(
                  top: 0,
                  right: 0,
                  child: InkWell(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    onTap: () => print('yellow'),
                    onHover: (val) {
                      if (val) {
                        setState(() {
                          _hide1 = true;
                          _hide3 = true;
                          _hide4 = true;
                        });
                      } else {
                        setState(() {
                          _hide1 = false;
                          _hide2 = false;
                          _hide3 = false;
                          _hide4 = false;
                        });
                      }
                    },
                    child: Image.asset(
                      'Assets/HomePage/img3.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                )
              : Container(),
          /////////////////////////////////////////////////
          //Blue
          _hide3 == false
              ? Positioned(
                  bottom: 0,
                  left: 0,
                  child: InkWell(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    onTap: () => print('blue'),
                    onHover: (val) async {
                      if (val) {
                        setState(() {
                          _hide1 = true;
                          _hide2 = true;
                          _hide4 = true;
                        });
                      } else {
                        setState(() {
                          _hide1 = false;
                          _hide2 = false;
                          _hide3 = false;
                          _hide4 = false;
                        });
                      }
                    },
                    child: Image.asset(
                      'Assets/HomePage/img4.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                )
              : Container(),
          /////////////////////////////////////////////////
          //Green
          _hide4 == false
              ? Positioned(
                  bottom: 0,
                  right: 0,
                  child: InkWell(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    onTap: () => print('green'),
                    onHover: (val) async {
                      if (val) {
                        setState(() {
                          _hide1 = true;
                          _hide2 = true;
                          _hide3 = true;
                        });
                      } else {
                        setState(() {
                          _hide1 = false;
                          _hide2 = false;
                          _hide3 = false;
                          _hide4 = false;
                        });
                      }
                    },
                    child: Image.asset(
                      'Assets/HomePage/img5.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
