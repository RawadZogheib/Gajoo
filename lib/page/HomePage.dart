import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gajoo/globals/globals.dart' as globals;
import 'package:gajoo/widgets/HomePage/CustomCarousel.dart';
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

  List<Widget> cards = [
    CardFb1(
        text: "Explore",
        imageUrl:
            "https://firebasestorage.googleapis.com/v0/b/flutterbricks-public.appspot.com/o/illustrations%2Fundraw_Working_late_re_0c3y%201.png?alt=media&token=7b880917-2390-4043-88e5-5d58a9d70555",
        subtitle: "+31 books",
        onPressed: () {}),
    CardFb1(
        text: "Explore",
        imageUrl:
            "https://firebasestorage.googleapis.com/v0/b/flutterbricks-public.appspot.com/o/illustrations%2Fundraw_Designer_re_5v95%201.png?alt=media&token=5d053bd8-d0ea-4635-abb6-52d87539b7ec",
        subtitle: "+32 books",
        onPressed: () {}),
    CardFb1(
        text: "Explore",
        imageUrl:
            "https://firebasestorage.googleapis.com/v0/b/flutterbricks-public.appspot.com/o/illustrations%2Fundraw_Accept_terms_re_lj38%201.png?alt=media&token=476b97fd-ba66-4f62-94a7-bce4be794f36",
        subtitle: "+33 books",
        onPressed: () {}),
    CardFb1(
        text: "Explore",
        imageUrl:
            "https://firebasestorage.googleapis.com/v0/b/flutterbricks-public.appspot.com/o/illustrations%2Fundraw_Working_late_re_0c3y%201.png?alt=media&token=7b880917-2390-4043-88e5-5d58a9d70555",
        subtitle: "+34 books",
        onPressed: () {}),
    CardFb1(
        text: "Explore",
        imageUrl:
            "https://firebasestorage.googleapis.com/v0/b/flutterbricks-public.appspot.com/o/illustrations%2Fundraw_Designer_re_5v95%201.png?alt=media&token=5d053bd8-d0ea-4635-abb6-52d87539b7ec",
        subtitle: "+35 books",
        onPressed: () {}),
    CardFb1(
        text: "Explore",
        imageUrl:
            "https://firebasestorage.googleapis.com/v0/b/flutterbricks-public.appspot.com/o/illustrations%2Fundraw_Accept_terms_re_lj38%201.png?alt=media&token=476b97fd-ba66-4f62-94a7-bce4be794f36",
        subtitle: "+36 books",
        onPressed: () {}),
    CardFb1(
        text: "Explore",
        imageUrl:
            "https://firebasestorage.googleapis.com/v0/b/flutterbricks-public.appspot.com/o/illustrations%2Fundraw_Working_late_re_0c3y%201.png?alt=media&token=7b880917-2390-4043-88e5-5d58a9d70555",
        subtitle: "+37 books",
        onPressed: () {}),
    CardFb1(
        text: "Explore",
        imageUrl:
            "https://firebasestorage.googleapis.com/v0/b/flutterbricks-public.appspot.com/o/illustrations%2Fundraw_Designer_re_5v95%201.png?alt=media&token=5d053bd8-d0ea-4635-abb6-52d87539b7ec",
        subtitle: "+38 books",
        onPressed: () {}),
    CardFb1(
        text: "Explore",
        imageUrl:
            "https://firebasestorage.googleapis.com/v0/b/flutterbricks-public.appspot.com/o/illustrations%2Fundraw_Accept_terms_re_lj38%201.png?alt=media&token=476b97fd-ba66-4f62-94a7-bce4be794f36",
        subtitle: "+39 books",
        onPressed: () {}),
  ];

  final double carouselItemMargin = 16;

  late PageController _pageController;
  int _position = 0;

  final ScrollController _controller = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController(initialPage: 0, viewportFraction: .2);
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
          Row(
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
            ],
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
                    // SizedBox(
                    //   height: 250,
                    //   width: 500,
                    //   child: ListView(
                    //     scrollDirection: Axis.horizontal,
                    //     controller: _controller,
                    //     children: cards,
                    //   ),
                    // ),
                    const SizedBox(
                      height: 100,
                    ),
                    SizedBox(
                      height: 250,
                      width: 500,
                      child: ScrollConfiguration(
                        //ScrollBehavior can be set for a specific widget.
                        behavior: MyCustomScrollBehavior(),
                        child: ListView.builder(
                            controller: _controller,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (BuildContext context, int index) {
                              print(index%cards.length);
                              return cards[index%cards.length];
                            }),
                      ),
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

// Widget imageSlider(int position) {
//   return AnimatedBuilder(
//     animation: _pageController,
//     builder: (BuildContext context, widget) {
//       return Container(
//         margin: EdgeInsets.all(carouselItemMargin),
//         child: Center(child: widget),
//       );
//     },
//     child: Container(
//       child: cards[position],
//     ),
//   );
// }
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
