import 'package:flutter/material.dart';

import '../../../views/widgets/my_button.dart';
import '../../storage/local_storage.dart';
import '../constants/style/fonts.dart';
import '../constants/style/colors.dart';
import '../../../views/pages/auth/auth_page.dart';
import '../constants/language/getx_translation.dart';

abstract class OrderServiceSheets {
  static Future logoutSheet(BuildContext context, Size size) {
    final lang = AppLocalization();

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
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      MyButton(
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
                        color: KTColors.secondaryLightBlue,
                        text: lang.yesLogout,
                        textColor: KTColors.mainRed,
                        size: const Size(160, 50),
                      ),
                      MyButton(
                        onPressed: () => Navigator.pop(context),
                        color: KTColors.mainRed,
                        text: lang.cancel,
                        size: const Size(160, 50),
                        elevation: 5,
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
