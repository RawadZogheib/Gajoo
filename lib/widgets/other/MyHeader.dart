import 'package:flutter/material.dart';
import 'package:gajoo/globals/globals.dart' as globals;
import 'package:gajoo/hexColor/hexColor.dart';

class MyHeader extends StatelessWidget {
  const MyHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
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
          globals.isLogedIn == false
              ? Container(
                  height: 60,
                  width: 120,
                  margin: const EdgeInsets.only(right: 16.0),
                  child: ElevatedButton(
                    onPressed: () => Navigator.of(context).pushNamed('/Login'),
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
