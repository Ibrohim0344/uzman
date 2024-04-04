import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../data/tools/constants/style/colors.dart';
import '../../../../../../data/tools/constants/style/fonts.dart';

class NotificationCard extends StatelessWidget {
  final String iconPath;
  final String title;
  final String subtitle;
  final VoidCallback? onTap;

  const NotificationCard({
    required this.iconPath,
    required this.title,
    required this.subtitle,
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
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
            horizontalTitleGap: 0,
            title: Text(
              title,
              style: ktBodyMediumStyle.copyWith(fontSize: 17),
            ),
            subtitle: Text(
              subtitle,
              style: ktRegularStyle.copyWith(
                color: KTColors.grey61,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
