import 'package:flutter/material.dart';

import '../../../../data/tools/constants/style/colors.dart';
import '../../../../data/tools/constants/style/fonts.dart';

class AskAccount extends StatelessWidget {
  final String question;
  final String navigate;
  final VoidCallback getTo;

  const AskAccount({
    required this.question,
    required this.navigate,
    required this.getTo,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "$question ",
          style: ktRegularStyle.copyWith(color: KTColors.greyHint),
        ),
        GestureDetector(
          onTap: getTo,
          child: Text(
            navigate,
            style: ktEssentialStyle,
          ),
        ),
      ],
    );
  }
}
