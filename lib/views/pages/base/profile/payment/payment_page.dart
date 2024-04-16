import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../data/tools/constants/assets/icons.dart';
import '../../../../../data/tools/constants/l10n/app_localizations.dart';
import '../../../../../data/tools/constants/style/colors.dart';
import '../../../../../data/tools/constants/style/fonts.dart';
import '../../../../widgets/main_button.dart';
import '../../../../widgets/open_page.dart';
import '../widgets/contact_button.dart';
import 'add_new_card/add_new_card.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final lang = AppLocalizations.of(context);

    return Scaffold(
      backgroundColor: KTColors.white,
      appBar: AppBar(
        backgroundColor: KTColors.white,
        surfaceTintColor: KTColors.white,
        title: Text(lang.payment),
      ),
      body: Column(
        children: [
          ContactButton(
            iconPath: KTIcons.payPal,
            title: "PayPal",
            onTap: () {},
            trailing: Text(
              lang.connected,
              style: ktButtonTextStyle.copyWith(color: KTColors.mainRed),
            ),
          ),
          ContactButton(
            iconPath: KTIcons.google,
            title: "Google Pay",
            onTap: () {},
            trailing: Text(
              lang.connected,
              style: ktButtonTextStyle.copyWith(color: KTColors.mainRed),
            ),
          ),
          ContactButton(
            iconPath: KTIcons.apple,
            title: "Apple Pay",
            onTap: () {},
            trailing: Text(
              lang.connected,
              style: ktButtonTextStyle.copyWith(color: KTColors.mainRed),
            ),
          ),
          ContactButton(
            iconPath: KTIcons.mastercard,
            title: "•••• •••• •••• 4679",
            onTap: () {},
            trailing: Text(
              lang.connected,
              style: ktButtonTextStyle.copyWith(color: KTColors.mainRed),
            ),
          ),
          const Spacer(),
          MainButton(
            lang.addNewCard,
            size.width / 2 + 10,
            onPressed: () => getTo(context, const AddNewCard()),
            hasElevation: true,
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
