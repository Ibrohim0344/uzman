import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../blocs/user/user_info_bloc.dart';
import '../../../../../data/storage/local_storage.dart';
import '../../../../../data/tools/constants/assets/icons.dart';
import '../../../../../data/tools/constants/l10n/app_localizations.dart';
import '../../../../../data/tools/constants/style/colors.dart';
import '../../../../../data/tools/constants/style/fonts.dart';
import '../../../../../domains/entities/user/user_local_info.dart';
import '../../../../widgets/main_button.dart';
import '../../../auth/widgets/auth_text_field.dart';

class EditPage extends StatefulWidget {
  const EditPage({super.key});

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  late final TextEditingController nameController,
      emailController,
      birthController,
      phoneController,
      addressController;

  final double gap = 14;
  String? fullName, email, dateOfBirth, phone, address;
  Gender gender = LocalStorage.getUser().gender;
  Set<String> _selected = {};

  void getUserData() {
    final userData = LocalStorage.getUser();
    fullName = userData.fullName ?? "Full Name";
    email = userData.email ?? "andrew_ainsley@yourdomain.com";
    dateOfBirth = userData.dateOfBirth ?? "12/27/1995";
    phone = userData.phone ?? "+998 ";
    address = userData.address ?? "267 New Avenue Park, New York";
    gender = userData.gender;
  }

  void updateUserChanges() {
    context.read<UserInfoBloc>().add(
          UpdateUserInfo(
            fullName: nameController.text.trim(),
            email: emailController.text.trim(),
            dateOfBirth: birthController.text.trim(),
            phone: phoneController.text.trim(),
            gender: gender,
            address: addressController.text.trim(),
          ),
        );
    Navigator.pop(context);
  }

  void updateSelected(Set<String> newCollection) {
    _selected = newCollection;
    gender =
        Gender.male.name == newCollection.first ? Gender.male : Gender.female;
    setState(() {});
  }

  @override
  void initState() {
    getUserData();
    nameController = TextEditingController();
    emailController = TextEditingController();
    birthController = TextEditingController();
    phoneController = TextEditingController();
    addressController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    birthController.dispose();
    phoneController.dispose();
    addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);
    final size = MediaQuery.sizeOf(context);
    nameController.text = fullName ?? "";
    emailController.text = email ?? "";
    birthController.text = dateOfBirth ?? "";
    phoneController.text = phone ?? "";
    addressController.text = address ?? "";
    _selected.add(gender.name);

    return Scaffold(
      backgroundColor: KTColors.white,
      appBar: AppBar(
        titleSpacing: 0,
        title: Text(lang.editProfile),
        backgroundColor: KTColors.white,
        surfaceTintColor: KTColors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            AuthTextField(
              "$fullName",
              controller: nameController,
              keyboardType: TextInputType.name,
            ),
            SizedBox(height: gap),
            AuthTextField(
              "$email",
              controller: emailController,
              suffixIcon: SvgPicture.asset(KTIcons.emailOutlined),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: gap),
            AuthTextField(
              "$dateOfBirth",
              controller: birthController,
              suffixIcon: SvgPicture.asset(KTIcons.calendarOutlined),
              inputFormatters: [maskFormatterDateOfBirth],
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: gap),
            AuthTextField(
              "$phone",
              controller: phoneController,
              prefixIcon: SvgPicture.asset(KTIcons.flagUzb),
              inputFormatters: [maskFormatterPhoneNumber],
              keyboardType: TextInputType.phone,
            ),
            SizedBox(height: gap),
            SegmentedButton(
              segments: <ButtonSegment<String>>[
                ButtonSegment<String>(
                  value: Gender.male.name,
                  label: Text(
                    "Male",
                    style: ktHintStyle.copyWith(color: KTColors.black),
                  ),
                ),
                ButtonSegment<String>(
                  value: Gender.female.name,
                  label: Text(
                    "Female",
                    style: ktHintStyle.copyWith(color: KTColors.black),
                  ),
                ),
              ],
              selected: _selected,
              onSelectionChanged: updateSelected,
              // showSelectedIcon: false,
              style: OutlinedButton.styleFrom(
                backgroundColor: KTColors.textFieldBG,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12))),
                side: const BorderSide(
                  width: .5,
                  color: KTColors.lightGrey,
                ),
              ),
            ),
            SizedBox(height: gap),
            AuthTextField(
              "$address",
              controller: addressController,
              textInputAction: TextInputAction.done,
              keyboardType: TextInputType.streetAddress,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 16,
                // horizontal: size.width < 385 ? 120 : size.width / 3,
                horizontal: size.width / 3 - 20,
              ),
              child: MainButton(
                lang.update,
                size.width,
                onPressed: updateUserChanges,
                hasElevation: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
