import 'package:flutter/material.dart';

import '../../../../data/tools/constants/style/colors.dart';
import '../../../../data/tools/constants/style/fonts.dart';

class TextBetweenDivider extends StatelessWidget {
  final String text;

  const TextBetweenDivider(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          const Expanded(
            child: Divider(color: KTColors.border),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 16,
            ),
            child: Text(
              text,
              style: ktMediumStyle,
            ),
          ),
          const Expanded(
            child: Divider(color: KTColors.border),
          ),
        ],
      ),
    );
  }
}
