import 'package:flutter/material.dart';
import 'package:gajoo/globals/globals.dart' as globals;
import 'package:gajoo/widgets/button/myButton.dart';

class AlertBeforeBuy extends StatefulWidget {
  String price;
  Function onTap;

  AlertBeforeBuy({Key? key, required this.price, required this.onTap})
      : super(key: key);

  @override
  _AlertBeforeBuyState createState() => _AlertBeforeBuyState();
}

class _AlertBeforeBuyState extends State<AlertBeforeBuy> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(32.0),
          topRight: Radius.circular(32.0),
          bottomLeft: Radius.circular(32.0),
          bottomRight: Radius.circular(32.0),
        ),
      ),
      backgroundColor: Colors.amber,
      contentPadding:
          const EdgeInsets.only(left: 0.0, right: 0.0, bottom: 0.0, top: 30),
      title: const Center(
        child: Text('Alert !',
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20)),
      ),
      content: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(32.0),
          topRight: Radius.circular(32.0),
          bottomLeft: Radius.circular(32.0),
          bottomRight: Radius.circular(32.0),
        ),
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(32.0),
              topRight: Radius.circular(32.0),
              bottomLeft: Radius.circular(32.0),
              bottomRight: Radius.circular(32.0),
            ),
          ),
          height: 300,
          width: 400,
          child: Column(
            children: [
              Text(
                'Are you sur you want to buy a cours with ${widget.price} ${globals.type} ticket${int.parse(widget.price) > 1 ? 's' : ''}?',
                textAlign: TextAlign.center,
              ),
              myBtn(btnText: 'No',onPress: () => _onNo()),
              myBtn(btnText: 'Yes',onPress: () => _onYes()),
            ],
          ),
        ),
      ),
    );
  }

  _onYes() {
    Navigator.pop(context);
    widget.onTap();
  }

  _onNo() {
    Navigator.pop(context);
  }
}
