import 'package:flutter/material.dart';

class MyOutlinedButton extends StatelessWidget {
  final Widget child;
  final VoidCallback? onPressed;
  final double? width;
  final double horizontalPadding;
  final double verticalPadding;

  const MyOutlinedButton({
    required this.child,
    this.horizontalPadding = 0,
    this.verticalPadding = 0,
    this.width,
    this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding,
          vertical: verticalPadding,
        ),
        fixedSize: width != null ? Size(width!, 52) : null,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(14)),
        ),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      onPressed: onPressed,
      child: child,
    );
  }
}
