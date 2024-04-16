import 'package:flutter/material.dart';

import '../../../../../../data/tools/constants/style/colors.dart';
import '../../../../../../data/tools/constants/style/fonts.dart';

class SecondaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double width;
  final double horizontalPadding;

  const SecondaryButton(
    this.text,
    this.width, {
    required this.onPressed,
    this.horizontalPadding = 0,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      style: FilledButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
        backgroundColor: KTColors.lightPurple,
        fixedSize: Size(width, 52),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(24)),
        ),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      onPressed: onPressed,
      child: Text(
        text,
        overflow: TextOverflow.ellipsis,
        style: ktButtonTextStyle.copyWith(color: KTColors.mainRed),
      ),
    );
  }
}
