import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gajoo/globals/globals.dart' as globals;
import 'package:gajoo/hexColor/hexColor.dart';
import 'package:gajoo/widgets/HomePage/CustomCarousel.dart';
import 'package:gajoo/widgets/HomePage/ImagePagination.dart';
import 'package:gajoo/widgets/HomePage/MyFooter.dart';
import 'package:gajoo/widgets/HomePage/animatedLogo.dart';
import 'package:infinite_listview/infinite_listview.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentActive = 0;
  String _currentImage = 'img1.webp';

  final List<Widget> _coreTeam = [
    CardFb1(
        text: "Ghada Zogheib",
        imageUrl: "Assets/HomePage/ProfilePicture/img1.png",
        subtitle: "C.E.O.",
        onPressed: () {}),
    CardFb1(
        text: "Michel Nachar",
        imageUrl: "Assets/HomePage/ProfilePicture/img2.png",
        subtitle: "Project Manager",
        onPressed: () {}),
  ];

  final List<Widget> _teachers = [
    CardFb1(
        text: "Ghada Zogheib",
        imageUrl: "Assets/HomePage/ProfilePicture/img1.png",
        subtitle: "Frensh, English",
        onPressed: () {}),
    CardFb1(
        text: "Michel Nachar",
        imageUrl: "Assets/HomePage/ProfilePicture/img2.png",
        subtitle: "Arabic anja2 :p",
        onPressed: () {}),
    CardFb1(
        text: "Rawad Zogheib",
        imageUrl: "Assets/HomePage/ProfilePicture/img3.png",
        subtitle: "Arabic, French, English",
        onPressed: () {}),
    CardFb1(
        text: "Clara Zeidan",
        imageUrl: "Assets/HomePage/ProfilePicture/img1.png",
        subtitle: "Arabic, French, English",
        onPressed: () {}),
    CardFb1(
        text: "Felix Gedeon",
        imageUrl: "Assets/HomePage/ProfilePicture/img2.png",
        subtitle: "English",
        onPressed: () {}),
    CardFb1(
        text: "Piere ElAsmar",
        imageUrl: "Assets/HomePage/ProfilePicture/img3.png",
        subtitle: "Russian, English",
        onPressed: () {}),
    CardFb1(
        text: "Philips Maalouf",
        imageUrl: "Assets/HomePage/ProfilePicture/img1.png",
        subtitle: "Arabic, Spanish",
        onPressed: () {}),
    CardFb1(
        text: "Joe Skandar",
        imageUrl: "Assets/HomePage/ProfilePicture/img2.png",
        subtitle: "Arabic",
        onPressed: () {}),
    CardFb1(
        text: "Nabil Kenaan",
        imageUrl: "Assets/HomePage/ProfilePicture/img3.png",
        subtitle: "Arabic, Frensh",
        onPressed: () {}),
  ];

  final double carouselItemMargin = 16;
  final InfiniteScrollController _infiniteController = InfiniteScrollController(
    initialScrollOffset: 0.0,
  );

  // late PageController _pageController;
  // int _position = 0;
  //
  // final ScrollController _controller = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //_pageController = PageController(initialPage: 0, viewportFraction: .2);
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
          SizedBox(
            height: _height * 0.12,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    'Assets/HomePage/logo.png',
                    height: 95,
                    width: 300,
                    fit: BoxFit.contain,
                  ),
                ),
                Container(
                  height: 60,
                  width: 120,
                  margin: const EdgeInsets.only(right: 16.0),
                  child: ElevatedButton(
                    onPressed: () => Navigator.of(context).pushNamed('/Login'),
                    child: const Text('Login'),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(32.0),
                  topLeft: Radius.circular(32.0),
                  bottomRight: Radius.circular(8.0),
                  bottomLeft: Radius.circular(8.0),
                ),
                child: ScrollConfiguration(
                  behavior: MyCustomScrollBehavior(),
                  child: ListView(
                    controller: ScrollController(),
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
                              height: _height * 0.85,
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
                        height: 100,
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
                        height: 100,
                      ),
                      Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(8.0),
                        child: const Text(
                          'Core Team',
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(32.0),
                            topLeft: Radius.circular(32.0),
                            bottomRight: Radius.circular(32.0),
                            bottomLeft: Radius.circular(32.0),
                          ),
                          child: Container(
                            height: 260,
                            width: 250,
                            color: Colors.white70,
                            child: ScrollConfiguration(
                              //ScrollBehavior can be set for a specific widget.
                              behavior: MyCustomScrollBehavior(),
                              child: InfiniteListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  controller: _infiniteController,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return _coreTeam[index % _coreTeam.length];
                                  }),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(8.0),
                        child: const Text(
                          'Teachers',
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(32.0),
                            topLeft: Radius.circular(32.0),
                            bottomRight: Radius.circular(32.0),
                            bottomLeft: Radius.circular(32.0),
                          ),
                          child: Container(
                            height: 260,
                            width: 250,
                            color: Colors.white70,
                            child: ScrollConfiguration(
                              //ScrollBehavior can be set for a specific widget.
                              behavior: MyCustomScrollBehavior(),
                              child: InfiniteListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  controller: _infiniteController,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    //print(index % _teachers.length);
                                    return _teachers[index % _teachers.length];
                                  }),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 100,
                      ),
                      MyFooter(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        // etc.
      };
}
