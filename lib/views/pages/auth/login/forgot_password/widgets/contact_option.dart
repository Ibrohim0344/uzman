import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../data/tools/constants/style/colors.dart';
import '../../../../../../data/tools/constants/style/fonts.dart';

class ContactOption extends StatelessWidget {
  final String icon;
  final String title;
  final String description;
  final VoidCallback? onPressed;

  const ContactOption({
    required this.icon,
    required this.title,
    required this.description,
    this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: SizedBox(
        width: double.infinity,
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            border: Border.all(
              color: KTColors.border,
              width: 2,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: CircleAvatar(
                    radius: 40,
                    backgroundColor: KTColors.purple.withOpacity(.08),
                    child: SvgPicture.asset(icon),
                  ),
                ),
                Column(
                  children: [
                    Text(title),
                    Text(
                      description,
                      style: ktMediumStyle.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
