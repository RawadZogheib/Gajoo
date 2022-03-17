import 'package:flutter/material.dart';
import 'package:gajoo/hexColor/hexColor.dart';

class ImagePagination extends StatefulWidget {
  int currentActive;
  var onTapRed;
  var onTapYellow;
  var onTapBlue;
  var onTapGreen;

  ImagePagination(
      {required this.currentActive,
      required this.onTapRed,
      required this.onTapYellow,
      required this.onTapBlue,
      required this.onTapGreen});

  @override
  _ImagePaginationState createState() => _ImagePaginationState();
}

class _ImagePaginationState extends State<ImagePagination> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () => widget.onTapRed(),
          child: Container(
            height: 10,
            width: MediaQuery.of(context).size.width * 0.18,
            margin: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: widget.currentActive == 0
                  ? Colors.red
                  : HexColor('#585a5c'),
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(32.0),
                topLeft: Radius.circular(32.0),
                bottomRight: Radius.circular(32.0),
                bottomLeft: Radius.circular(32.0),
              ),
            ),
          ),
        ),
        InkWell(
          onTap: () => widget.onTapYellow(),
          child: Container(
            height: 10,
            width: MediaQuery.of(context).size.width * 0.18,
            margin: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: widget.currentActive == 1
                  ? Colors.yellow
                  : HexColor('#585a5c'),
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(32.0),
                topLeft: Radius.circular(32.0),
                bottomRight: Radius.circular(32.0),
                bottomLeft: Radius.circular(32.0),
              ),
            ),
          ),
        ),
        InkWell(
          onTap: () => widget.onTapBlue(),
          child: Container(
            height: 10,
            width: MediaQuery.of(context).size.width * 0.18,
            margin: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: widget.currentActive == 2
                  ? Colors.blue
                  : HexColor('#585a5c'),
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(32.0),
                topLeft: Radius.circular(32.0),
                bottomRight: Radius.circular(32.0),
                bottomLeft: Radius.circular(32.0),
              ),
            ),
          ),
        ),
        InkWell(
          onTap: () => widget.onTapGreen(),
          child: Container(
            height: 10,
            width: MediaQuery.of(context).size.width * 0.18,
            margin: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: widget.currentActive == 3
                  ? Colors.green
                  : HexColor('#585a5c'),
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(32.0),
                topLeft: Radius.circular(32.0),
                bottomRight: Radius.circular(32.0),
                bottomLeft: Radius.circular(32.0),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
