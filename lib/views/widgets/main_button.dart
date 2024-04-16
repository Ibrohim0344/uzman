import 'package:flutter/material.dart';

import '../../data/tools/constants/style/colors.dart';
import '../../data/tools/constants/style/fonts.dart';

class MainButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double width;
  final double height;
  final double horizontalPadding;
  final bool hasElevation;
  final bool isOutlined;
  final double fontSize;

  const MainButton(
    this.text,
    this.width, {
    required this.onPressed,
    this.horizontalPadding = 0,
    this.height = 52,
    this.hasElevation = false,
    this.isOutlined = false,
    this.fontSize = 16,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      style: FilledButton.styleFrom(
        shadowColor: KTColors.purple.withOpacity(.5),
        elevation: hasElevation ? 4 : 0,
        padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
        backgroundColor: isOutlined ? KTColors.white : KTColors.mainRed,
        side: const BorderSide(
          color: KTColors.mainRed,
          width: 2,
        ),
        fixedSize: Size(width, height),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(24)),
        ),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      onPressed: onPressed,
      child: Text(
        text,
        overflow: TextOverflow.ellipsis,
        style: ktButtonTextStyle.copyWith(
          color: isOutlined ? KTColors.mainRed : KTColors.white,
          fontSize: fontSize,
        ),
      ),
    );
  }
}
