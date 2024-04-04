import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../data/tools/constants/assets/icons.dart';
import '../../../../../../data/tools/constants/language/getx_translation.dart';
import '../../../../../../data/tools/constants/style/colors.dart';
import '../../../../../../data/tools/constants/style/fonts.dart';
import '../../../../../widgets/main_button.dart';
import '../../../../auth/widgets/auth_text_field.dart';

class AddNewCard extends StatefulWidget {
  const AddNewCard({super.key});

  @override
  State<AddNewCard> createState() => _AddNewCardState();
}

class _AddNewCardState extends State<AddNewCard> {
  late final TextEditingController cardNameController,
      cardNumberController,
      expireDateController;

  @override
  void initState() {
    cardNameController = TextEditingController();
    cardNumberController = TextEditingController();
    expireDateController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    cardNameController.dispose();
    cardNumberController.dispose();
    expireDateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final lang = AppLocalization();

    return Scaffold(
      backgroundColor: KTColors.white,
      appBar: AppBar(
        backgroundColor: KTColors.white,
        surfaceTintColor: KTColors.white,
        title: Text(lang.addNewCard),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            SvgPicture.asset(KTIcons.newCard),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Text(
                lang.cardName,
                style: ktBodyMediumStyle,
              ),
            ),
            AuthTextField(
              "Mocard",
              controller: cardNameController,
              keyboardType: TextInputType.name,
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Text(
                lang.cardNumber,
                style: ktBodyMediumStyle,
              ),
            ),
            AuthTextField(
              "2672 4738 7837 7285",
              inputFormatters: [maskFormatterCard],
              controller: cardNumberController,
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 8),
            Align(
              alignment: Alignment.centerLeft,
              child: SizedBox(
                width: size.width / 2,
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 8),
                      child: Text(
                        "Quyidagi sanagacha foydalanilsin",
                        style: ktBodyMediumStyle,
                      ),
                    ),
                    AuthTextField(
                      "09/27",
                      inputFormatters: [maskFormatterExpireDateCard],
                      controller: expireDateController,
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.done,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Center(
                child: MainButton(
                  lang.addNewCard,
                  size.width / 2 + 10,
                  onPressed: () {},
                  hasElevation: true,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
