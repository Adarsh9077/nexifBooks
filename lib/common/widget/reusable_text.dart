import 'package:flutter/material.dart';

class ReusableText extends StatelessWidget {
  final String text;
  final TextStyle style;

  const ReusableText({super.key, required this.text, required this.style});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style,
      maxLines: 1,
      textAlign: TextAlign.left,
      overflow: TextOverflow.fade,
      softWrap: false,

    );
  }
}
