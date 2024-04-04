import 'package:flutter/material.dart';

import '../../../../../../data/tools/constants/style/colors.dart';

class MyExpansionTile extends StatelessWidget {
  final String question;
  final String answer;
  final void Function(bool) onExpansionChanged;
  final bool isCollapsed;

  const MyExpansionTile({
    required this.question,
    required this.answer,
    required this.onExpansionChanged,
    required this.isCollapsed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: size.width * .038,
        vertical: 8,
      ),
      child: DecoratedBox(
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: KTColors.shadow,
              offset: Offset(0, 1),
              blurRadius: 16,
              spreadRadius: -8,
            ),
          ],
          borderRadius: BorderRadius.all(Radius.circular(16)),
          color: KTColors.white,
        ),
        child: Theme(
          data: ThemeData(
            splashFactory: NoSplash.splashFactory,
            colorScheme: ColorScheme.fromSeed(seedColor: KTColors.mainRed),
          ),
          child: ExpansionTile(
            title: Text(question),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(16),
              ),
            ),
            onExpansionChanged: onExpansionChanged,
            tilePadding:
                const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
            childrenPadding: const EdgeInsets.only(
              left: 18,
              right: 18,
              bottom: 8,
            ),
            children: [
              const Divider(),
              Text(answer),
            ],
          ),
        ),
      ),
    );
  }
}
