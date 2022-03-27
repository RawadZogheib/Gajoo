import 'dart:async';

import 'package:flip_card/flip_card.dart';
import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_placeholder_textlines/flutter_placeholder_textlines.dart';

class CouponItem extends StatefulWidget {
  int index;
  String title;
  String buttonText;
  String image;
  int val;
  String price;
  double sliderValue;
  double imageWidth;
  Color color1;
  bool buttonEnabled;

  CouponItem({
    Key? key,
    required this.index,
    required this.title,
    required this.buttonText,
    required this.image,
    this.val = 0,
    this.sliderValue = 0.3,
    required this.price,
    required this.imageWidth,
    required this.color1,
    required this.buttonEnabled,
  }) : super(key: key);

  @override
  State<CouponItem> createState() => _CouponItemState();
}

class _CouponItemState extends State<CouponItem> {
  FlipCardController flipCardController = FlipCardController();
  bool _isFlipping = false;
  bool _isFront = true;
  bool _isLoadText = true;
  Timer? _timer;
  int k = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print(k++);
    return InkWell(
      onTap: () => _hoverFlipperOnTap(),
      onHover: (boolVal) => _hoverFlipperOnHover(boolVal),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 4.0),
        child: SizedBox(
          width: 375,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const SizedBox(
                height: 30.0,
              ),
              FlipCard(
                controller: flipCardController,
                flipOnTouch: false,
                front: Stack(
                  alignment: Alignment.center,
                  children: [
                    Ticket(
                      innerRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(10.0),
                          bottomRight: Radius.circular(10.0)),
                      outerRadius:
                          const BorderRadius.all(Radius.circular(10.0)),
                      boxShadow: const [
                        BoxShadow(
                          offset: Offset(0, 4.0),
                          blurRadius: 2.0,
                          spreadRadius: 2.0,
                          color: Color.fromRGBO(196, 196, 196, .76),
                        )
                      ],
                      child: Image.asset(
                        widget.image,
                        width: widget.imageWidth,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Positioned(
                      top: 10,
                      child: Text(
                        widget.title,
                        style: TextStyle(fontSize: 18, color: widget.color1),
                      ),
                    ),
                  ],
                ),
                back: Stack(
                  alignment: Alignment.center,
                  children: [
                    Ticket(
                      innerRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(10.0),
                          bottomRight: Radius.circular(10.0)),
                      outerRadius:
                          const BorderRadius.all(Radius.circular(10.0)),
                      boxShadow: const [
                        BoxShadow(
                          offset: Offset(0, 4.0),
                          blurRadius: 2.0,
                          spreadRadius: 2.0,
                          color: Color.fromRGBO(196, 196, 196, .76),
                        )
                      ],
                      child: Container(
                        height: widget.imageWidth,
                        width: widget.imageWidth,
                        color: Colors.white,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _isLoadText == true
                                ? _isFront == false
                                    ? SizedBox(
                                        width: 300,
                                        child: PlaceholderLines(
                                          maxWidth: 0.95,
                                          minWidth: 0.62,
                                          count: 5,
                                          animate: true,
                                          align: TextAlign.center,
                                          color: widget.color1,
                                        ),
                                      )
                                    : Container()
                                : _chooseText(widget.index),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: 10,
                      child: Text(
                        widget.title,
                        style: TextStyle(fontSize: 18, color: widget.color1),
                      ),
                    ),
                  ],
                ),
              ),
              Ticket(
                innerRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10.0),
                    topRight: Radius.circular(10.0)),
                outerRadius: const BorderRadius.all(Radius.circular(10.0)),
                boxShadow: const [
                  BoxShadow(
                    offset: Offset(0, 4),
                    blurRadius: 2.0,
                    spreadRadius: 2.0,
                    color: Color.fromRGBO(196, 196, 196, .76),
                  )
                ],
                child: Container(
                  color: Colors.white,
                  height: 152,
                  width: 300,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            widget.buttonEnabled == true
                                ? InkWell(
                                    onTap: () => setState(() {
                                      widget.val > 0
                                          ? widget.val--
                                          : widget.val;
                                    }),
                                    child: Icon(
                                      Icons.remove,
                                      color: widget.val > 0
                                          ? widget.color1
                                          : Colors.grey,
                                    ),
                                  )
                                : Container(),
                            Text(
                              ('${widget.val} COUPON') +
                                  (widget.val > 1 ? 'S' : ''),
                              style: const TextStyle(fontSize: 18.0),
                            ),
                            widget.buttonEnabled == true
                                ? InkWell(
                                    onTap: () => setState(() {
                                      widget.val++;
                                    }),
                                    child: Icon(
                                      Icons.add,
                                      color: widget.color1,
                                    ),
                                  )
                                : Container(),
                          ],
                        ),
                      ),
                      const Divider(height: 0.0),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: const <Widget>[
                                  Text('Date'),
                                  FittedBox(
                                    child: Text(
                                      '08/17   ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 18.0),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                              child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: const <Widget>[
                                Text('Time'),
                                FittedBox(
                                  child: Text(
                                    '9:00PM',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18.0),
                                  ),
                                )
                              ],
                            ),
                          )),
                          Expanded(
                              child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                const Text('Price'),
                                FittedBox(
                                  child: Text(
                                    widget.price != 'Free' &&
                                            widget.price != 'free'
                                        ? '${widget.price}€'
                                        : 'Free',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18.0),
                                  ),
                                )
                              ],
                            ),
                          )),
                        ],
                      ),
                      Container(
                        width: double.infinity,
                        color: widget.color1,
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Center(
                          child: Text(
                            widget.buttonText,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 16.0),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _chooseText(int index) {
    Widget? myWidget;
    switch (index) {
      case 0: // Free Offer
        myWidget = Center(
          child: Text(
            'First trial session\nfree of charge (30min).',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: widget.color1,
            ),
            textAlign: TextAlign.center,
          ),
        );
        break;
      case 1: // 15$
        myWidget = Center(
          child: Text(
            'Normal individual\nsession (45min).',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: widget.color1,
            ),
            textAlign: TextAlign.center,
          ),
        );
        break;
      case 2: // 100
        myWidget = Center(
          child: Text(
            'If you book 6hours/week\n100Euro instead of 120Euro.',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: widget.color1,
            ),
            textAlign: TextAlign.center,
          ),
        );
        break;
      case 3: // 10% discount
        myWidget = Center(
          child: Column(
            children: [
              Text(
                'If you book monthly in advance\n(min. 12sessions/month)\nyou will get 10% discount.',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: widget.color1,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    thumbShape:
                        const RoundSliderThumbShape(enabledThumbRadius: 0.0),
                    overlayShape:
                        const RoundSliderThumbShape(enabledThumbRadius: 0.0),
                  ),
                  child: Slider(
                    value: widget.sliderValue,
                    max: 12,
                    activeColor: widget.color1,
                    onChanged: (double value) {},
                  ),
                ),
              ),
            ],
          ),
        );
        break;
      case 4: // Group 9y to 15y, 16yto 25y, 26y+
        myWidget = Center(
          child: Text(
            '\n>  Age condition:'
            '\n           From 9y to 15y.'
            '\n           From 16y to 25y.'
            '\n           Above 26y.'
            '\n>Members (3-5 person).',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: widget.color1,
            ),
            textAlign: TextAlign.start,
          ),
        );
        break;
    }

    myWidget ??= Container();
    return myWidget;
  }

  _hoverFlipperOnTap() async {
    if (_isFlipping == false) {
      _isFlipping = true;
      _timer?.cancel();
      if (flipCardController.state?.isFront == true) {
        setState(() {
          _isLoadText = true;
          _isFront = false;
        });
        await flipCardController.controller?.forward();
        flipCardController.state?.isFront = false;
        _timer?.cancel();
        _timer = Timer.periodic(const Duration(seconds: 1), (Timer t) {
          setState(() {
            _isLoadText = false;
          });
          _timer?.cancel();
        });
      } else {
        _timer?.cancel();
        await flipCardController.controller?.reverse();
        setState(() {
          _isFront = true;
          flipCardController.state?.isFront = true;
        });
      }
      _isFlipping = false;
    }
  }

  _hoverFlipperOnHover(bool boolVal) async {
    _isFlipping = true;
    _timer?.cancel();
    if (boolVal == true) {
      setState(() {
        _isLoadText = true;
        _isFront = false;
      });
      await flipCardController.controller?.forward();
      flipCardController.state?.isFront = false;
      _timer?.cancel();
      _timer = Timer.periodic(const Duration(seconds: 1), (Timer t) {
        setState(() {
          _isLoadText = false;
        });
        _timer?.cancel();
      });
    } else {
      _timer?.cancel();
      await flipCardController.controller?.reverse();
      setState(() {
        _isFront = true;
        flipCardController.state?.isFront = true;
      });
    }
    _isFlipping = false;
  }
}

