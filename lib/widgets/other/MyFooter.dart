import 'package:flutter/material.dart';
import 'package:gajoo/hexColor/hexColor.dart';
import 'package:gajoo/globals/globals.dart' as globals;

class MyFooter extends StatelessWidget {
  const MyFooter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topRight: Radius.circular(32.0),
        topLeft: Radius.circular(32.0),
      ),
      child: Container(
        height: 264,
        padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 4.0),
        color: HexColor('#222222'),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ////////////////////////////////////////////
                //Column1
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        'Financial',
                        style: TextStyle(
                            fontSize: 17,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    InkWell(
                      onTap: () => null,
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Payment',
                          style: TextStyle(fontSize: 16, color: Colors.white70),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 28,
                    ),
                    Image.asset(
                      'Assets/HomePage/logo.png',
                      height: 95,
                      width: 300,
                      fit: BoxFit.contain,
                    ),
                  ],
                ),
                ////////////////////////////////////////////
                //Column2
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        'Social',
                        style: TextStyle(
                            fontSize: 17,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    InkWell(
                      onTap: () => null,
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Teachers',
                          style: TextStyle(fontSize: 16, color: Colors.white70),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () => null,
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Community',
                          style: TextStyle(fontSize: 16, color: Colors.white70),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () => null,
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Instagram',
                          style: TextStyle(fontSize: 16, color: Colors.white70),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () => null,
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Facebook',
                          style: TextStyle(fontSize: 16, color: Colors.white70),
                        ),
                      ),
                    ),
                  ],
                ),
                ////////////////////////////////////////////
                //Column3
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        'About Us',
                        style: TextStyle(
                            fontSize: 17,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    InkWell(
                      onTap: () => null,
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Who We Are?',
                          style: TextStyle(fontSize: 16, color: Colors.white70),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () => null,
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Our Mission',
                          style: TextStyle(fontSize: 16, color: Colors.white70),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.all(10.0),
              margin: const EdgeInsets.only(right: 110.0),
              alignment: Alignment.bottomRight,
              child: const Text(
                '® 2022 Gajoo, All Rights Reserved',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white70,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
