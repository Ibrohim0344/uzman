import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../widgets/example_strings.dart';
import '../../../../../data/tools/constants/style/fonts.dart';
import '../../../../../data/tools/constants/style/colors.dart';
import '../../../../widgets/open_page.dart';
import '../chat/chat_detail.dart';

class Chats extends StatelessWidget {
  const Chats({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: List.generate(
        pictures.length,
        (index) => User(
          picture: pictures[index],
          title: titles[index],
          subtitle: subtitles[index],
          notificationCount: notifications[index],
          dateTime: dateTime[index],
          onTap: () => getTo(context, Chat(title: titles[index])),
        ),
      ),
    );
  }
}

class User extends StatelessWidget {
  final String picture;
  final String title;
  final String subtitle;
  final int notificationCount;
  final String dateTime;
  final VoidCallback? onTap;

  const User({
    required this.picture,
    required this.title,
    required this.subtitle,
    required this.dateTime,
    required this.notificationCount,
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 4),
        leading: CircleAvatar(
          radius: 25,
          backgroundImage: AssetImage(picture),
        ),
        title: Text(
          title,
          overflow: TextOverflow.ellipsis,
          style: ktBodyMediumStyle,
        ),
        subtitle: Text(
          subtitle,
          overflow: TextOverflow.ellipsis,
        ),
        trailing: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            notificationCount != 0
                ? CircleAvatar(
                    radius: 14,
                    backgroundColor: KTColors.mainRed,
                    foregroundColor: KTColors.white,
                    child: Text(
                      "$notificationCount",
                      style: ktLightStyle.copyWith(fontSize: 13),
                    ),
                  )
                : const SizedBox.shrink(),
            Text(
              dateTime,
              style: ktRegularStyle.copyWith(fontSize: 13),
            ),
          ],
        ),
      ),
    );
  }
}
