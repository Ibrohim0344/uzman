import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/language/language_bloc.dart';
import '../blocs/user/user_info_bloc.dart';
import '../data/storage/local_storage.dart';
import '../data/tools/constants/l10n/app_localizations.dart';
import '../views/pages/splash/splash_page.dart';
import '../data/tools/constants/style/colors.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LanguageBloc>(create: (context) => LanguageBloc()),
        BlocProvider<UserInfoBloc>(create: (context) => UserInfoBloc()),
      ],
      child: BlocBuilder<LanguageBloc, LanguageState>(
        builder: (context, state) {
          final locale = LocalStorage.getLang();

          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: KTColors.mainRed),
              fontFamily: "Urbanist",
            ),
            title: "UZMAN",
            supportedLocales: AppLocalizations.supportedLocales,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            locale: Locale(state.locale ?? locale),
            home: const SplashPage(),
          );
        },
      ),
    );
  }
}
