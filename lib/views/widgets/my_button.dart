import 'package:flutter/material.dart';

import '../../../../../data/tools/constants/style/fonts.dart';

class MyButton extends StatelessWidget {
  const MyButton({
    this.text,
    this.size,
    this.color = Colors.cyanAccent,
    this.textColor = Colors.white,
    this.elevation,
    this.side,
    this.fontSize,
    required this.onPressed,
    super.key,
  });

  final String? text;
  final Size? size;
  final Color color;
  final Color textColor;
  final double? elevation;
  final BorderSide? side;
  final double? fontSize;

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: onPressed,
      style: ButtonStyle(
        minimumSize: MaterialStateProperty.all(size),
        backgroundColor: MaterialStateProperty.all(color),
        elevation: MaterialStateProperty.all(elevation),
        shadowColor: MaterialStateProperty.all(Colors.blue),
        side: MaterialStateProperty.all(side),
      ),
      child: text != null
          ? Text(
        text!,
        style: ktSemiBoldStyle.copyWith(
          color: textColor,
          fontSize: fontSize,
        ),
      )
          : null,
    );
  }
}
