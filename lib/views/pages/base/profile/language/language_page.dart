import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../data/storage/local_storage.dart';
import '../../../../../data/tools/constants/language/getx_translation.dart';
import '../../../../../data/tools/constants/style/colors.dart';

// final languageController = Get.put(LocalizationGetXController());

class LanguagePage extends StatefulWidget {
  const LanguagePage({super.key});

  @override
  State<LanguagePage> createState() => _LanguagePageState();
}

class _LanguagePageState extends State<LanguagePage> {
  List<String> languages = ["O'zbek", "Русский", "English"];

  List<String> values = ["uz", "ru", "en"];

  String groupValue = LocalStorage.getLang();

  void saveAppLang(String lang) {
    LocalStorage.saveLang(lang);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalization();
    // final locale = languageController;

    return Scaffold(
      backgroundColor: KTColors.white,
      appBar: AppBar(
        leading: BackButton(
          onPressed: () => saveAppLang(groupValue),
        ),
        title: Text(lang.language),
        backgroundColor: KTColors.white,
        surfaceTintColor: KTColors.white,
      ),
      body: Column(
        children: List.generate(
          languages.length,
          (index) => RadioListTile.adaptive(
            title: Text(languages[index]),
            value: values[index],
            groupValue: groupValue,
            onChanged: (value) {
              // locale.changeLanguage(value!);
              Get.updateLocale(Locale(value!));
              groupValue = value;
            },
          ),
        ),
      ),
    );
  }
}
