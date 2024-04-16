import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../views/pages/base/base_page.dart';
import '../../../views/widgets/main_button.dart';
import '../constants/assets/icons.dart';
import '../constants/l10n/app_localizations.dart';
import '../constants/style/colors.dart';
import '../constants/style/fonts.dart';
import '../extensions/int_extensions.dart';

abstract class AppDialogs {
  static Future refundSuccessDialog(BuildContext context, Size size) {
    final lang = AppLocalizations.of(context);

    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        backgroundColor: KTColors.white,
        surfaceTintColor: KTColors.white,
        title: SvgPicture.asset(KTIcons.successDialog),
        content: SizedBox(
          height: 180,
          child: Column(
            children: [
              Text(
                lang.bookingSuccessfullyCanceled,
                textAlign: TextAlign.center,
                style: ktEssentialStyle.copyWith(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              16.gapY(),
              Text(
                lang.willRefund80,
                textAlign: TextAlign.center,
                style: ktMediumStyle,
              ),
            ],
          ),
        ),
        actions: [
          MainButton(
            "OK",
            size.width,
            onPressed: () => Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (context) => const BasePage(pageIndex: 1),
              ),
              (route) => false,
            ),
          ),
        ],
      ),
    );
  }
}
