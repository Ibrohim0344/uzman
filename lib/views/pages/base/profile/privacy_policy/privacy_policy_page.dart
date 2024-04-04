import 'package:flutter/material.dart';

import '../../../../../data/tools/constants/language/getx_translation.dart';
import '../../../../../data/tools/constants/style/colors.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalization();

    return Scaffold(
      backgroundColor: KTColors.white,
      appBar: AppBar(
        backgroundColor: KTColors.white,
        surfaceTintColor: KTColors.white,
        title: Text(lang.privacyPolicy),
      ),
    );
  }
}