class Ticket extends StatelessWidget {
  const Ticket(
      {Key? key,
      this.innerRadius = const BorderRadius.all(Radius.circular(0.0)),
      this.outerRadius = const BorderRadius.all(Radius.circular(0.0)),
      required this.child,
      this.boxShadow = const [],
      this.dashedBottom = false})
      : super(key: key);

  final BorderRadius innerRadius;

  final BorderRadius outerRadius;

  final List<BoxShadow> boxShadow;

  // TODO: custom border styles
  final bool dashedBottom;

  /// The [child] contained by the ticket widget.
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ClipShadow(
      clipper: _TicketClipper(innerRadius, outerRadius),
      boxShadow: boxShadow,
      child: child,
    );
  }
}

class _TicketClipper extends CustomClipper<Path> {
  _TicketClipper(this.innerRadius, this.outerRadius);

  final BorderRadius innerRadius;

  final BorderRadius outerRadius;

  @override
  Path getClip(Size size) {
    /// approximation to a circular arc
    const C = 0.551915024494;
    final path = Path();

    var currentUseInner = false;
    var currentRadius = const Radius.circular(0.0);

    currentUseInner = innerRadius.topLeft != const Radius.circular(0.0);
    currentRadius = currentUseInner ? innerRadius.topLeft : outerRadius.topLeft;
    path.moveTo(0.0, currentRadius.y);
    path.cubicTo(
        currentUseInner ? currentRadius.x * C : 0.0,
        currentUseInner ? currentRadius.y : currentRadius.y * (1 - C),
        currentUseInner ? currentRadius.x : currentRadius.x * (1 - C),
        currentUseInner ? currentRadius.y * C : 0.0,
        currentRadius.x,
        0.0);

    currentUseInner = innerRadius.topRight != const Radius.circular(0.0);
    currentRadius =
        currentUseInner ? innerRadius.topRight : outerRadius.topRight;
    path.lineTo(size.width - currentRadius.x, 0.0);
    path.cubicTo(
        currentUseInner
            ? size.width - currentRadius.x
            : size.width - currentRadius.x * (1 - C),
        currentUseInner ? currentRadius.y * C : 0.0,
        currentUseInner ? size.width - currentRadius.x * C : size.width,
        currentUseInner ? currentRadius.y : currentRadius.y * (1 - C),
        size.width,
        currentRadius.y);

    currentUseInner = innerRadius.bottomRight != const Radius.circular(0.0);
    currentRadius =
        currentUseInner ? innerRadius.bottomRight : outerRadius.bottomRight;
    path.lineTo(size.width, size.height - currentRadius.y);
    path.cubicTo(
        currentUseInner ? size.width - currentRadius.x * C : size.width,
        currentUseInner
            ? size.height - currentRadius.y
            : size.height - currentRadius.y * (1 - C),
        currentUseInner
            ? size.width - currentRadius.x
            : size.width - currentRadius.x * (1 - C),
        currentUseInner ? size.height - currentRadius.y * C : size.height,
        size.width - currentRadius.x,
        size.height);

    currentUseInner = innerRadius.bottomLeft != const Radius.circular(0.0);
    currentRadius =
        currentUseInner ? innerRadius.bottomLeft : outerRadius.bottomLeft;
    path.lineTo(currentRadius.x, size.height);
    path.cubicTo(
        currentUseInner ? currentRadius.x : currentRadius.x * (1 - C),
        currentUseInner ? size.height - currentRadius.y * C : size.height,
        currentUseInner ? currentRadius.x * C : 0.0,
        currentUseInner
            ? size.height - currentRadius.y
            : size.height - currentRadius.y * (1 - C),
        0.0,
        size.height - currentRadius.y);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

class _ClipShadowPainter extends CustomPainter {
  const _ClipShadowPainter({
    required this.clipper,
    required this.boxShadows,
    required List<BoxShadow> clipShadow,
  });

  final CustomClipper<Path> clipper;
  final List<BoxShadow> boxShadows;

  @override
  void paint(Canvas canvas, Size size) {
    for (final shadow in boxShadows) {
      final spreadSize = Size(
        size.width + shadow.spreadRadius * 2,
        size.height + shadow.spreadRadius * 2,
      );
      final clipPath = clipper.getClip(spreadSize).shift(
            Offset(
              shadow.offset.dx - shadow.spreadRadius,
              shadow.offset.dy - shadow.spreadRadius,
            ),
          );
      final paint = shadow.toPaint();
      canvas.drawPath(clipPath, paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class ClipShadow extends StatelessWidget {
  /// A list of shadows cast by this box behind the box.
  final List<BoxShadow> boxShadow;

  /// If non-null, determines which clip to use.
  final CustomClipper<Path> clipper;

  /// The [Widget] below this widget in the tree.
  final Widget child;

  const ClipShadow(
      {Key? key,
      required this.boxShadow,
      required this.clipper,
      required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _ClipShadowPainter(
          clipShadow: boxShadow, clipper: clipper, boxShadows: []),
      child: ClipPath(
        clipper: clipper,
        child: child,
      ),
    );
  }
}
