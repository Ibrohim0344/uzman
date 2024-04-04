import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../data/tools/constants/style/fonts.dart';

class CategoryWidget extends StatelessWidget {
  final String category;
  final String text;
  final Color bgColor;
  final void Function()? onTap;

  const CategoryWidget({
    required this.category,
    required this.text,
    required this.bgColor,
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: CircleAvatar(
            radius: 33,
            backgroundColor: bgColor.withOpacity(.08),
            child: SvgPicture.asset(category),
          ),
        ),
        const SizedBox(height: 6),
        Text(
          text,
          overflow: TextOverflow.ellipsis,
          style: ktCategoryTextStyle,
        ),
      ],
    );
  }
}
