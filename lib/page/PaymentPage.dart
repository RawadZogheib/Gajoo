import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gajoo/api/my_api.dart';
import 'package:gajoo/api/my_session.dart';
import 'package:gajoo/globals/globals.dart' as globals;
import 'package:gajoo/hexColor/hexColor.dart';
import 'package:gajoo/widgets/PaymentPage/CouponItem.dart';
import 'package:gajoo/widgets/PopUp/errorWarningPopup.dart';
import 'package:gajoo/widgets/other/MyCustomScrollBehavior.dart';
import 'package:gajoo/widgets/other/MyFooter.dart';
import 'package:gajoo/widgets/other/MyHeader.dart';
import 'package:gajoo/widgets/other/myDrawer.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({Key? key}) : super(key: key);

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  int? _freeCoupon;
  int? _redCoupon;
  int? _yellowCoupon;
  int? _blueCoupon;
  int? _greenCoupon;
  bool _isLoadingTickets = false;

  List<CouponItem> _children = [];

  @override
  void initState() {
    // TODO: implement initState
    globals.currentPage = 'PaymentPage';
    _getOffers();
    _getCoupons();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => _back(),
      child: Scaffold(
        appBar: MediaQuery.of(context).size.width < 650
            ? AppBar(
                backgroundColor: globals.whiteBlue,
                elevation: 0,
                title: Center(
                  child: Text(
                    'Gajoo',
                    style: TextStyle(
                      fontSize: 28,
                      color: HexColor('#333333'),
                    ),
                  ),
                ),
                leading: IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: HexColor('#333333'),
                    ),
                    onPressed: () {
                      _back();
                    }),
                actions: [
                  Builder(
                    builder: (context) => IconButton(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      icon: Icon(
                        Icons.menu,
                        color: HexColor('#333333'),
                      ),
                      onPressed: () => Scaffold.of(context).openEndDrawer(),
                    ),
                  ),
                ],
              )
            : null,
        endDrawer: myDrawer(),
        backgroundColor: globals.whiteBlue,
        body: Column(
          children: [
            MediaQuery.of(context).size.width > 650
                ? const MyHeader()
                : Container(),
            Expanded(
              child: ScrollConfiguration(
                behavior: MyCustomScrollBehavior(),
                child: SingleChildScrollView(
                  controller: ScrollController(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: 400,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              children: [
                                _isLoadingTickets == true
                                    ? SizedBox(
                                        height: 10.0,
                                        width: 10.0,
                                        child: CircularProgressIndicator(
                                            color: HexColor('#898989')))
                                    : Text(
                                        _freeCoupon == null
                                            ? '-'
                                            : _freeCoupon == 1
                                                ? _freeCoupon.toString()
                                                : '0',
                                        style: TextStyle(
                                          color: HexColor('#898989'),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                const SizedBox(width: 5),
                                const Image(
                                  image: AssetImage(
                                      'Assets/Tickets/freeTicket.png'),
                                  height: 40,
                                  width: 40,
                                  fit: BoxFit.cover,
                                ),
                              ],
                            ),
                            const SizedBox(width: 15),
                            Row(
                              children: [
                                _isLoadingTickets == true
                                    ? SizedBox(
                                        height: 10.0,
                                        width: 10.0,
                                        child: CircularProgressIndicator(
                                            color: HexColor('#ec3227')))
                                    : Text(
                                        _redCoupon == null
                                            ? '-'
                                            : _redCoupon.toString(),
                                        style: TextStyle(
                                          color: HexColor('#ec3227'),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                const SizedBox(width: 5),
                                const Image(
                                  image: AssetImage(
                                      'Assets/Tickets/redTicket.png'),
                                  height: 40,
                                  width: 40,
                                  fit: BoxFit.cover,
                                ),
                              ],
                            ),
                            const SizedBox(width: 15),
                            Row(
                              children: [
                                _isLoadingTickets == true
                                    ? SizedBox(
                                        height: 10.0,
                                        width: 10.0,
                                        child: CircularProgressIndicator(
                                            color: HexColor('#f3b70c')))
                                    : Text(
                                        _yellowCoupon == null
                                            ? '-'
                                            : _yellowCoupon.toString(),
                                        style: TextStyle(
                                          color: HexColor('#f3b70c'),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                const SizedBox(width: 5),
                                const Image(
                                  image: AssetImage(
                                      'Assets/Tickets/yellowTicket.png'),
                                  height: 40,
                                  width: 40,
                                  fit: BoxFit.cover,
                                ),
                              ],
                            ),
                            const SizedBox(width: 15),
                            Row(
                              children: [
                                _isLoadingTickets == true
                                    ? SizedBox(
                                        height: 10.0,
                                        width: 10.0,
                                        child: CircularProgressIndicator(
                                            color: HexColor('#5576c3')))
                                    : Text(
                                        _blueCoupon == null
                                            ? '-'
                                            : _blueCoupon.toString(),
                                        style: TextStyle(
                                          color: HexColor('#5576c3'),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                const SizedBox(width: 5),
                                const Image(
                                  image: AssetImage(
                                      'Assets/Tickets/blueTicket.png'),
                                  height: 40,
                                  width: 40,
                                  fit: BoxFit.cover,
                                ),
                              ],
                            ),
                            const SizedBox(width: 15),
                            Row(
                              children: [
                                _isLoadingTickets == true
                                    ? SizedBox(
                                        height: 10.0,
                                        width: 10.0,
                                        child: CircularProgressIndicator(
                                            color: HexColor('#37ae44')))
                                    : Text(
                                        _greenCoupon == null
                                            ? '-'
                                            : _greenCoupon.toString(),
                                        style: TextStyle(
                                          color: HexColor('#37ae44'),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                const SizedBox(width: 5),
                                const Image(
                                  image: AssetImage(
                                      'Assets/Tickets/greenTicket.png'),
                                  height: 40,
                                  width: 40,
                                  fit: BoxFit.cover,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      //4SmallTickets
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        constraints: BoxConstraints(
                          minHeight: MediaQuery.of(context).size.height * 0.6,
                        ),
                        alignment: Alignment.center,
                        child: Wrap(
                          alignment: WrapAlignment.center,
                          children: _children,
                        ),
                      ),
                      //4BigTickets

                      const SizedBox(
                        height: 25,
                      ),
                      const MyFooter(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _getCoupons() async {
    try {
      print(
          '=========>>======================================================>>==================================================>>=========');
      if (mounted) {
        setState(() {
          _isLoadingTickets = true;
        });
      }
      print('Load tickets');

      var data = {
        'version': globals.version,
        'account_Id': await SessionManager().get("Id"),
      };

      var res = await CallApi()
          .postData(data, '/Payment/Control/(Control)loadCoupons.php');
      print(res.body);
      List<dynamic> body = json.decode(res.body);

      if (body[0] == "success") {
        if (mounted) {
          setState(() {
            _freeCoupon = int.parse(body[1][0]);
            _redCoupon = int.parse(body[1][1]);
            _yellowCoupon = int.parse(body[1][2]);
            _blueCoupon = int.parse(body[1][3]);
            _greenCoupon = int.parse(body[1][4]);

            _children.insert(
              0,
              CouponItem(
                index: 0,
                title: 'STARTER',
                buttonText: 'FREE COUPON',
                image: 'Assets/Tickets/imageTicket0.png',
                val: _freeCoupon == 0 ? 1 : 0,
                price: 'Free',
                imageWidth: 300,
                color1: HexColor('#8e8e8e'),
                enabled: _freeCoupon! == 0 ? true : false,
                buttonEnabled: false,
                onBuy: (index, val) => _updateMyCoupons(index, val),
              ),
            );
          });
        }
      } else if (body[0] == "empty") {
        warningPopup(context, globals.error405);
      } else if (body[0] == "errorVersion") {
        if (mounted) {
          errorPopup(context, globals.errorVersion);
        }
      } else if (body[0] == "errorToken") {
        if (mounted) {
          errorPopup(context, globals.errorToken);
        }
      } else if (body[0] == "error7") {
        if (mounted) {
          warningPopup(context, globals.warning7);
        }
      } else {
        if (mounted) {
          setState(() {
            _isLoadingTickets = false;
          });
          errorPopup(context, globals.errorElse);
        }
      }
      if (mounted) {
        setState(() {
          _isLoadingTickets = false;
        });
      }
    } catch (e) {
      print(e);
      if (mounted) {
        setState(() {
          _isLoadingTickets = false;
        });
        errorPopup(context, globals.errorException);
      }
    }
    print('load library end!!!');
    print(
        '=========<<======================================================<<==================================================<<=========');
  }

  void _getOffers() {
    setState(() {
      _children = [
        CouponItem(
          index: 1,
          title: 'GO BASIC',
          buttonText: 'BUY COUPONS',
          image: 'Assets/Tickets/imageTicket1.png',
          price: '20',
          imageWidth: 300,
          color1: HexColor('#ec3227'),
          buttonEnabled: true,
          onBuy: (index, val) => _updateMyCoupons(index, val),
        ),
        CouponItem(
          index: 2,
          title: 'DELUXE',
          buttonText: 'BUY COUPONS',
          image: 'Assets/Tickets/imageTicket2.png',
          price: '20',
          // val: 6,
          // valInit: 6,
          // couponDiscount: 1,
          imageWidth: 300,
          color1: HexColor('#f3b70c'),
          buttonEnabled: true,
          onBuy: (index, val) => _updateMyCoupons(index, val),
        ),
        CouponItem(
          index: 3,
          title: 'OPTIMUM',
          buttonText: 'BUY COUPONS',
          image: 'Assets/Tickets/imageTicket3.png',
          price: '20',
          // val: 12,
          // valInit: 12,
          // couponDiscount: 2,
          imageWidth: 300,
          color1: HexColor('#5576c3'),
          buttonEnabled: true,
          onBuy: (index, val) => _updateMyCoupons(index, val),
        ),
        CouponItem(
          index: 4,
          title: 'MAGNUM (Group Session Pack)',
          buttonText: 'BUY COUPONS',
          image: 'Assets/Tickets/imageTicket4.png',
          price: '13',
          imageWidth: 300,
          color1: HexColor('#37ae44'),
          buttonEnabled: true,
          onBuy: (index, val) => _updateMyCoupons(index, val),
        ),
      ];
    });
  }

  _updateMyCoupons(int index, int val) {
    setState(() {
      if (index == 0) {
        _freeCoupon = 1;
        setState(() {
          _children.removeAt(0);
          _children.insert(
            0,
            CouponItem(
              index: 0,
              title: 'STARTER',
              buttonText: 'FREE COUPON',
              image: 'Assets/Tickets/imageTicket0.png',
              val: _freeCoupon == 0 ? 1 : 0,
              price: 'Free',
              imageWidth: 300,
              color1: HexColor('#8e8e8e'),
              enabled: _freeCoupon! == 0 ? true : false,
              buttonEnabled: false,
              onBuy: (index, val) => _updateMyCoupons(index, val),
            ),
          );
        });
      } else if (index == 1) {
        _redCoupon = _redCoupon! + val;
      } else if (index == 2) {
        _yellowCoupon = _yellowCoupon! + val;
      } else if (index == 3) {
        _blueCoupon = _blueCoupon! + val;
      } else if (index == 4) {
        _greenCoupon = _greenCoupon! + val;
      }
    });
  }

  _back() {
    Navigator.pushNamedAndRemoveUntil(context, '/HomePage', (route) => false);
  }
}
