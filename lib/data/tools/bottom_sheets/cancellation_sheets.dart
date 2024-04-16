import 'package:flutter/material.dart';

import '../../../views/pages/base/orders/refund/payment_methods_page.dart';
import '../../../views/pages/base/profile/security/widgets/security_button.dart';
import '../../../views/widgets/main_button.dart';
import '../../../views/widgets/open_page.dart';
import '../constants/l10n/app_localizations.dart';
import '../constants/style/fonts.dart';
import '../constants/style/colors.dart';

abstract class CancellationSheets {
  static Future cancelBookingSheet(BuildContext context, Size size) {
    final lang = AppLocalizations.of(context);

    return showModalBottomSheet(
      context: context,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      elevation: 4,
      useSafeArea: true,
      enableDrag: true,
      builder: (context) {
        return ColoredBox(
          color: KTColors.white,
          child: SizedBox(
            height: 380,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Divider(
                    endIndent: size.width * 0.44,
                    indent: size.width * 0.44,
                    thickness: 3,
                    color: KTColors.border,
                  ),
                  Text(
                    lang.cancelOrder,
                    style: ktTitleStyle.copyWith(
                      color: KTColors.red,
                    ),
                  ),
                  Divider(
                    endIndent: size.width * 0.04,
                    indent: size.width * 0.04,
                    thickness: 1,
                    color: KTColors.border,
                  ),
                  Text(
                    lang.sureCancelOrder,
                    textAlign: TextAlign.center,
                    style: ktBodyMediumStyle,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: size.width / 20),
                    child: Text(
                      lang.refund80,
                      textAlign: TextAlign.center,
                      style: ktRegularStyle.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Divider(
                    endIndent: size.width * 0.04,
                    indent: size.width * 0.04,
                    thickness: 1,
                    color: KTColors.border,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SecondaryButton(
                        lang.cancel,
                        size.width / 3,
                        onPressed: () => Navigator.pop(context),
                      ),
                      MainButton(
                        lang.yesCancelOrder,
                        size.width / 2 + 20,
                        horizontalPadding: 8,
                        hasElevation: true,
                        fontSize: 15,
                        onPressed: () => getTo(
                          context,
                          const PaymentMethodsPage(),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
