import 'package:flutter/material.dart';

class AnimatedLogo extends StatefulWidget {
  var onTapRed;
  var onTapYellow;
  var onTapBlue;
  var onTapGreen;

  AnimatedLogo(
      {required this.onTapRed,
      required this.onTapYellow,
      required this.onTapBlue,
      required this.onTapGreen});

  @override
  _AnimatedLogoState createState() => _AnimatedLogoState();
}

class _AnimatedLogoState extends State<AnimatedLogo> {
  bool _hide1 = false;
  bool _hide2 = false;
  bool _hide3 = false;
  bool _hide4 = false;

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return SizedBox(
      height: _height * 0.5,
      width: _width * 0.5,
      child: Stack(
        children: [
          Image.asset(
            'Assets/HomePage/AnimatedLogo/img1.png',
            height: _height * 0.5,
            width: _width * 0.5,
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
                    onTap: () => widget.onTapRed(),
                    onHover: (val) {
                      if (val == true) {
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
                      'Assets/HomePage/AnimatedLogo/img2.png',
                      height: _height * 0.2,
                      width: _width * 0.2,
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
                    onTap: () => widget.onTapYellow(),
                    onHover: (val) {
                      if (val == true) {
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
                      'Assets/HomePage/AnimatedLogo/img3.png',
                      height: _height * 0.2,
                      width: _width * 0.2,
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
                    onTap: () => widget.onTapBlue(),
                    onHover: (val) async {
                      if (val == true) {
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
                      'Assets/HomePage/AnimatedLogo/img4.png',
                      height: _height * 0.2,
                      width: _width * 0.2,
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
                    onTap: () => widget.onTapGreen(),
                    onHover: (val) async {
                      if (val == true) {
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
                      'Assets/HomePage/AnimatedLogo/img5.png',
                      height: _height * 0.2,
                      width: _width * 0.2,
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
