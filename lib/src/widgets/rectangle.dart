import 'package:flutter/material.dart';

class RectangleBox extends StatelessWidget {
  final double size;
  final Color color;

  const RectangleBox({Key? key, required this.size, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(color: color),
    );
  }
}
