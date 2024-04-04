import 'package:flutter/material.dart';

import '../../../../../data/tools/constants/style/fonts.dart';

class MyListTile extends StatelessWidget {
  const MyListTile({
    required this.title,
    this.textColor = Colors.black,
    this.leading,
    this.trailing,
    this.onTap,
    this.subtitle,
    this.titleSize,
    super.key,
  });

  final String title;
  final Widget? leading;
  final Widget? trailing;
  final String? subtitle;
  final double? titleSize;
  final Color textColor;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ListTile(
        title: Text(
          title,
          style: ktTitleMediumStyle.copyWith(
            fontSize: 17,
            color: textColor,
          ),
        ),
        subtitle: subtitle != null ? Text(subtitle!) : null,
        leading: leading,
        trailing: trailing,
        minVerticalPadding: 0,
        contentPadding: EdgeInsets.zero,
      ),
    );
  }
}
