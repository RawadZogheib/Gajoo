import 'package:flutter/material.dart';
import 'package:gajoo/globals/globals.dart' as globals;
import 'package:gajoo/widgets/HomePage/ImagePagination.dart';
import 'package:gajoo/widgets/HomePage/animatedLogo.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentActive = 0;
  String _currentImage = 'img1.webp';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: globals.whiteBlue,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: _width,
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              'Assets/HomePage/logo.png',
              height: 95,
              width: 300,
              fit: BoxFit.contain,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(32.0),
                  topLeft: Radius.circular(32.0),
                  bottomRight: Radius.circular(32.0),
                  bottomLeft: Radius.circular(32.0),
                ),
                child: ListView(
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(32.0),
                            topLeft: Radius.circular(32.0),
                            bottomRight: Radius.circular(32.0),
                            bottomLeft: Radius.circular(32.0),
                          ),
                          child: Container(
                            height: _height * 0.82,
                            width: _width,
                            color: Colors.white,
                            child: Image.asset(
                              'Assets/HomePage/CoverImage/$_currentImage',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 16.0),
                            child: ImagePagination(
                              currentActive: _currentActive,
                              onTapRed: () {
                                setState(() {
                                  _currentActive = 0;
                                  _currentImage = 'img1.webp';
                                });
                              },
                              onTapYellow: () {
                                setState(() {
                                  _currentActive = 1;
                                  _currentImage = 'img2.jpg';
                                });
                              },
                              onTapBlue: () {
                                setState(() {
                                  _currentActive = 2;
                                  _currentImage = 'img3.jpg';
                                });
                              },
                              onTapGreen: () {
                                setState(() {
                                  _currentActive = 3;
                                  _currentImage = 'img0.jpg';
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 200,
                    ),
                    Center(
                      child: AnimatedLogo(
                        onTapRed: () {
                          print('Red');
                        },
                        onTapYellow: () {
                          print('Yellow');
                        },
                        onTapBlue: () {
                          print('Blue');
                        },
                        onTapGreen: () {
                          print('Green');
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 2000,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
