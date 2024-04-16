import 'package:flutter/material.dart';

import '../../../../../data/tools/constants/l10n/app_localizations.dart';
import '../../../../../data/tools/constants/style/colors.dart';
import '../../../../widgets/example_strings.dart';
import 'widgets/invite_list_tile.dart';

class InviteFriends extends StatelessWidget {
  const InviteFriends({super.key});

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);

    return Scaffold(
      backgroundColor: KTColors.white,
      appBar: AppBar(
        backgroundColor: KTColors.white,
        surfaceTintColor: KTColors.white,
        leading: const BackButton(),
        title: Text(lang.inviteFriends),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: List.generate(
          pictures.length,
          (index) => InviteListTile(
            picture: pictures[index],
            name: titles[index],
            phone: phoneNumbers[index],
          ),
        ),
      ),
    );
  }
}
