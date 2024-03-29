import 'package:flutter/material.dart';
import 'package:gajoo/hexColor/hexColor.dart';
import 'package:gajoo/globals/globals.dart' as globals;
import 'package:gajoo/widgets/other/Responsive.dart';

class MyFooter extends StatefulWidget {
  const MyFooter({Key? key}) : super(key: key);

  @override
  State<MyFooter> createState() => _MyFooterState();
}

class _MyFooterState extends State<MyFooter> {
  @override
  Widget build(BuildContext context) {
    return Responsive(
      mobile: ClipRRect(
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(32.0),
          topLeft: Radius.circular(32.0),
        ),
        child: Container(
          height: 264,
          padding: const EdgeInsets.fromLTRB(4.0, 16.0, 4.0, 4.0),
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
                              fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      InkWell(
                        onTap: () => _goToPaymentPage(),
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Payment',
                            style:
                                TextStyle(fontSize: 14, color: Colors.white70),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 28,
                      ),
                      Image.asset(
                        'Assets/HomePage/logo.png',
                        height: 60,
                        width: 132,
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
                              fontSize: 15,
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
                            style:
                                TextStyle(fontSize: 14, color: Colors.white70),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () => null,
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Community',
                            style:
                                TextStyle(fontSize: 14, color: Colors.white70),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () => null,
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Instagram',
                            style:
                                TextStyle(fontSize: 14, color: Colors.white70),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () => null,
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Facebook',
                            style:
                                TextStyle(fontSize: 14, color: Colors.white70),
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
                              fontSize: 15,
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
                            style:
                                TextStyle(fontSize: 14, color: Colors.white70),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () => null,
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Our Mission',
                            style:
                                TextStyle(fontSize: 14, color: Colors.white70),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.all(10.0),
                margin: const EdgeInsets.only(right: 10.0),
                alignment: Alignment.bottomCenter,
                child: const Text(
                  '® 2022 Gajoo, All Rights Reserved',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white70,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      tablet: ClipRRect(
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
                        onTap: () => _goToPaymentPage(),
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Payment',
                            style:
                                TextStyle(fontSize: 16, color: Colors.white70),
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
                            style:
                                TextStyle(fontSize: 16, color: Colors.white70),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () => null,
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Community',
                            style:
                                TextStyle(fontSize: 16, color: Colors.white70),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () => null,
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Instagram',
                            style:
                                TextStyle(fontSize: 16, color: Colors.white70),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () => null,
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Facebook',
                            style:
                                TextStyle(fontSize: 16, color: Colors.white70),
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
                            style:
                                TextStyle(fontSize: 16, color: Colors.white70),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () => null,
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Our Mission',
                            style:
                                TextStyle(fontSize: 16, color: Colors.white70),
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
      ),
      desktop: ClipRRect(
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
                        onTap: () => _goToPaymentPage(),
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Payment',
                            style:
                                TextStyle(fontSize: 16, color: Colors.white70),
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
                            style:
                                TextStyle(fontSize: 16, color: Colors.white70),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () => null,
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Community',
                            style:
                                TextStyle(fontSize: 16, color: Colors.white70),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () => null,
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Instagram',
                            style:
                                TextStyle(fontSize: 16, color: Colors.white70),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () => null,
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Facebook',
                            style:
                                TextStyle(fontSize: 16, color: Colors.white70),
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
                            style:
                                TextStyle(fontSize: 16, color: Colors.white70),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () => null,
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Our Mission',
                            style:
                                TextStyle(fontSize: 16, color: Colors.white70),
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
      ),
    );
  }

  _goToPaymentPage() {
    if (globals.currentPage != 'PaymentPage') {
      Navigator.of(context)
          .pushNamedAndRemoveUntil('/PaymentPage', (route) => false);
    }
  }
}
