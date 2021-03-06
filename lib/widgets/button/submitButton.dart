import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gajoo/globals/globals.dart'  as globals;
import 'package:gajoo/widgets/PopUp/ContainerApplication.dart';

class submitButton extends StatelessWidget {

  var submitBtnText;
  submitButton({required this.submitBtnText});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
                color: globals.blue_2,
                borderRadius: const BorderRadius.all(const Radius.circular(14)),
                border: Border.all(color: globals.blue_1, width: 4)),
            child: Center(
              child: Text(
                submitBtnText,
                style: TextStyle(fontSize: 19 , color: globals.blue_1),
              ),
            ),
          ),
        ],
      ),
      onTap: () {
        //_launchApp();
        showDialog(
            context: context,
            builder: (BuildContext context) => const ContainerApplication());
      },
    );
  }
}

