import 'package:flutter/material.dart';

class CustomImage extends StatelessWidget {
  final String imageName;

  CustomImage({
    required this.imageName,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Image.asset(
        '$imageName',
        fit: BoxFit.cover,
      ),
    );
  }
}
