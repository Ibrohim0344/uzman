import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../data/tools/constants/assets/icons.dart';
import '../../../../../data/tools/constants/l10n/app_localizations.dart';
import '../../../../../data/tools/constants/style/fonts.dart';
import '../../../../widgets/example_strings.dart';
import '../../../../widgets/open_page.dart';
import '../call/call_page.dart';

class Calls extends StatelessWidget {
  const Calls({super.key});

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);
    final getCallStatuses = callStatuses(lang);

    return ListView(
      physics: const BouncingScrollPhysics(),
      children: List.generate(
        pictures.length,
        (index) => CallUser(
          picture: pictures[index],
          title: titles[index],
          callStatusIcon: callStatusIcons[index],
          callStatus: getCallStatuses[index],
          dateTime: dateTime[index],
        ),
      ),
    );
  }
}

class CallUser extends StatelessWidget {
  final String picture;
  final String title;
  final String callStatusIcon;
  final String callStatus;
  final String dateTime;
  final VoidCallback? onTap;

  const CallUser({
    required this.picture,
    required this.title,
    required this.callStatusIcon,
    required this.callStatus,
    required this.dateTime,
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
        subtitle: Row(
          children: [
            SvgPicture.asset(callStatusIcon),
            Expanded(
              child: Text(
                " $callStatus | $dateTime",
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        trailing: GestureDetector(
          onTap: () => getTo(context, const CallPage()),
          child: SvgPicture.asset(KTIcons.phoneRed),
        ),
      ),
    );
  }
}
