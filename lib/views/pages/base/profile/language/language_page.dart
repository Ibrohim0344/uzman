import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../blocs/language/language_bloc.dart';
import '../../../../../data/storage/local_storage.dart';
import '../../../../../data/tools/constants/l10n/app_localizations.dart';
import '../../../../../data/tools/constants/style/colors.dart';

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
    final lang = AppLocalizations.of(context);

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
              groupValue = value!;
              context.read<LanguageBloc>().add(ChangeLanguage(value));
            },
          ),
        ),
      ),
    );
  }
}
