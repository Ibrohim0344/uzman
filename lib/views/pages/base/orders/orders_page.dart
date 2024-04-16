import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../data/tools/constants/assets/icons.dart';
import '../../../../data/tools/constants/l10n/app_localizations.dart';
import '../../../../data/tools/constants/style/colors.dart';
import '../../../../data/tools/constants/style/fonts.dart';
import '../../../widgets/open_page.dart';
import '../main/search/search_page.dart';
import 'tabviews/canceled.dart';
import 'tabviews/completed.dart';
import 'tabviews/upcoming.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: KTColors.white,
        appBar: AppBar(
          backgroundColor: KTColors.white,
          surfaceTintColor: KTColors.white,
          title: Text(
            lang.orders,
            style: ktBodyLargeStyle,
          ),
          actions: [
            GestureDetector(
              onTap: () => getTo(context, const SearchPage()),
              child: Padding(
                padding: const EdgeInsets.only(right: 16),
                child: SvgPicture.asset(KTIcons.searchBlack),
              ),
            ),
          ],
          bottom: TabBar(
            indicatorSize: TabBarIndicatorSize.tab,
            labelStyle: ktSemiBoldStyle.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
            labelColor: KTColors.mainRed,
            unselectedLabelColor: KTColors.greyHint,
            indicatorColor: KTColors.mainRed,
            indicatorWeight: 4,
            labelPadding: EdgeInsets.zero,
            splashFactory: NoSplash.splashFactory,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            tabs: [
              Tab(text: lang.upcoming),
              Tab(text: lang.completed),
              Tab(text: lang.canceled),
            ],
          ),
        ),
        body: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: TabBarView(
            children: [
              Upcoming(upcomingBookings: [0]),
              Completed(),
              Canceled(),
            ],
          ),
        ),
      ),
    );
  }
}
