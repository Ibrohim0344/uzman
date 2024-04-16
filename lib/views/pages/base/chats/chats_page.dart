import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../data/tools/constants/assets/icons.dart';
import '../../../../data/tools/constants/l10n/app_localizations.dart';
import '../../../../data/tools/constants/style/colors.dart';
import '../../../../data/tools/constants/style/fonts.dart';
import 'widgets/calls.dart';
import 'widgets/chats.dart';

class ChatsPage extends StatelessWidget {
  const ChatsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: KTColors.white,
        appBar: AppBar(
          backgroundColor: KTColors.white,
          surfaceTintColor: KTColors.white,
          title: Text(
            lang.chats,
            style: ktBodyLargeStyle,
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: SvgPicture.asset(KTIcons.searchBlack),
            ),
          ],
          bottom: TabBar(
            indicatorSize: TabBarIndicatorSize.tab,
            labelStyle: ktTitleMediumStyle.copyWith(
              fontWeight: FontWeight.w600,
            ),
            labelColor: KTColors.mainRed,
            unselectedLabelColor: KTColors.greyHint,
            indicatorColor: KTColors.mainRed,
            indicatorWeight: 4,
            splashFactory: NoSplash.splashFactory,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            tabs: [
              Tab(text: lang.chats),
              Tab(text: lang.calls),
            ],
          ),
        ),
        body: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: TabBarView(
            children: [
              Chats(),
              Calls(),
            ],
          ),
        ),
      ),
    );
  }
}
