import 'package:flutter/material.dart';
import 'package:gajoo/widgets/other/animatedLogo.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Wrap(
        children: [
          Image.asset(
            'Assets/HomePage/logo.png',
            height: 95,
            width: 300,
            fit: BoxFit.contain,
          ),
          AnimatedLogo(),
        ],
      ),
    );
  }
}
