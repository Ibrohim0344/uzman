import 'package:flutter/material.dart';

import '../../../../../../data/tools/constants/l10n/app_localizations.dart';
import '../../../../../../data/tools/constants/style/colors.dart';
import '../../../../../../data/tools/constants/style/fonts.dart';

class InviteListTile extends StatefulWidget {
  final String picture;
  final String name;
  final String phone;

  const InviteListTile({
    required this.picture,
    required this.name,
    required this.phone,
    super.key,
  });

  @override
  State<InviteListTile> createState() => _InviteListTileState();
}

class _InviteListTileState extends State<InviteListTile> {
  String invited = "";
  bool isInvited = false;

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);
    invited = lang.invite;
    return ListTile(
      leading: CircleAvatar(
        radius: 25,
        backgroundImage: AssetImage(widget.picture),
      ),
      title: Text(widget.name),
      subtitle: Text(widget.phone),
      trailing: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: isInvited ? KTColors.white : KTColors.mainRed,
          foregroundColor: isInvited ? KTColors.mainRed : KTColors.white,
          side: const BorderSide(
            color: KTColors.mainRed,
            width: 2,
          ),
        ),
        onPressed: () {
          isInvited = !isInvited;
          invited = isInvited ? lang.invited : lang.invite;
          setState(() {});
        },
        child: Text(
          invited,
          style: ktRegularStyle.copyWith(fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
