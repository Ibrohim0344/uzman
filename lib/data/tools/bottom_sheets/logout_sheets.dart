import 'package:flutter/material.dart';

import '../../../views/pages/auth/auth_page.dart';
import '../../../views/pages/base/profile/security/widgets/security_button.dart';
import '../../../views/widgets/main_button.dart';
import '../../storage/local_storage.dart';
import '../constants/l10n/app_localizations.dart';
import '../constants/style/fonts.dart';
import '../constants/style/colors.dart';

abstract class LogoutSheets {
  static Future logoutSheet(BuildContext context, Size size) {
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
            height: size.height * 0.33,
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
                    lang.logout,
                    style: ktTitleStyle.copyWith(
                      color: KTColors.red,
                    ),
                  ),
                  Divider(
                    endIndent: size.width * 0.043,
                    indent: size.width * 0.043,
                    thickness: 1,
                    color: KTColors.border,
                  ),
                  Text(
                    lang.sureLogout,
                    textAlign: TextAlign.center,
                    style: ktBodyMediumStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SecondaryButton(
                        lang.yesLogout,
                        size.width / 2 - 24,
                        onPressed: () {
                          Navigator.pop(context);
                          LocalStorage.deleteUser();
                          Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                              builder: (context) => const AuthPage(),
                            ),
                            (route) => false,
                          );
                        },
                      ),
                      MainButton(
                        lang.cancel,
                        size.width / 2 - 24,
                        hasElevation: true,
                        fontSize: 15,
                        onPressed: () => Navigator.pop(context),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
