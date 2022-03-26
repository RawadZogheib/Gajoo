import 'package:flutter/material.dart';
import 'package:gajoo/globals/globals.dart' as globals;
import 'package:gajoo/hexColor/hexColor.dart';
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

  _back() {
    Navigator.pushNamedAndRemoveUntil(context, '/HomePage', (route) => false);
  }
}
