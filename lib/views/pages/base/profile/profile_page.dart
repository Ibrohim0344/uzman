import 'dart:developer';
import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';

import '../../../../blocs/user/user_info_bloc.dart';
import '../../../../data/storage/local_storage.dart';
import '../../../../data/tools/constants/l10n/app_localizations.dart';
import '../../../../data/tools/extensions/int_extensions.dart';
import '../../../widgets/open_page.dart';
import 'invite_friends/invite_friends.dart';
import 'payment/payment_page.dart';
import 'privacy_policy/privacy_policy_page.dart';
import 'security/security_page.dart';
import 'support/support_page.dart';
import '../../../../data/tools/bottom_sheets/logout_sheets.dart';
import 'edit/edit_page.dart';
import 'language/language_page.dart';
import 'notification_settings/notification_settings_page.dart';
import 'widgets/my_list_tile.dart';
import '../../../../data/tools/constants/style/fonts.dart';
import '../../../../data/tools/constants/style/colors.dart';
import '../../../../data/tools/constants/assets/icons.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  File? pickedImage;

  void pickImage() async {
    final ImagePicker imagePicker = ImagePicker();
    final XFile? image = await imagePicker.pickImage(
      source: ImageSource.gallery,
      maxHeight: 512,
      maxWidth: 512,
      imageQuality: 100,
    );

    if (image != null) {
      CroppedFile? croppedFile = await ImageCropper().cropImage(
        sourcePath: image.path,
        aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
        aspectRatioPresets: [CropAspectRatioPreset.square],
        uiSettings: [
          AndroidUiSettings(
            toolbarTitle: "Cropper",
            toolbarColor: KTColors.mainRed,
            toolbarWidgetColor: KTColors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false,
          ),
          IOSUiSettings(title: "Cropper"),
        ],
      );

      if (croppedFile != null) {
        final userImage = LocalStorage.getUser().copyWith(
          imagePath: croppedFile.path,
        );
        LocalStorage.saveUser(userImage);
        setState(() {
          pickedImage = File(croppedFile.path);
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);
    final size = MediaQuery.sizeOf(context);
    final imagePath = LocalStorage.getUser().imagePath;

    return Scaffold(
      backgroundColor: KTColors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SafeArea(
          child: Center(
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                const SizedBox(height: 50),
                Center(
                  child: Stack(
                    children: [
                      CircleAvatar(
                        radius: 65,
                        backgroundColor: KTColors.secondaryLightBlue,
                        backgroundImage: imagePath != null
                            ? FileImage(File(imagePath))
                            : null,
                        child: imagePath == null
                            ? SvgPicture.asset(
                                KTIcons.userLarge,
                                fit: BoxFit.cover,
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                              )
                            : null,
                      ),
                      Positioned(
                        left: 102,
                        top: 100,
                        child: GestureDetector(
                          onTap: pickImage,
                          child: SvgPicture.asset(KTIcons.editPicture),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                BlocBuilder<UserInfoBloc, UserInfoState>(
                  builder: (context, state) {
                    final userData = LocalStorage.getUser();
                    String? fullName = userData.fullName;
                    String? email = userData.email;
                    log("{{{{{{{{{{{{{{{{{ BlocBuilder }}}}}}}}}}}}}}}}}");
                    log("<<< $fullName >>>");
                    log("<<< $email >>>");
                    return Column(
                      children: [
                        Center(
                          child: Text(
                            "${state.fullName ?? fullName}",
                            style: ktBodyLargeStyle,
                          ),
                        ),
                        Text(
                          "${state.email ?? email}",
                          textAlign: TextAlign.center,
                          style: ktMediumStyle,
                        ),
                      ],
                    );
                  },
                ),
                10.gapY(),
                const Divider(color: KTColors.border),
                MyListTile(
                  title: lang.editProfile,
                  leading: SvgPicture.asset(KTIcons.profile2),
                  trailing: const Icon(
                    CupertinoIcons.right_chevron,
                    color: Colors.black,
                  ),
                  onTap: () => getTo(context, const EditPage()),
                ),
                MyListTile(
                  title: lang.notification,
                  leading: SvgPicture.asset(KTIcons.notification),
                  trailing: const Icon(
                    CupertinoIcons.right_chevron,
                    color: Colors.black,
                  ),
                  onTap: () =>
                      getTo(context, const NotificationSettingsPage()),
                ),
                MyListTile(
                  title: lang.payment,
                  leading: SvgPicture.asset(KTIcons.payment),
                  trailing: const Icon(
                    CupertinoIcons.right_chevron,
                    color: Colors.black,
                  ),
                  onTap: () => getTo(context, const PaymentPage()),
                ),
                MyListTile(
                  title: lang.security,
                  leading: SvgPicture.asset(KTIcons.security),
                  trailing: const Icon(
                    CupertinoIcons.right_chevron,
                    color: Colors.black,
                  ),
                  onTap: () => getTo(context, const SecurityPage()),
                ),
                MyListTile(
                  title: lang.language,
                  leading: SvgPicture.asset(KTIcons.language),
                  trailing: const Icon(
                    CupertinoIcons.right_chevron,
                    color: Colors.black,
                  ),
                  onTap: () => getTo(context, const LanguagePage()),
                ),
                MyListTile(
                  title: lang.privacyPolicy,
                  leading: SvgPicture.asset(KTIcons.privacyPolicy),
                  trailing: const Icon(
                    CupertinoIcons.right_chevron,
                    color: Colors.black,
                  ),
                  onTap: () => getTo(context, const PrivacyPolicyPage()),
                ),
                MyListTile(
                  title: lang.helpCenter,
                  leading: SvgPicture.asset(KTIcons.helpCenter),
                  trailing: const Icon(
                    CupertinoIcons.right_chevron,
                    color: Colors.black,
                  ),
                  onTap: () => getTo(context, const HelpCenterPage()),
                ),
                MyListTile(
                  title: lang.inviteFriends,
                  leading: SvgPicture.asset(KTIcons.inviteFriends),
                  trailing: const Icon(
                    CupertinoIcons.right_chevron,
                    color: Colors.black,
                  ),
                  onTap: () => getTo(context, const InviteFriends()),
                ),
                MyListTile(
                  title: lang.logout,
                  textColor: KTColors.red,
                  leading: SvgPicture.asset(KTIcons.logout),
                  onTap: () => LogoutSheets.logoutSheet(context, size),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
