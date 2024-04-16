import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../data/tools/constants/assets/icons.dart';
import '../../../../../data/tools/constants/l10n/app_localizations.dart';
import '../../../../../data/tools/constants/style/colors.dart';
import '../../../../../data/tools/constants/style/fonts.dart';
import '../../../../widgets/main_button.dart';
import 'widgets/contact_option.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final lang = AppLocalizations.of(context);

    return Scaffold(
      backgroundColor: KTColors.white,
      appBar: AppBar(
        backgroundColor: KTColors.white,
        surfaceTintColor: KTColors.white,
        title: Text(lang.forgotPassword),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: SvgPicture.asset(KTIcons.forgotPassword),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                lang.chooseResetPasswordOption,
                style: ktMediumStyle,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: ContactOption(
                icon: KTIcons.smsRed,
                title: lang.enterPhone,
                description: "+998 _________",
              ),
            ),
            ContactOption(
              icon: KTIcons.emailRed,
              title: lang.enterGmail,
              description: "Gmail.com",
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: MainButton(
                lang.continueWord,
                size.width,
                onPressed: () {},
                hasElevation: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
