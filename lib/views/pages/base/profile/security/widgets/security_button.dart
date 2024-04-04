import 'package:flutter/material.dart';

import '../../../../../../data/tools/constants/style/colors.dart';
import '../../../../../../data/tools/constants/style/fonts.dart';

class SecurityButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final double width;
  final double horizontalPadding;

  const SecurityButton(
    this.text,
    this.width, {
    this.horizontalPadding = 0,
    this.onPressed,
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
