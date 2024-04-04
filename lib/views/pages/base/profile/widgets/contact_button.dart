import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../data/tools/constants/style/colors.dart';

class ContactButton extends StatelessWidget {
  final String iconPath;
  final String title;
  final VoidCallback onTap;
  final Widget? trailing;

  const ContactButton({
    required this.iconPath,
    required this.title,
    required this.onTap,
    this.trailing,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 16,
      ),
      child: DecoratedBox(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: KTColors.shadow,
              offset: Offset(0, 1),
              blurRadius: 16,
              spreadRadius: -8,
            ),
          ],
          color: KTColors.white,
        ),
        child: GestureDetector(
          onTap: onTap,
          child: ListTile(
            contentPadding: const EdgeInsets.all(8),
            leading: SvgPicture.asset(iconPath),
            title: Text(title),
            trailing: trailing,
          ),
        ),
      ),
    );
  }
}
