import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';

import '../../../../../data/tools/constants/assets/icons.dart';
import '../../../../../data/tools/constants/l10n/app_localizations.dart';
import '../../../../../data/tools/constants/style/colors.dart';
import '../widgets/my_list_tile.dart';
import '../widgets/my_switch.dart';

class NotificationSettingsPage extends StatefulWidget {
  const NotificationSettingsPage({super.key});

  @override
  State<NotificationSettingsPage> createState() =>
      _NotificationSettingsPageState();
}

class _NotificationSettingsPageState extends State<NotificationSettingsPage> {
  List<bool> turnOn = List.filled(10, true);
  List<String> titles = [];

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);
    titles = [
      lang.commonNotification,
      lang.sound,
      lang.vibration,
      lang.specialOffers,
      lang.promoAndDiscount,
      lang.payments,
      lang.cashback,
      lang.appUpdates,
      lang.newServiceAvailable,
      lang.thereAreNewTips,
    ];

    return Scaffold(
      backgroundColor: KTColors.white,
      appBar: AppBar(
        titleSpacing: 0,
        title: Text(lang.notification),
        backgroundColor: KTColors.white,
        surfaceTintColor: KTColors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: List.generate(
            titles.length,
            (index) => MyListTile(
              title: titles[index],
              leading: SvgPicture.asset(KTIcons.notification),
              trailing: MySwitch(
                value: turnOn[index],
                onChanged: (bool value) {
                  setState(() => turnOn[index] = value);
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
