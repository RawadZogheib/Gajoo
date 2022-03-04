import 'package:flutter/material.dart';
import 'package:gajoo/globals/globals.dart' as globals;
import 'package:gajoo/hexColor/hexColor.dart';
import 'package:gajoo/widgets/CalenderPage/myCustomCalender.dart';
import 'package:gajoo/widgets/HomePage/MyFooter.dart';
import 'package:gajoo/widgets/PopUp/AlertDialogCalender.dart';
import 'package:gajoo/widgets/PopUp/errorWarningPopup.dart';
import 'package:gajoo/widgets/other/MyCustomScrollBehavior.dart';
import 'package:gajoo/widgets/other/myDrawer.dart';
import 'package:intl/intl.dart';

class CalenderPage extends StatefulWidget {
  @override
  _CalenderPageState createState() => _CalenderPageState();
}

class _CalenderPageState extends State<CalenderPage> {
  bool _isLogedIn = true;
  Set<String> _greenList = {};
  Set<String> _redList = {};

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _greenList.addAll([
      DateFormat('yyyy-MM-dd').format(DateTime.utc(2022, 03, 01)),
      DateFormat('yyyy-MM-dd').format(DateTime.utc(2022, 03, 04)),
      DateFormat('yyyy-MM-dd').format(DateTime.utc(2022, 03, 05)),
      DateFormat('yyyy-MM-dd').format(DateTime.utc(2022, 03, 08)),
      DateFormat('yyyy-MM-dd').format(DateTime.utc(2022, 03, 09)),
      DateFormat('yyyy-MM-dd').format(DateTime.utc(2022, 03, 10)),
      DateFormat('yyyy-MM-dd').format(DateTime.utc(2023, 03, 03)),
    ]);
    _redList.addAll([
      DateFormat('yyyy-MM-dd').format(DateTime.utc(2022, 03, 06)),
      DateFormat('yyyy-MM-dd').format(DateTime.utc(2022, 03, 03)),
      DateFormat('yyyy-MM-dd').format(DateTime.utc(2022, 03, 11)),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: myDrawer(),
      body: Builder(
        builder: (context) => ScrollConfiguration(
          behavior: MyCustomScrollBehavior(),
          child: SingleChildScrollView(
            controller: ScrollController(),
            child: Column(
              children: [
                SizedBox(
                  height: 100,
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
                      _isLogedIn == false
                          ? Container(
                              height: 60,
                              width: 120,
                              margin: const EdgeInsets.only(right: 16.0),
                              child: ElevatedButton(
                                onPressed: () =>
                                    Navigator.of(context).pushNamed('/Login'),
                                child: const Text('Login'),
                              ),
                            )
                          : Container(
                              margin: const EdgeInsets.only(right: 20.0),
                              child: Row(
                                children: [
                                  const Text(
                                    'Rawad Zogheib',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    width: 12,
                                  ),
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    onTap: () =>
                                        Scaffold.of(context).openEndDrawer(),
                                    child: CircleAvatar(
                                      backgroundColor: HexColor('#222222'),
                                      backgroundImage: const AssetImage(
                                          'Assets/HomePage/ProfilePicture/img1.png'),
                                      maxRadius: 35,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                    ],
                  ),
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
                      height: 700,
                      width: 500,
                      color: globals.whiteBlue,
                      child: ScrollConfiguration(
                        behavior: MyCustomScrollBehavior(),
                        child: MyCustomCalender(
                          greenList: _greenList,
                          redList: _redList,
                          onDayPressed: (date) {
                            print(DateFormat('yyyy-MM-dd').format(date));
                            _checkIfIsLoggedIn(date);
                          },
                        ),
                      ),
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
    );
  }

  _checkIfIsLoggedIn(DateTime _date) {
    if (_isLogedIn == false) {
      WarningPopup(context, globals.warningNotLogedIn);
    } else if(_greenList.contains(DateFormat('yyyy-MM-dd').format(_date))){
      showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialogCalender(
          color: Colors.green,
          date: _date,
        ),
      );
    }else if(_redList.contains(DateFormat('yyyy-MM-dd').format(_date))){
      ErrorPopup(context, globals.errorDayIsFull);
    }else{
      ErrorPopup(context, globals.errorDayNotAvailable);
    }
  }
}
