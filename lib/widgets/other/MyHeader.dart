import 'package:flutter/material.dart';
import 'package:gajoo/globals/globals.dart' as globals;
import 'package:gajoo/hexColor/hexColor.dart';

class MyHeader extends StatelessWidget {
  const MyHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String _redCoupon = '0';
    String _yellowCoupon = '0';
    String _blueCoupon = '0';
    String _greenCoupon = '0';

    return Container(
      height: 100,
      color: globals.whiteBlue,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            hoverColor: Colors.transparent,
            onTap: () {
              if (globals.currentPage != 'HomePage') {
                Navigator.of(context)
                    .pushNamedAndRemoveUntil('/HomePage', (route) => false);
              }
            },
            child: Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                'Assets/HomePage/logo.png',
                height: 95,
                width: 300,
                fit: BoxFit.contain,
              ),
            ),
          ),
          globals.isLoggedIn == false
              ? Container(
                  height: 60,
                  width: 120,
                  margin: const EdgeInsets.only(right: 16.0),
                  child: ElevatedButton(
                    onPressed: () => Navigator.of(context)
                        .pushNamedAndRemoveUntil('/Login', (route) => false),
                    child: const Text('Login'),
                  ),
                )
              : Container(
                  margin: const EdgeInsets.only(right: 20.0),
                  child: Row(
                    children: [
                      // Row(
                      //   children: [
                      //     Text(
                      //       _redTicket,
                      //       style: TextStyle(
                      //         color: HexColor('#ec3227'),
                      //         fontWeight: FontWeight.bold,
                      //       ),
                      //     ),
                      //     const SizedBox(width: 5),
                      //     const Image(
                      //       image: AssetImage('Assets/Tickets/redTicket.png'),
                      //       height: 40,
                      //       width: 40,
                      //       fit: BoxFit.cover,
                      //     ),
                      //   ],
                      // ),
                      // const SizedBox(width: 15),
                      // Row(
                      //   children: [
                      //     Text(
                      //       _yellowTicket,
                      //       style: TextStyle(
                      //         color: HexColor('#f3b70c'),
                      //         fontWeight: FontWeight.bold,
                      //       ),
                      //     ),
                      //     const SizedBox(width: 5),
                      //     const Image(
                      //       image:
                      //           AssetImage('Assets/Tickets/yellowTicket.png'),
                      //       height: 40,
                      //       width: 40,
                      //       fit: BoxFit.cover,
                      //     ),
                      //   ],
                      // ),
                      // const SizedBox(width: 15),
                      // Row(
                      //   children: [
                      //     Text(
                      //       _blueTicket,
                      //       style: TextStyle(
                      //         color: HexColor('#5576c3'),
                      //         fontWeight: FontWeight.bold,
                      //       ),
                      //     ),
                      //     const SizedBox(width: 5),
                      //     const Image(
                      //       image: AssetImage('Assets/Tickets/blueTicket.png'),
                      //       height: 40,
                      //       width: 40,
                      //       fit: BoxFit.cover,
                      //     ),
                      //   ],
                      // ),
                      // const SizedBox(width: 15),
                      // Row(
                      //   children: [
                      //     Text(
                      //       _greenTicket,
                      //       style: TextStyle(
                      //         color: HexColor('#37ae44'),
                      //         fontWeight: FontWeight.bold,
                      //       ),
                      //     ),
                      //     const SizedBox(width: 5),
                      //     const Image(
                      //       image: AssetImage('Assets/Tickets/greenTicket.png'),
                      //       height: 40,
                      //       width: 40,
                      //       fit: BoxFit.cover,
                      //     ),
                      //   ],
                      // ),
                      // const SizedBox(width: 30),
                      const Text(
                        'Rawad Zogheib',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      InkWell(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        onTap: () => Scaffold.of(context).openEndDrawer(),
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
    );
  }
}
