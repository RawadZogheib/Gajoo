import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gajoo/api/my_api.dart';
import 'package:gajoo/api/my_session.dart';
import 'package:gajoo/globals/globals.dart' as globals;
import 'package:gajoo/hexColor/hexColor.dart';
import 'package:gajoo/widgets/PopUp/errorWarningPopup.dart';
import 'package:gajoo/widgets/other/MyCustomScrollBehavior.dart';

class myDrawer extends StatefulWidget {
  @override
  State<myDrawer> createState() => _myDrawerState();
}

class _myDrawerState extends State<myDrawer> {
  bool _isLoggedIn = false;
  int? _freeCoupon;
  int? _redCoupon;
  int? _yellowCoupon;
  int? _blueCoupon;
  int? _greenCoupon;

  @override
  void initState() {
    // TODO: implement initState
    _loadIsLoggedIn();
    _getCoupon();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: HexColor('#222222'), //globals.blue1,
        child: ScrollConfiguration(
          behavior: MyCustomScrollBehavior(),
          child: ListView(
            controller: ScrollController(),
            children: <Widget>[
              Column(
                children: [
                  SizedBox(
                    height: 250,
                    width: MediaQuery.of(context).size.width,
                    child: Image.asset(
                      'Assets/HomePage/ProfilePicture/img1.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      children: [
                        const SizedBox(height: 12),
                        ScrollConfiguration(
                          behavior: MyCustomScrollBehavior(),
                          child: SingleChildScrollView(
                            controller: ScrollController(),
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Row(
                                  children: [
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      onTap: () => _goToPaymentPage(),
                                      child: globals.isLoading == true
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
                                    ),
                                    const SizedBox(width: 5),
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      onTap: () => _goToPaymentPage(),
                                      child: const Image(
                                        image: AssetImage(
                                            'Assets/Tickets/redTicket.png'),
                                        height: 35,
                                        width: 35,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(width: 10),
                                Row(
                                  children: [
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      onTap: () => _goToPaymentPage(),
                                      child: globals.isLoading == true
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
                                    ),
                                    const SizedBox(width: 5),
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      onTap: () => _goToPaymentPage(),
                                      child: const Image(
                                        image: AssetImage(
                                            'Assets/Tickets/yellowTicket.png'),
                                        height: 35,
                                        width: 35,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(width: 10),
                                Row(
                                  children: [
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      onTap: () => _goToPaymentPage(),
                                      child: globals.isLoading == true
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
                                    ),
                                    const SizedBox(width: 5),
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      onTap: () => _goToPaymentPage(),
                                      child: const Image(
                                        image: AssetImage(
                                            'Assets/Tickets/blueTicket.png'),
                                        height: 35,
                                        width: 35,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(width: 10),
                                Row(
                                  children: [
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      onTap: () => _goToPaymentPage(),
                                      child: globals.isLoading == true
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
                                    ),
                                    const SizedBox(width: 5),
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      onTap: () => _goToPaymentPage(),
                                      child: const Image(
                                        image: AssetImage(
                                            'Assets/Tickets/greenTicket.png'),
                                        height: 35,
                                        width: 35,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(width: 10),
                                Row(
                                  children: [
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      onTap: () => _goToPaymentPage(),
                                      child: globals.isLoading == true
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
                                    ),
                                    const SizedBox(width: 5),
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      onTap: () => _goToPaymentPage(),
                                      child: const Image(
                                        image: AssetImage(
                                            'Assets/Tickets/freeTicket.png'),
                                        height: 35,
                                        width: 35,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 22),
                        const SearchFieldDrawer(),
                        const SizedBox(height: 12),
                        MenuItem(
                          text: 'My Courses',
                          icon: Icons.menu_book,
                          color: Colors.red,
                          onClicked: () => selectedItem(context, 0),
                        ),
                        const SizedBox(height: 5),
                        MenuItem(
                          text: 'Liked Courses',
                          icon: Icons.favorite_border,
                          color: Colors.yellow,
                          onClicked: () => selectedItem(context, 1),
                        ),
                        const SizedBox(height: 5),
                        MenuItem(
                          text: 'Liked Teachers',
                          icon: Icons.people,
                          color: Colors.blue,
                          onClicked: () => selectedItem(context, 2),
                        ),
                        const SizedBox(height: 5),
                        MenuItem(
                          text: 'Updates',
                          icon: Icons.update,
                          color: Colors.green,
                          onClicked: () => selectedItem(context, 3),
                        ),
                        const SizedBox(height: 8),
                        const Divider(color: Colors.white70),
                        const SizedBox(height: 8),
                        MenuItem(
                          text: 'Notifications',
                          icon: Icons.notifications_outlined,
                          color: globals.whiteBlue,
                          onClicked: () => selectedItem(context, 4),
                        ),
                        MenuItem(
                          text: 'Settings',
                          icon: Icons.settings,
                          color: globals.whiteBlue,
                          onClicked: () => selectedItem(context, 5),
                        ),
                        const SizedBox(height: 8),
                        MenuItem(
                          text: 'Logout',
                          icon: Icons.logout,
                          color: globals.whiteBlue,
                          onClicked: () => selectedItem(context, 6),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> selectedItem(BuildContext context, int index) async {
    Navigator.of(context).pop();
    switch (index) {
      case 0: // My Courses
        if (globals.currentPage != 'MyCourses') {
          Navigator.of(context)
              .pushNamedAndRemoveUntil('/MyCourses', (route) => false);
        }
        break;
      case 1: // Liked Courses
        // Navigator.of(context).push(MaterialPageRoute(
        //   builder: (context) => const Scaffold(), // Page 2
        // ));
        WarningPopup(context, 'Coming Soon!!');
        break;
      case 2: // Liked Teachers
        if (globals.currentPage != 'LikedTeachersPage') {
          Navigator.of(context)
              .pushNamedAndRemoveUntil('/LikedTeachersPage', (route) => false);
        }
        break;
      case 3: // Updates
        // Navigator.of(context).push(MaterialPageRoute(
        //   builder: (context) => const Scaffold(), // Page 4
        // ));
        WarningPopup(context, 'Coming Soon!!');
        break;
      case 4: // Notifications
        // Navigator.of(context).push(MaterialPageRoute(
        //   builder: (context) => const Scaffold(), // Page 5
        // ));
        WarningPopup(context, 'Coming Soon!!');
        break;
      case 5: // Settings
        // Navigator.of(context).push(MaterialPageRoute(
        //   builder: (context) => const Scaffold(), // Page 6
        // ));
        if (globals.currentPage != 'MySettings') {
          Navigator.of(context)
              .pushNamedAndRemoveUntil('/MySettings', (route) => false);
        }
        break;

      case 6: // Logout
        SessionManager session = SessionManager();
        await session.destroy();

        Navigator.of(context)
            .pushNamedAndRemoveUntil('/HomePage', (route) => false);

        break;
    }
  }

  _goToPaymentPage() {
    if (globals.currentPage != 'PaymentPage') {
      Navigator.of(context)
          .pushNamedAndRemoveUntil('/PaymentPage', (route) => false);
    }
  }

  Future<void> _getCoupon() async {
    if (globals.isLoading == false) {
      try {
        print(
            '=========>>======================================================>>==================================================>>=========');
        if (mounted) {
          setState(() {
            globals.isLoading = true;
          });
        } else {
          globals.isLoading = true;
        }
        print('Load coupons');

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
            });
          }
        } else if (body[0] == "empty") {
          print('There is no coupons');
          //WarningPopup(context, globals.error405);
        } else if (body[0] == "errorVersion") {
          if (mounted) {
            ErrorPopup(context, globals.errorVersion);
          }
        } else if (body[0] == "errorToken") {
          if (mounted) {
            ErrorPopup(context, globals.errorToken);
          }
        } else if (body[0] == "error7") {
          if (mounted) {
            WarningPopup(context, globals.warning7);
          }
        } else {
          if (mounted) {
            setState(() {
              globals.isLoading = false;
            });
            ErrorPopup(context, globals.errorElse);
          } else {
            globals.isLoading = false;
          }
        }
        if (mounted) {
          setState(() {
            globals.isLoading = false;
          });
        } else {
          globals.isLoading = false;
        }
      } catch (e) {
        print(e);
        if (mounted) {
          setState(() {
            globals.isLoading = false;
          });
          ErrorPopup(context, globals.errorException);
        } else {
          globals.isLoading = false;
        }
      }
      print('load library end!!!');
      print(
          '=========<<======================================================<<==================================================<<=========');
    }
  }

  Future<void> _loadIsLoggedIn() async {
    SessionManager session = SessionManager();
    if(await session.containsKey('isLoggedIn')) {
      _isLoggedIn = await session.get('isLoggedIn');
      setState(() {
        _isLoggedIn;
      });
    }else{
      setState(() {
        _isLoggedIn = false;
      });
    }
  }
}

class MenuItem extends StatelessWidget {
  final String text;
  final IconData icon;
  final Color color;
  final VoidCallback? onClicked;

  const MenuItem({
    required this.text,
    required this.icon,
    required this.color,
    this.onClicked,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Color color = globals.whiteBlue;//Colors.white;
    Color hoverColor = Colors.transparent.withOpacity(1); //Colors.white70;

    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(text, style: TextStyle(color: color)),
      hoverColor: hoverColor,
      onTap: onClicked,
    );
  }
}

class SearchFieldDrawer extends StatelessWidget {
  const SearchFieldDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const color = Colors.white;

    return TextField(
      style: const TextStyle(color: color, fontSize: 14),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        hintText: 'Search',
        hintStyle: const TextStyle(color: color),
        prefixIcon: const Icon(
          Icons.search,
          color: color,
          size: 20,
        ),
        filled: true,
        fillColor: Colors.white12,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: color.withOpacity(0.7)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: color.withOpacity(0.7)),
        ),
      ),
    );
  }
}
