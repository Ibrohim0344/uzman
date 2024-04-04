import 'package:flutter/material.dart';

import '../../../../../data/tools/constants/style/fonts.dart';

class TitleAndTextButton extends StatelessWidget {
  final String title;
  final String textButton;
  final VoidCallback onPressed;
  final bool hasPadding;

  const TitleAndTextButton({
    required this.title,
    required this.textButton,
    required this.onPressed,
    this.hasPadding = true,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: hasPadding
          ? const EdgeInsets.only(left: 16, right: 4)
          : EdgeInsets.zero,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: ktTitleStyle,
          ),
          TextButton(
            onPressed: onPressed,
            child: Text(
              textButton,
              style: ktEssentialStyle.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
