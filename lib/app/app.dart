import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import '../data/storage/local_storage.dart';
import '../views/pages/splash/splash_page.dart';
import '../data/tools/constants/style/colors.dart';
import '../data/tools/constants/language/getx_translation.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final locale = LocalStorage.getLang();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: KTColors.mainRed),
        fontFamily: "Urbanist",
      ),
      title: "UZMAN",
      locale: Locale(locale),
      fallbackLocale: Locale(locale),
      translations: LocalizationsGetX(),
      home: const SplashPage(),
    );
  }
}
