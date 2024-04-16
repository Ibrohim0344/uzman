import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../data/tools/constants/l10n/app_localizations.dart';
import 'login/login_page.dart';
import 'register/register.dart';
import 'widgets/ask_account.dart';
import '../../widgets/main_button.dart';
import 'widgets/my_outlined_button.dart';
import 'widgets/text_between_divider.dart';
import '../../../data/tools/constants/style/fonts.dart';
import '../../../data/tools/constants/assets/icons.dart';
import '../../../data/tools/constants/style/colors.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  void getToLogin() => Navigator.of(context).push(CupertinoPageRoute(
        builder: (context) => const LoginPage(),
      ));

  void getToRegister() => Navigator.of(context).push(CupertinoPageRoute(
        builder: (context) => const RegisterPage(),
      ));

  @override
  void initState() {
    // LocalStorage.saveUser(UserLocalInfo());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final lang = AppLocalizations.of(context);

    return Scaffold(
      backgroundColor: KTColors.white,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 24,
          ),
          child: Column(
            children: [
              const Spacer(flex: 5),
              SvgPicture.asset(KTIcons.login),
              const Spacer(flex: 2),
              Text(
                lang.enter,
                style: ktBodyImmenseStyle,
              ),
              const Spacer(flex: 2),
              MyOutlinedButton(
                width: size.width,
                child: myRow(KTIcons.facebook, lang.continueWithFacebook),
              ),
              const SizedBox(height: 24),
              MyOutlinedButton(
                width: size.width,
                child: myRow(KTIcons.google, lang.continueWithGoogle),
              ),
              const SizedBox(height: 16),
              TextBetweenDivider(lang.or),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: MainButton(
                  lang.enterWithPassword,
                  size.width,
                  onPressed: getToLogin,
                ),
              ),
              const Spacer(),
              AskAccount(
                question: lang.noAccount,
                navigate: lang.register,
                getTo: getToRegister,
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  Widget myRow(String icon, String text) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(icon),
          const SizedBox(width: 10),
          Text(
            text,
            style: ktMediumStyle.copyWith(color: KTColors.black),
          ),
        ],
      );
}
