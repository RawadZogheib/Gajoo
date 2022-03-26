import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';

class CouponItem extends StatefulWidget {
  int index;
  String image;
  int val;
  int? price;
  int? price2;
  double imageWidth;
  Color color1;
  bool buttonEnabled;

  CouponItem({
    Key? key,
    required this.index,
    required this.image,
    this.val = 0,
    required this.price,
    this.price2,
    required this.imageWidth,
    required this.color1,
    required this.buttonEnabled,
  }) : super(key: key);

  @override
  State<CouponItem> createState() => _CouponItemState();
}

class _CouponItemState extends State<CouponItem> {
  @override
  void initState() {
    // TODO: implement initState
    _chooseText(widget.index);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return FlipCard(
      front: Container(
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
              Ticket(
                innerRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(10.0),
                    bottomRight: Radius.circular(10.0)),
                outerRadius: const BorderRadius.all(Radius.circular(10.0)),
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
                            widget.val > 0 && widget.buttonEnabled == true
                                ? InkWell(
                                    onTap: () => setState(() {
                                      widget.val--;
                                    }),
                                    child: Icon(
                                      Icons.remove,
                                      color: widget.color1,
                                    ),
                                  )
                                : const Icon(
                                    Icons.remove,
                                    color: Colors.grey,
                                  ),
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
                                : const Icon(
                                    Icons.add,
                                    color: Colors.grey,
                                  ),
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
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                              crossAxisAlignment: CrossAxisAlignment.start,
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                const Text('Price'),
                                FittedBox(
                                  child: Text(
                                    widget.price != null
                                        ? '\$${widget.price}'
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
                        child: const Center(
                          child: Text(
                            'BUY COUPONS',
                            style: TextStyle(color: Colors.white, fontSize: 16.0),
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
      back: Container(
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
              Ticket(
                innerRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(10.0),
                    bottomRight: Radius.circular(10.0)),
                outerRadius: const BorderRadius.all(Radius.circular(10.0)),
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
                    children: [

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

  void _chooseText(int index) {
    switch (index) {
      case 0: // Free Offre

        break;
      case 1: // 15$

        break;
      case 2: // 100

        break;
      case 3: // 10% discount

        break;
      case 4: // Group 9y to 15y

        break;
      case 5: // Group 16yto 25y

        break;

      case 6: // Group 26y+

        break;
    }
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

  ClipShadow(
      {required this.boxShadow, required this.clipper, required this.child});

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
