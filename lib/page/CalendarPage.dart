import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gajoo/api/my_api.dart';
import 'package:gajoo/api/my_session.dart';
import 'package:gajoo/globals/globals.dart' as globals;
import 'package:gajoo/hexColor/hexColor.dart';
import 'package:gajoo/widgets/CalenderPage/myCustomCalender.dart';
import 'package:gajoo/widgets/PopUp/AlertDialogCalendar.dart';
import 'package:gajoo/widgets/PopUp/errorWarningPopup.dart';
import 'package:gajoo/widgets/other/MyCustomScrollBehavior.dart';
import 'package:gajoo/widgets/other/MyFooter.dart';
import 'package:gajoo/widgets/other/MyHeader.dart';
import 'package:gajoo/widgets/other/TeacherProfile.dart';
import 'package:gajoo/widgets/other/myDrawer.dart';
import 'package:intl/intl.dart';

class CalendarPage extends StatefulWidget {
  String teacherId;

  CalendarPage({Key? key, required this.teacherId}) : super(key: key);

  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  bool _isLoading = false;
  final Set<String> _greenList = {};
  final Set<String> _redList = {};

  int? _freeCoupon;
  int? _redCoupon;
  int? _yellowCoupon;
  int? _blueCoupon;
  int? _greenCoupon;
  bool _isLoadingTickets = false;

  @override
  void initState() {
    // TODO: implement initState
    globals.currentPage = 'CalendarPage';
    _loadDates();
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
                    children: [
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
                      ScrollConfiguration(
                        behavior: MyCustomScrollBehavior(),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          controller: ScrollController(),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TeacherProfile(
                                name: 'Rawad',
                                age: '22',
                                languages: 'Arabic, french, english',
                                nbrOfCourses: '20',
                                coursesReserved: '27',
                                coursesLeft: '3',
                                cancelButton: false,
                                onTap: () => null,
                              ),
                              const SizedBox(
                                width: 60,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(30),
                                    topRight: Radius.circular(30),
                                    bottomLeft: Radius.circular(30),
                                    bottomRight: Radius.circular(30),
                                  ),
                                  child: Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.8,
                                    width: 500,
                                    color: globals.whiteBlue,
                                    child: ScrollConfiguration(
                                      behavior: MyCustomScrollBehavior(),
                                      child: MyCustomCalender(
                                        greenList: _greenList,
                                        redList: _redList,
                                        onDayPressed: (date) {
                                          debugPrint(DateFormat('yyyy-MM-dd')
                                              .format(date));
                                          _checkIfIsLoggedIn(date);
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 50,
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

  _checkIfIsLoggedIn(DateTime _date) async {
    SessionManager session = SessionManager();

    if (await session.get('isLoggedIn') == false) {
      // Is loggedIn
      if (mounted) {
        warningPopup(context, globals.warning400);
      }
    } else if (_date.isBefore(DateTime.parse(
        DateFormat('yyyy-MM-dd').format(DateTime.now().toLocal())))) {
      if (mounted) errorPopup(context, globals.error402); // _date < today
    } else if (_greenList.contains(DateFormat('yyyy-MM-dd').format(
      DateFormat('yyyy-MM-dd').parse(_date.toLocal().toString(), true),
    ))) {
      //_greenList contains _date
      showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialogCalendar(
          teacherId: widget.teacherId,
          color: Colors.green,
          date: _date,
        ),
      ).then((value) {
        _loadDates();
        _getCoupons();
      });
    } else if (_redList.contains(DateFormat('yyyy-MM-dd').format(
      DateFormat('yyyy-MM-dd').parse(_date.toLocal().toString(), true),
    ))) {
      // _redList contains _date
      showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialogCalendar(
          teacherId: widget.teacherId,
          color: Colors.red,
          date: _date,
        ),
      ).then((value) {
        _loadDates();
        _getCoupons();
      });
      // if (mounted) {
      //   ErrorPopup(context, globals.error401);
      // }
    } else {
      // Error else
      if (mounted) errorPopup(context, globals.error406);
    }
  }

  Future<void> _loadDates() async {
    // Load from db
    if (_isLoading == false) {
      try {
        debugPrint(
            '=========>>======================================================>>==================================================>>=========');
        _isLoading = true;
        debugPrint('Load calendar');

        var data = {
          'version': globals.version,
          'account_Id': await SessionManager().get("Id"),
          'teacher_Id': widget.teacherId,
          'type': globals.type,
          'language': globals.language,
          'level': globals.level,
        };

        var res = await CallApi()
            .postData(data, '/Calendar/Control/(Control)loadDates.php');
        debugPrint(res.body);
        List<dynamic> body = json.decode(res.body);

        _greenList.clear();
        _redList.clear();

        if (body[0] == "success") {
          for (int i = 0; i < body[1].length; i++) {
            _greenList.add(
              DateFormat('yyyy-MM-dd').format(
                DateFormat('yyyy-MM-dd HH:mm')
                    .parse('${body[1][i]}.000', true)
                    .toLocal(),
              ),
            );
          }

          for (int j = 0; j < body[2].length; j++) {
            _redList.add(
              DateFormat('yyyy-MM-dd').format(
                DateFormat('yyyy-MM-dd HH:mm')
                    .parse('${body[2][j]}.000', true)
                    .toLocal(),
              ),
            );
          }

          if (mounted) {
            setState(() {
              _greenList;
              _redList;
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
          _isLoading = false;
          if (mounted) {
            errorPopup(context, globals.errorElse);
          }
        }
        _isLoading = false;
      } catch (e) {
        debugPrint(e.toString());
        _isLoading = false;
        if (mounted) {
          errorPopup(context, globals.errorException);
        }
      }
      debugPrint('load calendar end!!!');
      debugPrint(
          '=========<<======================================================<<==================================================<<=========');
    }
  }

  Future<void> _getCoupons() async {
    try {
      debugPrint(
          '=========>>======================================================>>==================================================>>=========');
      if (mounted) {
        setState(() {
          _isLoadingTickets = true;
        });
      }
      debugPrint('Load coupons');

      var data = {
        'version': globals.version,
        'account_Id': await SessionManager().get("Id"),
      };

      var res = await CallApi()
          .postData(data, '/Payment/Control/(Control)loadCoupons.php');
      debugPrint(res.body);
      List<dynamic> body = json.decode(res.body);

      if (body[0] == "success") {
        if (mounted) {
          setState(() {
            _freeCoupon = int.parse(body[1][0]);
            _redCoupon = int.parse(body[1][1]);
            _yellowCoupon = int.parse(body[1][2]);
            _blueCoupon = int.parse(body[1][3]);
            _greenCoupon = int.parse(body[1][4]);

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
      debugPrint(e.toString());
      if (mounted) {
        setState(() {
          _isLoadingTickets = false;
        });
        errorPopup(context, globals.errorException);
      }
    }
    debugPrint('load coupons end!!!');
    debugPrint(
        '=========<<======================================================<<==================================================<<=========');
  }

  _back() {
    Navigator.pushNamedAndRemoveUntil(context, '/HomePage', (route) => false);
  }
}
