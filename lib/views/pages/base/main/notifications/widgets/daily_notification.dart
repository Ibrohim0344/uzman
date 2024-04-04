import 'package:flutter/material.dart';

import '../../../../../../data/tools/constants/style/fonts.dart';
import 'notification_card.dart';

class DailyNotification extends StatelessWidget {
  final String date;
  final List<NotificationCard> notifications;

  const DailyNotification(
    this.date, {
    required this.notifications,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(
              date,
              style: ktBodyMediumStyle,
            ),
          ),
        ),
        ...notifications,
      ],
    );
  }
}
