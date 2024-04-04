import 'package:flutter/material.dart';

import '../../../../../data/tools/constants/language/getx_translation.dart';
import '../../../../../data/tools/constants/style/colors.dart';
import '../widgets/my_list_tile.dart';
import '../widgets/my_switch.dart';
import 'widgets/security_button.dart';

class SecurityPage extends StatefulWidget {
  const SecurityPage({super.key});

  @override
  State<SecurityPage> createState() => _SecurityPageState();
}

class _SecurityPageState extends State<SecurityPage> {
  List<bool> turnOn = List.filled(3, true);
  List<String> titles = [];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final lang = AppLocalization();
    titles = [
      lang.rememberMe,
      "Face ID",
      lang.biometricID,
    ];

    return Scaffold(
      backgroundColor: KTColors.white,
      appBar: AppBar(
        backgroundColor: KTColors.white,
        surfaceTintColor: KTColors.white,
        title: Text(lang.security),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            ...List.generate(
              turnOn.length,
              (index) => MyListTile(
                title: titles[index],
                trailing: MySwitch(
                  value: turnOn[index],
                  onChanged: (bool value) {
                    setState(() => turnOn[index] = value);
                  },
                ),
              ),
            ),
            const SizedBox(height: 16),
            SecurityButton(
              lang.changePinCode,
              size.width,
              onPressed: () {},
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: SecurityButton(
                lang.changePassword,
                size.width,
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
