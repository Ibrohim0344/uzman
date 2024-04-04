import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../data/tools/constants/assets/icons.dart';
import '../../../../data/tools/constants/language/getx_translation.dart';
import '../../../../data/tools/constants/style/colors.dart';
import '../../../../data/tools/constants/style/fonts.dart';
import 'widgets/canceled.dart';
import 'widgets/completed.dart';
import 'widgets/upcoming.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalization();

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
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: SvgPicture.asset(KTIcons.searchBlack),
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
              Upcoming(upcomingBookings: []),
              Completed(),
              Canceled(),
            ],
          ),
        ),
      ),
    );
  }
}
