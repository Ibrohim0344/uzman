import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../data/tools/constants/assets/icons.dart';
import '../../../../../../data/tools/constants/l10n/app_localizations.dart';
import '../../../../../../data/tools/constants/style/fonts.dart';
import '../../../../widgets/main_button.dart';
import '../widgets/work_status.dart';

class Upcoming extends StatelessWidget {
  final List upcomingBookings;

  const Upcoming({
    required this.upcomingBookings,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final lang = AppLocalizations.of(context);

    return upcomingBookings.isEmpty
        ? Column(
            children: [
              const Spacer(),
              SvgPicture.asset(KTIcons.searchFail),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Text(
                  lang.noFutureBooking,
                  textAlign: TextAlign.center,
                  style: ktTitleStyle,
                ),
              ),
              Text(
                lang.createBooking,
                textAlign: TextAlign.center,
                style: ktMediumStyle.copyWith(fontWeight: FontWeight.w500),
              ),
              const Spacer(),
              MainButton(
                lang.newBooking,
                size.width,
                onPressed: () {},
              ),
              const Spacer(),
            ],
          )
        : ListView(
            physics: const BouncingScrollPhysics(),
            children: const [
              WorkStatusCard(status: WorkStatus.upcoming),
              WorkStatusCard(status: WorkStatus.upcoming),
              WorkStatusCard(status: WorkStatus.upcoming),
            ],
          );
  }
}
