import 'package:flutter/material.dart';
import 'package:gajoo/globals/globals.dart' as globals;

class btn extends StatelessWidget {
  var btnText;
  var onTap;

  btn({required this.btnText});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 100,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(btnText),
        ),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(9.0),
          color: Colors.blue.shade200,
        ));
  }
}

class myButton extends StatelessWidget {
  var btnText;
  var height;
  var width;
  var onPress;

  myButton({required this.btnText, this.height, this.width, this.onPress});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: globals.blue,
        onPrimary: globals.blue_1,
        shadowColor: Colors.transparent,
        fixedSize:
            Size(width != null ? width : 50, height != null ? height : 40),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      ),
      child: Text(btnText),
      onPressed: () {
        onPress();
        //print("Submitted2");
      },
    );
  }
}

class myBtn extends StatelessWidget {
  var btnText;
  double? height;
  double? width;
  var onPress;

  myBtn({required this.btnText, this.height, this.width, this.onPress});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: this.width,
      height: this.height,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: globals.blue,
          onPrimary: globals.blue_1,
          shadowColor: Colors.transparent,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        ),
        child: Text(btnText),
        onPressed: () {
          onPress();
          //print("Submitted2");
        },
      ),
    );
  }
}

class myBtn2 extends StatelessWidget {
  var btnText;
  double? height;
  double? width;
  var onPress;
  var color1, color2;

  myBtn2(
      {this.btnText,
      this.height,
      this.width,
      this.onPress,
      this.color1,
      this.color2});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: this.width,
      height: this.height,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: color1,
          onPrimary: color2,
          shadowColor: Colors.transparent,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        ),
        child: btnText,
        onPressed: () {
          onPress();
          //print("Submitted2");
        },
      ),
    );
  }
}

class MyBtn3 extends StatelessWidget {
  String btnText;
  double? height;
  double? width;
  var onPress;
  Color color1, color2;

  MyBtn3(
      {required this.btnText,
      required this.height,
      required this.width,
      required this.onPress,
      required this.color1,
      required this.color2});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(22.0)),
      child: InkWell(
        hoverColor: Colors.transparent,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        child: Container(
          height: height,
          width: width,
          color: color1,
          alignment: Alignment.center,
          child: Text(
            btnText,
            style: TextStyle(
              fontSize: 16,
              color: color2,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        onTap: () {
          onPress();
          //print("Submitted2");
        },
      ),
    );
  }
}
