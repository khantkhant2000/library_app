import 'package:flutter/material.dart';

class EasyText extends StatelessWidget {
  const EasyText(
      {super.key,
      required this.text,
      this.color = Colors.black87,
      this.fontWeight = FontWeight.bold,
      this.fontSize = 14});
  final String text;
  final Color color;
  final FontWeight fontWeight;
  final double fontSize;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontWeight: fontWeight,
        fontSize: fontSize,
      ),
    );
  }
}
